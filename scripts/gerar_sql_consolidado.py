#!/usr/bin/env python3#!/usr/bin/env python3

# -*- coding: utf-8 -*-# -*- coding: utf-8 -*-

""""""

Gera arquivos SQL de migração com dados consolidados do YAMPAGera arquivos SQL de migração com dados consolidados do YAMPA

Corrige formatação brasileira de valores monetáriosCorrige formatação brasileira de valores monetários

""""""



import pandas as pdimport pandas as pd

import uuidimport uuid

import osimport os

import mathimport math

from datetime import datetime

import mathfrom datetime import datetime

# Configurações

PASTA_BASE = 'd:/projetos/pulso_finance/data/base'import re

REGISTROS_POR_ARQUIVO = 150

from datetime import datetime# Configurações

# UUIDs pré-definidos dos planos de conta

PLANOS_CONTAS = {PASTA_BASE = 'd:/projetos/pulso_finance/data/base'

    'VENDAS': '3cdba05e-54f4-4e55-a3c0-f882c6a4dc47',

    'SALARIO': '7f8a9b2c-3d4e-5f6a-7b8c-9d0e1f2a3b4c',# ConfiguraçõesPASTA_SEEDS = 'd:/projetos/pulso_finance/database/seeds'

    'VALE': '8e9f0a1b-2c3d-4e5f-6a7b-8c9d0e1f2a3b',

    'FRANQUIA': '9f0a1b2c-3d4e-5f6a-7b8c-9d0e1f2a3b4c',PASTA_BASE = 'd:/projetos/pulso_finance/data/base'REGISTROS_POR_ARQUIVO = 150

    'ALUGUEL': 'a0b1c2d3-4e5f-6a7b-8c9d-0e1f2a3b4c5d',

    'COMBUSTIVEL': 'b1c2d3e4-5f6a-7b8c-9d0e-1f2a3b4c5d6e',PASTA_SEEDS = 'd:/projetos/pulso_finance/database/seeds'

    'MERCADO': 'c2d3e4f5-6a7b-8c9d-0e1f-2a3b4c5d6e7f',

    'PAPELARIA': 'd3e4f5a6-7b8c-9d0e-1f2a-3b4c5d6e7f8a',REGISTROS_POR_ARQUIVO = 150# UUIDs fixos para o sistema

    'DEFAULT': 'e4f5a6b7-8c9d-0e1f-2a3b-4c5d6e7f8a9b'

}LOJA_UUID = '3704fcce-6e02-411d-a0ad-d96de801345a'  # Yampa Ótica



def limpar_valor_brasileiro(valor_str):# UUIDs fixos para o sistemaUSER_UUID = '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'  # Sistema

    """Converte string monetária brasileira para float"""

    if pd.isna(valor_str) or valor_str == '' or valor_str == '-':LOJA_UUID = '3704fcce-6e02-411d-a0ad-d96de801345a'  # Yampa ÓticaFORMA_PAGAMENTO_UUID = 'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'  # PIX

        return 0.0

    USER_UUID = '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'  # Sistema

    valor_clean = str(valor_str).strip()

    valor_clean = valor_clean.replace('R$', '').replace(' ', '')FORMA_PAGAMENTO_UUID = 'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'  # PIX# Mapeamento de planos de contas

    

    # Remove pontos de milhares (formato brasileiro)PLANOS_CONTAS = {

    if valor_clean.count('.') > 1 or (valor_clean.count('.') == 1 and valor_clean.count(',') == 1):

        valor_clean = valor_clean.replace('.', '', valor_clean.count('.') - 1)# Mapeamento de planos de contas    'TAXAS BANCARIAS': '96cebc3d-191f-4881-83af-66da5e56b1f8',

    elif valor_clean.count('.') == 1 and valor_clean.count(',') == 0:

        # Se só tem um ponto e sem vírgula, assumir que é separador decimal em inglêsPLANOS_CONTAS = {    'VENDAS': '3cdba05e-54f4-4e55-a3c0-f882c6a4dc47',

        valor_clean = valor_clean.replace('.', ',')

        'TAXAS BANCARIAS': '96cebc3d-191f-4881-83af-66da5e56b1f8',    'COMPRAS': '96cebc3d-191f-4881-83af-66da5e56b1f8',

    # Troca vírgula por ponto para Python

    valor_clean = valor_clean.replace(',', '.')    'VENDAS': '3cdba05e-54f4-4e55-a3c0-f882c6a4dc47',    'DEFAULT': '96cebc3d-191f-4881-83af-66da5e56b1f8'

    

    try:    'COMPRAS': '96cebc3d-191f-4881-83af-66da5e56b1f8',}

        return float(valor_clean)

    except:    'DEFAULT': '96cebc3d-191f-4881-83af-66da5e56b1f8'

        return 0.0

}def mapear_plano_conta(plano_str):

