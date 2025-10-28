#!/usr/bin/env python3
"""
Gera SQLs otimizados para limpeza e repopulação do banco PULSO Finance
Usa os dados limpos de data/seeds/ em vez dos 143 lotes yampa
"""

import csv
import json
from pathlib import Path
from datetime import datetime
from typing import Dict, List, Any

# Caminhos
BASE_DIR = Path(__file__).parent.parent
SEEDS_DIR = BASE_DIR / "data" / "seeds"
OUTPUT_DIR = BASE_DIR / "database" / "seeds"
OUTPUT_DIR.mkdir(exist_ok=True)

# Mapeamento de lojas (código -> nome no CSV)
LOJAS_MAP = {
    'MAU': 'Mauá',
    'PER': 'Perus', 
    'RIO': 'Rio Pequeno',
    'SUZ': 'Suzano'
}

def gerar_sql_limpeza() -> str:
    """Gera SQL para limpar todas as tabelas em ordem de dependência"""
    
    sql = """-- =====================================================
-- LIMPEZA DO BANCO PULSO FINANCE
-- Remove todos os dados mantendo estrutura e constraints
-- Gerado em: {timestamp}
-- =====================================================

-- Desabilitar triggers temporariamente para performance
SET session_replication_role = replica;

-- Limpar em ordem reversa de dependências
TRUNCATE TABLE auditoria CASCADE;
TRUNCATE TABLE conciliacoes CASCADE;
TRUNCATE TABLE extratos_bancarios CASCADE;
TRUNCATE TABLE parcelas CASCADE;
TRUNCATE TABLE lancamentos CASCADE;
TRUNCATE TABLE fornecedores CASCADE;
TRUNCATE TABLE formas_pagamento CASCADE;
TRUNCATE TABLE contas_financeiras CASCADE;
TRUNCATE TABLE centros_custo CASCADE;
TRUNCATE TABLE plano_contas CASCADE;
TRUNCATE TABLE usuarios CASCADE;
TRUNCATE TABLE lojas CASCADE;

-- Reabilitar triggers
SET session_replication_role = DEFAULT;

-- Refresh views materializadas
REFRESH MATERIALIZED VIEW mv_dre_mensal;
REFRESH MATERIALIZED VIEW mv_fluxo_caixa;

SELECT 'Limpeza concluída com sucesso!' as resultado;
""".format(timestamp=datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    
    return sql


def ler_csv(filename: str) -> List[Dict[str, Any]]:
    """Lê um arquivo CSV e retorna lista de dicionários"""
    filepath = SEEDS_DIR / filename
    if not filepath.exists():
        print(f"⚠️  Arquivo não encontrado: {filename}")
        return []
    
    with open(filepath, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        return list(reader)


def gerar_insert_lojas(lojas: List[Dict]) -> str:
    """Gera INSERTs para lojas"""
    
    sql = "\n-- =====================================================\n"
    sql += "-- LOJAS\n"
    sql += "-- =====================================================\n\n"
    
    for loja in lojas:
        codigo = loja['codigo'].strip()
        nome = loja['nome'].strip()
        ativo = loja['ativo'].lower() == 'true'
        
        sql += f"""INSERT INTO lojas (id, codigo, nome, ativa, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    '{codigo}',
    '{nome}',
    {ativo},
    NOW(),
    NOW()
);\n\n"""
    
    return sql


def gerar_insert_plano_contas(contas: List[Dict]) -> str:
    """Gera INSERTs para plano de contas com hierarquia"""
    
    sql = "\n-- =====================================================\n"
    sql += "-- PLANO DE CONTAS\n"
    sql += "-- =====================================================\n\n"
    
    # Calcular nível baseado na quantidade de pontos no código
    for conta in contas:
        codigo = str(conta['codigo'])
        nivel = codigo.count('.') + 1
        conta['nivel'] = nivel
    
    # Processar em níveis (primeiro raiz, depois filhos)
    contas_por_nivel = {}
    for conta in contas:
        nivel = int(conta['nivel'])
        if nivel not in contas_por_nivel:
            contas_por_nivel[nivel] = []
        contas_por_nivel[nivel].append(conta)
    
    # Mapear código -> UUID para referências pai
    codigo_uuid = {}
    
    for nivel in sorted(contas_por_nivel.keys()):
        sql += f"\n-- Nível {nivel}\n"
        
        for conta in contas_por_nivel[nivel]:
            codigo = str(conta['codigo']).strip()
            nome = str(conta['nome']).strip().replace("'", "''")
            tipo = str(conta['tipo']).strip()
            
            # codigo_pai pode ser NaN no pandas
            codigo_pai_raw = conta.get('codigo_pai', '')
            if codigo_pai_raw is None or (isinstance(codigo_pai_raw, float) and str(codigo_pai_raw) == 'nan'):
                codigo_pai = ''
            else:
                codigo_pai = str(codigo_pai_raw).strip()
            
            ativo = str(conta.get('ativo', 'true')).lower() == 'true'
            
            # Mapear tipo para categoria_conta enum
            # Os tipos válidos são: receita, custo, despesa, investimento, outros
            categoria_map = {
                'receita': 'receita',
                'despesa': 'despesa',
                'custo': 'custo',
                'investimento': 'investimento',
                'outros': 'outros'
            }
            categoria = categoria_map.get(tipo.lower(), 'outros')
            
            # tipo_conta enum: receita ou despesa
            tipo_conta = 'receita' if tipo.lower() == 'receita' else 'despesa'
            
            # UUID do pai
            pai_ref = f"(SELECT id FROM plano_contas WHERE codigo = '{codigo_pai}')" if codigo_pai else 'NULL'
            
            uuid_var = f"plano_{codigo.replace('.', '_')}"
            codigo_uuid[codigo] = uuid_var
            
            sql += f"""DO $$
DECLARE
    {uuid_var} UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        {uuid_var},
        '{codigo}',
        '{nome}',
        '{categoria}'::categoria_conta,
        '{tipo_conta}'::tipo_conta,
        {nivel},
        {pai_ref},
        {ativo},
        NOW()
    );
END $$;

"""
    
    return sql


def gerar_insert_centros_custo(centros: List[Dict]) -> str:
    """Gera INSERTs para centros de custo"""
    
    sql = "\n-- =====================================================\n"
    sql += "-- CENTROS DE CUSTO\n"
    sql += "-- =====================================================\n\n"
    
    for centro in centros:
        codigo = centro['codigo'].strip().replace("'", "''")
        nome = centro['nome'].strip().replace("'", "''")
        descricao = centro.get('descricao', '').strip().replace("'", "''")
        ativo = centro['ativo'].lower() == 'true'
        
        # Associar a uma loja padrão (primeira loja) por enquanto
        sql += f"""INSERT INTO centros_custo (id, loja_id, codigo, nome, descricao, ativo, created_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    '{codigo}',
    '{nome}',
    '{descricao}',
    {ativo},
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM centros_custo WHERE codigo = '{codigo}'
);

"""
    
    return sql


def gerar_insert_contas_financeiras(contas: List[Dict]) -> str:
    """Gera INSERTs para contas financeiras"""
    
    sql = "\n-- =====================================================\n"
    sql += "-- CONTAS FINANCEIRAS\n"
    sql += "-- =====================================================\n\n"
    
    for conta in contas:
        nome = conta['nome'].strip().replace("'", "''")
        tipo_raw = conta['tipo'].strip().lower()
        saldo = float(conta.get('saldo_inicial', 0))
        ativo = conta['ativo'].lower() == 'true'
        
        # Mapear tipo
        tipo_map = {
            'banco': 'conta_corrente',
            'caixa': 'caixa',
            'outros': 'investimento'
        }
        tipo = tipo_map.get(tipo_raw, 'conta_corrente')
        
        sql += f"""INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    '{tipo}'::tipo_conta_financeira,
    '{nome}',
    {saldo},
    {saldo},
    {ativo},
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = '{nome}'
);

"""
    
    return sql


def gerar_insert_fornecedores_batch(fornecedores: List[Dict], batch_size: int = 1000) -> str:
    """Gera INSERTs para fornecedores em lotes"""
    
    sql = "\n-- =====================================================\n"
    sql += f"-- FORNECEDORES ({len(fornecedores)} registros)\n"
    sql += "-- =====================================================\n\n"
    
    total = len(fornecedores)
    for i in range(0, total, batch_size):
        batch = fornecedores[i:i+batch_size]
        batch_num = (i // batch_size) + 1
        total_batches = (total + batch_size - 1) // batch_size
        
        sql += f"\n-- Lote {batch_num}/{total_batches} ({len(batch)} registros)\n"
        sql += "INSERT INTO fornecedores (id, nome, tipo_pessoa, documento, ativo, created_at, updated_at)\nVALUES\n"
        
        values = []
        for fornecedor in batch:
            nome = fornecedor['nome'].strip().replace("'", "''")
            tipo = fornecedor.get('tipo', 'juridica').strip()
            documento = fornecedor.get('documento', '').strip().replace("'", "''")
            ativo = fornecedor.get('ativo', 'true').lower() == 'true'
            
            values.append(f"    (gen_random_uuid(), '{nome}', '{tipo}', " + 
                         (f"'{documento}'" if documento else "NULL") + 
                         f", {ativo}, NOW(), NOW())")
        
        sql += ",\n".join(values) + "\n"
        sql += "ON CONFLICT DO NOTHING;\n\n"
    
    return sql


def gerar_insert_lancamentos_batch(lancamentos: List[Dict], parcelas: List[Dict], batch_size: int = 500) -> str:
    """Gera INSERTs para lançamentos + parcelas em lotes"""
    
    sql = "\n-- =====================================================\n"
    sql += f"-- LANÇAMENTOS + PARCELAS ({len(lancamentos)} lançamentos, {len(parcelas)} parcelas)\n"
    sql += "-- =====================================================\n\n"
    
    # Criar mapa de parcelas por lançamento
    parcelas_map = {}
    for parcela in parcelas:
        lanc_id = parcela['lancamento_id']
        if lanc_id not in parcelas_map:
            parcelas_map[lanc_id] = []
        parcelas_map[lanc_id].append(parcela)
    
    total = len(lancamentos)
    for i in range(0, total, batch_size):
        batch = lancamentos[i:i+batch_size]
        batch_num = (i // batch_size) + 1
        total_batches = (total + batch_size - 1) // batch_size
        
        sql += f"\n-- Lote {batch_num}/{total_batches} ({len(batch)} lançamentos)\n"
        
        for lanc in batch:
            lanc_id_original = lanc['id']
            tipo = lanc['tipo']
            descricao = lanc['descricao'].replace("'", "''")
            historico = lanc.get('historico', '').replace("'", "''")
            competencia = lanc['competencia']
            valor = float(lanc['valor_total'])
            num_parcelas = int(lanc['num_parcelas'])
            
            # Gerar lançamento
            sql += f"""
-- {descricao[:50]}...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        '{tipo}'::tipo_lancamento,
        plano_id_ref,
        NULL,
        '{descricao}',
        '{historico}',
        '{competencia}'::date,
        {valor},
        {num_parcelas},
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );
"""
            
            # Gerar parcelas associadas
            if lanc_id_original in parcelas_map:
                for parcela in parcelas_map[lanc_id_original]:
                    parcela_num = int(parcela['parcela'])
                    vencimento = parcela['vencimento']
                    valor_parcela = float(parcela['valor'])
                    status = parcela['status']
                    valor_pago = parcela.get('valor_pago', '')
                    data_pagamento = parcela.get('data_pagamento', '')
                    
                    valor_pago_sql = valor_pago if valor_pago else 'NULL'
                    data_pag_sql = f"'{data_pagamento}'::date" if data_pagamento else 'NULL'
                    
                    sql += f"""
    -- Parcela {parcela_num}/{num_parcelas}
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        {parcela_num},
        '{vencimento}'::date,
        {valor_parcela},
        '{status}'::status_parcela,
        {valor_pago_sql},
        {data_pag_sql},
        NOW(),
        NOW()
    );
"""
            
            sql += "END $$;\n"
    
    return sql


def main():
    """Função principal"""
    
    print("🚀 Iniciando geração de SQLs limpos...")
    print(f"📂 Base: {SEEDS_DIR}")
    print(f"📤 Output: {OUTPUT_DIR}")
    print()
    
    # 1. SQL de limpeza
    print("1️⃣  Gerando SQL de limpeza...")
    sql_limpeza = gerar_sql_limpeza()
    
    output_limpeza = OUTPUT_DIR / "01_limpar_banco.sql"
    with open(output_limpeza, 'w', encoding='utf-8') as f:
        f.write(sql_limpeza)
    print(f"   ✅ Gerado: {output_limpeza.name}")
    
    # 2. Carregar dados dos CSVs
    print("\n2️⃣  Carregando dados dos CSVs...")
    lojas = ler_csv('lojas.csv')
    plano_contas = ler_csv('plano_contas.csv')
    centros = ler_csv('centros_custos.csv')
    contas_fin = ler_csv('contas_financeiras.csv')
    fornecedores = ler_csv('fornecedores.csv')
    lancamentos = ler_csv('lancamentos_import.csv')
    parcelas = ler_csv('parcelas_import.csv')
    
    print(f"   - Lojas: {len(lojas)}")
    print(f"   - Plano de contas: {len(plano_contas)}")
    print(f"   - Centros de custo: {len(centros)}")
    print(f"   - Contas financeiras: {len(contas_fin)}")
    print(f"   - Fornecedores: {len(fornecedores)}")
    print(f"   - Lançamentos: {len(lancamentos)}")
    print(f"   - Parcelas: {len(parcelas)}")
    
    # 3. Gerar SQL de população - Parte 1 (Mestres)
    print("\n3️⃣  Gerando SQL de população - Mestres...")
    
    sql_mestres = f"""-- =====================================================
-- POVOAMENTO PULSO FINANCE - PARTE 1: TABELAS MESTRES
-- Gerado em: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
-- =====================================================

-- Desabilitar triggers temporariamente para performance
SET session_replication_role = replica;

"""
    
    sql_mestres += gerar_insert_lojas(lojas)
    sql_mestres += gerar_insert_plano_contas(plano_contas)
    sql_mestres += gerar_insert_centros_custo(centros)
    sql_mestres += gerar_insert_contas_financeiras(contas_fin)
    sql_mestres += gerar_insert_fornecedores_batch(fornecedores)
    
    sql_mestres += """
-- Reabilitar triggers
SET session_replication_role = DEFAULT;

SELECT 'Tabelas mestres povoadas com sucesso!' as resultado;
"""
    
    output_mestres = OUTPUT_DIR / "02_povoar_mestres.sql"
    with open(output_mestres, 'w', encoding='utf-8') as f:
        f.write(sql_mestres)
    print(f"   ✅ Gerado: {output_mestres.name}")
    
    # 4. Gerar SQL de população - Parte 2 (Transacionais)
    print("\n4️⃣  Gerando SQL de população - Transacionais...")
    
    sql_trans = f"""-- =====================================================
-- POVOAMENTO PULSO FINANCE - PARTE 2: LANÇAMENTOS
-- Gerado em: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
-- =====================================================

-- Desabilitar triggers temporariamente para performance
SET session_replication_role = replica;

"""
    
    sql_trans += gerar_insert_lancamentos_batch(lancamentos, parcelas)
    
    sql_trans += """
-- Reabilitar triggers
SET session_replication_role = DEFAULT;

-- Refresh views materializadas
REFRESH MATERIALIZED VIEW mv_dre_mensal;
REFRESH MATERIALIZED VIEW mv_fluxo_caixa;

SELECT 'Lançamentos e parcelas povoados com sucesso!' as resultado;
"""
    
    output_trans = OUTPUT_DIR / "03_povoar_transacionais.sql"
    with open(output_trans, 'w', encoding='utf-8') as f:
        f.write(sql_trans)
    print(f"   ✅ Gerado: {output_trans.name}")
    
    # 5. Gerar script master de execução
    print("\n5️⃣  Gerando script de execução...")
    
    script_exec = f"""-- =====================================================
-- SCRIPT MASTER DE EXECUÇÃO
-- Executa limpeza + população completa
-- Gerado em: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
-- =====================================================

-- AVISO: Este script irá LIMPAR TODOS OS DADOS do banco!
-- Execute apenas em ambiente de desenvolvimento/homologação!

\\echo '=================================================='
\\echo 'PULSO Finance - Limpeza e Repopulação'
\\echo '=================================================='
\\echo ''

\\echo 'Etapa 1/3: Limpando banco...'
\\i 01_limpar_banco.sql

\\echo ''
\\echo 'Etapa 2/3: Povoando tabelas mestres...'
\\i 02_povoar_mestres.sql

\\echo ''
\\echo 'Etapa 3/3: Povoando lançamentos e parcelas...'
\\i 03_povoar_transacionais.sql

\\echo ''
\\echo '=================================================='
\\echo '✅ CONCLUÍDO!'
\\echo '=================================================='
\\echo ''
\\echo 'Resumo:'
\\echo '  - Lojas: {len(lojas)}'
\\echo '  - Plano de contas: {len(plano_contas)}'
\\echo '  - Centros de custo: {len(centros)}'
\\echo '  - Contas financeiras: {len(contas_fin)}'
\\echo '  - Fornecedores: {len(fornecedores)}'
\\echo '  - Lançamentos: {len(lancamentos)}'
\\echo '  - Parcelas: {len(parcelas)}'
\\echo ''
"""
    
    output_exec = OUTPUT_DIR / "00_EXECUTAR_TUDO.sql"
    with open(output_exec, 'w', encoding='utf-8') as f:
        f.write(script_exec)
    print(f"   ✅ Gerado: {output_exec.name}")
    
    # 6. Gerar README
    print("\n6️⃣  Gerando documentação...")
    
    readme = f"""# 🔄 Scripts de Limpeza e Povoamento - PULSO Finance

Gerado em: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}

## 📋 Arquivos Gerados

1. **00_EXECUTAR_TUDO.sql** - Script master que executa todos os passos
2. **01_limpar_banco.sql** - Limpeza de todas as tabelas
3. **02_povoar_mestres.sql** - População de tabelas mestres (lojas, plano de contas, etc)
4. **03_povoar_transacionais.sql** - População de lançamentos e parcelas

## 📊 Dados a Serem Importados

- **Lojas:** {len(lojas)} registros
- **Plano de Contas:** {len(plano_contas)} contas
- **Centros de Custo:** {len(centros)} centros
- **Contas Financeiras:** {len(contas_fin)} contas
- **Fornecedores:** {len(fornecedores):,} fornecedores
- **Lançamentos:** {len(lancamentos):,} lançamentos
- **Parcelas:** {len(parcelas):,} parcelas

## 🚀 Como Executar

### Opção 1: Via MCP Supabase (Recomendado)

Use o script Python auxiliar para executar via MCP:

```bash
python scripts/executar_via_mcp.py
```

### Opção 2: Via psql Direto

```bash
cd database/seeds
psql "postgresql://postgres:[SUA_SENHA]@db.fxsgphqzazcbjcyfqeyg.supabase.co:5432/postgres" -f 00_EXECUTAR_TUDO.sql
```

### Opção 3: Executar Manualmente Cada Etapa

```bash
# 1. Limpar
psql "..." -f 01_limpar_banco.sql

# 2. Mestres
psql "..." -f 02_povoar_mestres.sql

# 3. Transacionais
psql "..." -f 03_povoar_transacionais.sql
```

## ⚠️ IMPORTANTE

- ❌ **NÃO execute em produção sem backup!**
- ✅ Sempre teste em ambiente de desenvolvimento primeiro
- 🔒 O script `01_limpar_banco.sql` irá **APAGAR TODOS OS DADOS**
- ⏱️ A execução pode levar alguns minutos devido ao volume de dados

## 🔍 Validação Pós-Execução

Após executar, valide os dados:

```sql
-- Contar registros
SELECT 'lojas' as tabela, COUNT(*) as total FROM lojas
UNION ALL
SELECT 'plano_contas', COUNT(*) FROM plano_contas
UNION ALL
SELECT 'fornecedores', COUNT(*) FROM fornecedores
UNION ALL
SELECT 'lancamentos', COUNT(*) FROM lancamentos
UNION ALL
SELECT 'parcelas', COUNT(*) FROM parcelas;

-- Verificar integridade referencial
SELECT 
    l.id,
    l.descricao,
    l.plano_id IS NOT NULL as tem_plano,
    l.loja_id IS NOT NULL as tem_loja
FROM lancamentos l
WHERE l.plano_id IS NULL OR l.loja_id IS NULL
LIMIT 10;
```

## 📝 Observações

- Os dados são importados de `data/seeds/*.csv`
- Substituem os 143 lotes yampa anteriores por dados consolidados
- Todos os UUIDs são regenerados no momento da importação
- Status de aprovação padrão: `aprovado`
- Origem padrão: `migracao_yampa`
"""
    
    output_readme = OUTPUT_DIR / "README.md"
    with open(output_readme, 'w', encoding='utf-8') as f:
        f.write(readme)
    print(f"   ✅ Gerado: {output_readme.name}")
    
    print("\n" + "="*60)
    print("✅ GERAÇÃO CONCLUÍDA!")
    print("="*60)
    print(f"\n📁 Arquivos gerados em: {OUTPUT_DIR}")
    print("\n📋 Próximos passos:")
    print("   1. Revisar os arquivos .sql gerados")
    print("   2. Executar via MCP ou psql")
    print("   3. Validar dados importados")
    print()


if __name__ == "__main__":
    main()