def mapear_plano_conta(plano_str):

    """Mapeia plano de conta para UUID"""    """Mapeia plano de conta para UUID"""

    if pd.isna(plano_str):

        return PLANOS_CONTAS['DEFAULT']def limpar_valor_brasileiro(valor_str):    if pd.isna(plano_str):

    

    plano_upper = str(plano_str).upper().strip()    """Converte string monetária brasileira para float"""        return PLANOS_CONTAS['DEFAULT']

    

    for key, uuid_val in PLANOS_CONTAS.items():    if pd.isna(valor_str) or valor_str == '' or str(valor_str) == 'nan':    

        if key in plano_upper:

            return uuid_val        return 0.0    plano_upper = str(plano_str).upper().strip()

    

    return PLANOS_CONTAS['DEFAULT']        



def determinar_tipo(valor_receber, valor_pagar):    # Remove espaços e caracteres especiais    for key, uuid_val in PLANOS_CONTAS.items():

    """Determina se é 'receber' ou 'pagar'"""

    if valor_receber > 0:    valor_clean = str(valor_str).strip()        if key in plano_upper:

        return 'receber', valor_receber

    elif valor_pagar < 0:    valor_clean = valor_clean.replace('R$', '').replace(' ', '')            return uuid_val

        return 'pagar', abs(valor_pagar)

    else:        

        return 'receber', 0.0

    # Remover caracteres não numéricos, mantendo apenas dígitos, vírgula, ponto e sinal negativo    return PLANOS_CONTAS['DEFAULT']

def gerar_uuid():

    """Gera UUID único"""    valor_clean = re.sub(r'[^\d\-\.,]', '', valor_clean)

    return str(uuid.uuid4())

    def determinar_tipo_lancamento(valor_receber, valor_pagar):

def processar_linha(row, linha_num):

    """Processa uma linha do CSV para SQL"""    if valor_clean == '' or valor_clean == '-':    """Determina se é 'receber' ou 'pagar'"""

    try:

        # Extrair dados        return 0.0    if valor_receber > 0:

        data = row['Data']

        historico = str(row.get('Histórico', ''))[:500]  # Limitar tamanho            return 'receber', valor_receber

        valor_receber = limpar_valor_brasileiro(row.get('Valor a receber', 0))

        valor_pagar = limpar_valor_brasileiro(row.get('Valor a pagar', 0))    try:    elif valor_pagar < 0:

        

        # Determinar tipo e valor        # Formato brasileiro: 1.234.567,89        return 'pagar', abs(valor_pagar)

        tipo, valor = determinar_tipo(valor_receber, valor_pagar)

                if ',' in valor_clean:    else:

        if valor == 0:

            return None            # Se há vírgula, tudo antes dela são milhares, depois dela são centavos        return 'pagar', 0.01  # Valor mínimo para evitar constraint

        

        # Mapear plano de conta            partes = valor_clean.split(',')

        plano_conta_id = mapear_plano_conta(historico)

                    if len(partes) == 2:def determinar_status_parcela(tipo, valor_recebido, valor_pago, valor_total):

        # Gerar SQL

        sql = f"""INSERT INTO movimentacoes_financeiras (                # Remover pontos da parte inteira (separadores de milhar)    """Determina status da parcela"""

    id, data_movimentacao, tipo, valor, descricao, 

    plano_conta_id, created_at, updated_at                parte_inteira = partes[0].replace('.', '')    if tipo == 'receber':

) VALUES (

    '{gerar_uuid()}',                parte_decimal = partes[1]        if valor_recebido > 0:

    '{data}',

    '{tipo}',                            return 'pago', valor_recebido, valor_recebido

    {valor:.2f},

    '{historico.replace("'", "''")}',                # Garantir que parte decimal tenha no máximo 2 dígitos        else:

    '{plano_conta_id}',

    NOW(),                if len(parte_decimal) > 2:            return 'pendente', valor_total, None

    NOW()

);"""                    parte_decimal = parte_decimal[:2]    else:  # pagar

        

        return sql                        if valor_pago > 0:

        

    except Exception as e:                valor_final = f"{parte_inteira}.{parte_decimal}"            return 'pago', valor_pago, valor_pago

        print(f"⚠️ Erro na linha {linha_num}: {e}")

        return None                return float(valor_final)        else:



def main():        else:            return 'pendente', valor_total, None

    """Função principal"""

    print("🚀 Iniciando geração de arquivos SQL...")            # Sem vírgula - assumir separadores de milhar brasileiros

    

    # Carregar dados consolidados            return float(valor_clean.replace('.', ''))def limpar_valor_brasileiro(valor_str):

    arquivo_entrada = os.path.join(PASTA_BASE, 'yampa_consolidado_deduplicado.csv')

                        """Converte string monetária brasileira para float"""

    if not os.path.exists(arquivo_entrada):

        print(f"❌ Arquivo não encontrado: {arquivo_entrada}")    except Exception as e:    if pd.isna(valor_str) or valor_str == '' or str(valor_str) == 'nan':

        return

            print(f"Erro ao converter valor: {valor_str} -> {valor_clean} | Erro: {e}")        return 0.0

    print(f"📂 Carregando arquivo: {arquivo_entrada}")

    df = pd.read_csv(arquivo_entrada)        return 0.0    

    print(f"📊 Total de registros: {len(df)}")

        # Remove espaços e caracteres especiais

    # Processar em lotes

    total_arquivos = math.ceil(len(df) / REGISTROS_POR_ARQUIVO)def processar_csv_com_correcao(caminho_csv):    valor_clean = str(valor_str).strip()

    pasta_sql = os.path.join(PASTA_BASE, '../seeds')

    os.makedirs(pasta_sql, exist_ok=True)    """Reprocessa CSV aplicando correção de valores"""    valor_clean = valor_clean.replace('R$', '').replace(' ', '')

    

    registros_processados = 0    print(f"🔄 Reprocessando CSV com correção de valores brasileiros...")    

    

    for i in range(total_arquivos):        # Remover caracteres não numéricos, mantendo apenas dígitos, vírgula, ponto e sinal negativo

        inicio = i * REGISTROS_POR_ARQUIVO

        fim = min((i + 1) * REGISTROS_POR_ARQUIVO, len(df))    df = pd.read_csv(caminho_csv, sep=';')    import re

        lote = df.iloc[inicio:fim]

                valor_clean = re.sub(r'[^\d\-\.,]', '', valor_clean)

        nome_arquivo = f"yampa_lote_{i+1:03d}.sql"

        caminho_arquivo = os.path.join(pasta_sql, nome_arquivo)    # Aplicar correção nos valores    

        

        print(f"📝 Gerando {nome_arquivo} (registros {inicio+1} a {fim})...")    df['valor_receber_corrigido'] = df['valor_receber'].apply(limpar_valor_brasileiro)    if valor_clean == '' or valor_clean == '-':

        

        with open(caminho_arquivo, 'w', encoding='utf-8') as f:    df['valor_pagar_corrigido'] = df['valor_pagar'].apply(limpar_valor_brasileiro)        return 0.0

            f.write(f"-- Lote {i+1} de {total_arquivos}\n")

            f.write(f"-- Registros {inicio+1} a {fim}\n")    df['valor_recebido_corrigido'] = df['valor_recebido'].apply(limpar_valor_brasileiro)    

            f.write(f"-- Gerado em: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")

                df['valor_pago_corrigido'] = df['valor_pago'].apply(limpar_valor_brasileiro)    try:

            for idx, row in lote.iterrows():

                sql = processar_linha(row, idx + 1)            # Formato brasileiro: 1.234.567,89

                if sql:

                    f.write(sql + "\n\n")    # Mostrar comparação        if ',' in valor_clean:

                    registros_processados += 1

            print(f"📊 VALORES ANTES E DEPOIS DA CORREÇÃO:")            # Se há vírgula, tudo antes dela são milhares, depois dela são centavos

        print(f"✅ {nome_arquivo} criado com sucesso!")

        print(f"   Valor a receber: {df['valor_receber'].sum()} → {df['valor_receber_corrigido'].sum():,.2f}")            partes = valor_clean.split(',')

    # Criar arquivo de execução

    arquivo_exec = os.path.join(pasta_sql, '00_EXECUTAR_MIGRACAO.sql')    print(f"   Valor a pagar: {df['valor_pagar'].sum()} → {df['valor_pagar_corrigido'].sum():,.2f}")            if len(partes) == 2:

    with open(arquivo_exec, 'w', encoding='utf-8') as f:

        f.write("-- EXECUÇÃO DA MIGRAÇÃO YAMPA\n")    print(f"   Valor recebido: {df['valor_recebido'].sum()} → {df['valor_recebido_corrigido'].sum():,.2f}")                # Remover pontos da parte inteira (separadores de milhar)

        f.write(f"-- Total de lotes: {total_arquivos}\n")

        f.write(f"-- Total de registros: {registros_processados}\n")    print(f"   Valor pago: {df['valor_pago'].sum()} → {df['valor_pago_corrigido'].sum():,.2f}")                parte_inteira = partes[0].replace('.', '')

        f.write(f"-- Gerado em: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")

                            parte_decimal = partes[1]

        for i in range(total_arquivos):

            f.write(f"\\i yampa_lote_{i+1:03d}.sql\n")    # Substituir colunas originais                

    

    print(f"\n🎉 MIGRAÇÃO CONCLUÍDA!")    df['valor_receber'] = df['valor_receber_corrigido']                # Garantir que parte decimal tenha no máximo 2 dígitos

    print(f"📁 Pasta SQL: {pasta_sql}")

    print(f"📊 Arquivos gerados: {total_arquivos} lotes + 1 executor")    df['valor_pagar'] = df['valor_pagar_corrigido']                if len(parte_decimal) > 2:

    print(f"📈 Registros processados: {registros_processados}")

    print(f"🚀 Execute: \\i 00_EXECUTAR_MIGRACAO.sql")    df['valor_recebido'] = df['valor_recebido_corrigido']                    parte_decimal = parte_decimal[:2]



if __name__ == "__main__":    df['valor_pago'] = df['valor_pago_corrigido']                

    main()
                    valor_final = f"{parte_inteira}.{parte_decimal}"

    # Remover colunas temporárias                return float(valor_final)

    df = df.drop(columns=[col for col in df.columns if col.endswith('_corrigido')])        else:

                # Sem vírgula - assumir separadores de milhar brasileiros

    return df            return float(valor_clean.replace('.', ''))

                

def main():    except Exception as e:

    print("🚀 TESTANDO CORREÇÃO DE VALORES BRASILEIROS")        print(f"Erro ao converter valor: {valor_str} -> {valor_clean} | Erro: {e}")

    print("=" * 50)        return 0.0

        """Gera SQL para um lançamento"""

    # Carregar dados consolidados    

    caminho_csv = f'{PASTA_BASE}/yampa_consolidated_completo.csv'    # Determinar tipo e valor

        tipo, valor_total = determinar_tipo_lancamento(row['valor_receber'], row['valor_pagar'])

    if not os.path.exists(caminho_csv):    

        print(f"❌ Arquivo não encontrado: {caminho_csv}")    # Mapear plano de conta

        print("Execute primeiro: python scripts/consolidar_yampa.py")    plano_id = mapear_plano_conta(row['plano_conta'])

        return    

        # UUIDs

    # Processar CSV com correção    lancamento_id = str(uuid.uuid4())

    df = processar_csv_com_correcao(caminho_csv)    

        # Descrição e histórico

    # Salvar CSV corrigido    descricao = str(row.get('historico', f'Lançamento {index}')).replace("'", "''")[:255]

    caminho_corrigido = f'{PASTA_BASE}/yampa_consolidated_valores_corrigidos.csv'    historico = descricao

    df.to_csv(caminho_corrigido, index=False, sep=';', encoding='utf-8')    

        # Competência (usar data esperada)

    print(f"\n✅ TESTE DE CORREÇÃO CONCLUÍDO!")    competencia = row['data_esperada']

    print(f"📁 Arquivo corrigido salvo: {caminho_corrigido}")    

    print(f"📊 {len(df)} registros processados")    # Metadata

    metadata = {

if __name__ == "__main__":        "yampa_sequencia": str(row.get('sequencia', '1 de 1')),

    main()        "yampa_conta_bancaria": str(row.get('conta_bancaria', 'N/A')),
        "yampa_status": str(row.get('status', 'Importado')),
        "yampa_cliente_fornecedor": str(row.get('cliente_fornecedor', 'nan')),
        "yampa_projeto": str(row.get('projeto', 'nan')),
        "yampa_origem": str(row.get('origem_arquivo', 'consolidado'))
    }
    
    # Status da parcela
    status_parcela, valor_parcela, valor_pago_parcela = determinar_status_parcela(
        tipo, row['valor_recebido'], row['valor_pago'], valor_total
    )
    
    # Data de pagamento
    data_pagamento = row['data_realizada'] if status_parcela == 'pago' else None
    
    sql = f"""-- Lançamento + Parcela {index}
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '{lancamento_id}',
    '{LOJA_UUID}',
    '{tipo}',
    '{plano_id}',
    '{descricao}',
    '{historico}',
    '{competencia}',
    {valor_total},
    'migracao_yampa_consolidado',
    '{str(metadata).replace("'", '"')}'::jsonb,
    '{USER_UUID}'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '{competencia}',
  {valor_parcela},
  {valor_pago_parcela if valor_pago_parcela else 'NULL'},
  '{status_parcela}',
  {'NULL' if not data_pagamento else f"'{data_pagamento}'"},
  '{FORMA_PAGAMENTO_UUID}'
FROM novo_lancamento nl;

"""
    return sql

def gerar_arquivos_sql(df):
    """Gera arquivos SQL em lotes"""
    print(f"📝 Gerando arquivos SQL para {len(df)} registros...")
    
    # Limpar pasta de seeds
    if os.path.exists(PASTA_SEEDS):
        for arquivo in os.listdir(PASTA_SEEDS):
            if arquivo.startswith('yampa_') and arquivo.endswith('.sql'):
                os.remove(os.path.join(PASTA_SEEDS, arquivo))
                print(f"   🗑️ Removido: {arquivo}")
    
    # Calcular número de arquivos
    total_arquivos = math.ceil(len(df) / REGISTROS_POR_ARQUIVO)
    
    for i in range(total_arquivos):
        inicio = i * REGISTROS_POR_ARQUIVO
        fim = min((i + 1) * REGISTROS_POR_ARQUIVO, len(df))
        lote = df.iloc[inicio:fim]
        
        numero_arquivo = str(i + 1).zfill(3)
        nome_arquivo = f'yampa_consolidado_{numero_arquivo}.sql'
        caminho_arquivo = os.path.join(PASTA_SEEDS, nome_arquivo)
        
        with open(caminho_arquivo, 'w', encoding='utf-8') as f:
            f.write(f"""-- Migração YAMPA Consolidado - Lote {numero_arquivo}
-- Registros {inicio + 1} a {fim} de {len(df)}
-- Data: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
-- Origem: yampa_relatorio.csv + yampa_relatorio_antigo.csv

""")
            
            for idx, row in lote.iterrows():
                sql_lancamento = gerar_sql_lancamento(row, idx + 1)
                f.write(sql_lancamento)
        
        print(f"   ✅ {nome_arquivo} - {len(lote)} registros")
    
    print(f"📁 {total_arquivos} arquivos SQL gerados em {PASTA_SEEDS}")
    return total_arquivos

def main():
    print("🚀 GERANDO MIGRAÇÃO SQL CONSOLIDADA")
    print("=" * 50)
    
    # Carregar dados consolidados
    caminho_csv = f'{PASTA_BASE}/yampa_consolidated_completo.csv'
    
    if not os.path.exists(caminho_csv):
        print(f"❌ Arquivo não encontrado: {caminho_csv}")
        print("Execute primeiro: python scripts/consolidar_yampa.py")
        return
    
    df = pd.read_csv(caminho_csv, sep=';')
    print(f"📊 {len(df)} registros carregados do CSV consolidado")
    
    # Gerar arquivos SQL
    total_arquivos = gerar_arquivos_sql(df)
    
    print(f"\n✅ MIGRAÇÃO SQL GERADA COM SUCESSO!")
    print(f"📁 {total_arquivos} arquivos SQL criados")
    print(f"📊 {len(df)} lançamentos consolidados")
    print(f"\n📋 PRÓXIMOS PASSOS:")
    print(f"1. Limpar banco de dados atual (opcional)")
    print(f"2. Executar arquivos SQL em ordem: yampa_consolidado_001.sql até yampa_consolidado_{str(total_arquivos).zfill(3)}.sql")
    print(f"3. Verificar dashboard com dados completos")

if __name__ == "__main__":
    main()