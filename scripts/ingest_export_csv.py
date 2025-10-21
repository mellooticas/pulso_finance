import os
import uuid
import json
import re
from datetime import datetime, date
from typing import Optional, Tuple

import pandas as pd


def br_to_float(val) -> float:
    """Converte número no formato PT-BR (1.234,56) para float. Trata vazios/NaN."""
    if val is None:
        return 0.0
    if isinstance(val, (int, float)):
        return float(val)
    s = str(val).strip()
    if s == '' or s.lower() in {'nan', 'none', '-'}:
        return 0.0
    # remover R$, espaços e normalizar milhares/decimal
    s = s.replace('R$', '').replace(' ', '')
    # Caso tenha múltiplos pontos, remover pontos dos milhares
    if ',' in s:
        s = s.replace('.', '')
        s = s.replace(',', '.')
    try:
        return float(s)
    except Exception:
        return 0.0


def parse_data(s: Optional[str]) -> Optional[date]:
    """Converte data em formatos 'DD/MM/YYYY' ou 'YYYY-MM-DD' para date."""
    if s is None:
        return None
    s = str(s).strip()
    if s == '' or s.lower() in {'nan', 'none', '-'}:
        return None
    for fmt in ('%d/%m/%Y', '%Y-%m-%d'):
        try:
            return datetime.strptime(s, fmt).date()
        except ValueError:
            continue
    # Tentar outras variações comuns (com hora)
    for fmt in ('%d/%m/%Y %H:%M:%S', '%Y-%m-%d %H:%M:%S'):
        try:
            return datetime.strptime(s, fmt).date()
        except ValueError:
            continue
    return None


def parse_sequencia(seq: Optional[str]) -> Tuple[int, int]:
    """Converte '1 de 2' em (1, 2). Retorna (1,1) por padrão."""
    if not seq:
        return 1, 1
    m = re.search(r"(\d+)\s*de\s*(\d+)", str(seq))
    if m:
        return int(m.group(1)), int(m.group(2))
    # Alguns formatos: 'Parcela 1/4', '1/3'
    m2 = re.search(r"(\d+)\s*/\s*(\d+)", str(seq))
    if m2:
        return int(m2.group(1)), int(m2.group(2))
    return 1, 1


def normalizar_status(status: Optional[str]) -> str:
    s = (status or '').strip().lower()
    if 'realiz' in s or 'pago' in s or 'recebid' in s:
        return 'pago'
    return 'previsto'


def inferir_tipo(valor_receber: float, valor_pagar: float, valor_recebido: float, valor_pago: float) -> Optional[str]:
    """Determina tipo do lançamento: 'receita' ou 'despesa'."""
    if valor_receber > 0 or valor_recebido > 0:
        return 'receita'
    if valor_pagar < 0 or valor_pago < 0:
        return 'despesa'
    # fallback: se pagar positivo (alguns exports usam positivo em col específica)
    if valor_pagar > 0:
        return 'despesa'
    return None


def safe_str(val, max_len: Optional[int] = None) -> str:
    """Converte qualquer valor para string segura (sem 'nan'), com truncagem opcional."""
    if val is None:
        s = ''
    else:
        try:
            # pandas NaN -> float('nan'), str(nan) == 'nan'
            s = '' if (pd.isna(val)) else str(val)
        except Exception:
            s = str(val)
    if max_len is not None and len(s) > max_len:
        return s[:max_len]
    return s


def carregar_mapeamentos(path_json: str) -> dict:
    """Carrega mapeamentos de lojas e planos, se existir."""
    if os.path.exists(path_json):
        with open(path_json, 'r', encoding='utf-8') as f:
            return json.load(f)
    return {"lojas": {}, "planos": {}}


def mapear_loja(centro_custo: Optional[str], mapeamentos: dict) -> Tuple[Optional[str], Optional[str]]:
    """Retorna (loja_id, loja_nome_resolvido). Se não achar id, retorna (None, nome)."""
    nome = (centro_custo or '').strip() or None
    if not nome:
        return None, None
    lojas = mapeamentos.get('lojas', {})
    loja_id = lojas.get(nome)
    return loja_id, nome


def mapear_plano(plano_raw: Optional[str], mapeamentos: dict) -> Tuple[Optional[str], Optional[str], Optional[str]]:
    """Divide '5.2.3 Energia elétrica' em (codigo, nome) e procura id em mapeamentos."""
    if not plano_raw:
        return None, None, None
    plano_raw = str(plano_raw).strip()
    # Tentar separar por espaço após código
    m = re.match(r"^(\d+(?:\.\d+)*)\s+(.+)$", plano_raw)
    if m:
        codigo, nome = m.group(1), m.group(2)
    else:
        codigo, nome = None, plano_raw
    planos = mapeamentos.get('planos', {})
    # Prioridade: chave completa > código > nome
    plano_id = planos.get(plano_raw) or (planos.get(codigo) if codigo else None) or planos.get(nome)
    return plano_id, codigo, nome


def main():
    base_dir = os.path.dirname(os.path.dirname(__file__))  # raiz do repo
    export_path = os.path.join(base_dir, 'data', 'base', 'export.csv')
    mapeamentos_path = os.path.join(base_dir, 'data', 'base', 'mapeamentos.json')

    if not os.path.exists(export_path):
        raise FileNotFoundError(f'Arquivo não encontrado: {export_path}')

    print('📥 Lendo export.csv...')
    # Leitura com separador ';' e sem inferir tipo de imediato
    df = pd.read_csv(export_path, sep=';', dtype=str, encoding='utf-8')
    print(f'📊 Registros no export: {len(df)}')

    # Renomear colunas para nomes estáveis
    rename_map = {
        'Data esperada': 'data_esperada',
        'Data realizada': 'data_realizada',
        'Plano de contas': 'plano_contas',
        'Histórico': 'historico',
        'Sequência': 'sequencia',
        'Conta bancária': 'conta_bancaria',
        'Valor a receber': 'valor_receber',
        'Valor recebido': 'valor_recebido',
        'Valor a pagar': 'valor_pagar',
        'Valor pago': 'valor_pago',
        'Status': 'status',
        'Cliente/Fornecedor': 'cliente_fornecedor',
        'Meio de pagamento': 'meio_pagamento',
        'Centro de custo': 'centro_custo',
        'Projeto': 'projeto',
        'Data da última alteração': 'data_ultima_alteracao',
        'Código da conciliação bancária': 'codigo_conciliacao',
    }
    df = df.rename(columns=rename_map)

    # Normalizar datas e valores numéricos
    df['data_esperada_dt'] = df['data_esperada'].apply(parse_data)
    df['data_realizada_dt'] = df['data_realizada'].apply(parse_data)
    for col in ['valor_receber', 'valor_recebido', 'valor_pagar', 'valor_pago']:
        df[col + '_num'] = df[col].apply(br_to_float)

    df['status_norm'] = df['status'].apply(normalizar_status)

    # Inferir tipo e valor_base
    df['tipo'] = df.apply(
        lambda r: inferir_tipo(r['valor_receber_num'], r['valor_pagar_num'], r['valor_recebido_num'], r['valor_pago_num']),
        axis=1,
    )
    # Valor base esperado: receber ou pagar (abs)
    def valor_base(r):
        if r['tipo'] == 'receita':
            return max(r['valor_receber_num'], r['valor_recebido_num'])
        if r['tipo'] == 'despesa':
            # Em alguns exports, valores de pagar vêm negativos
            return max(abs(r['valor_pagar_num']), abs(r['valor_pago_num']))
        return 0.0

    df['valor_total'] = df.apply(valor_base, axis=1).round(2)

    # Sequência -> parcela_atual, total_parcelas
    df[['parcela_atual', 'total_parcelas']] = df['sequencia'].apply(lambda s: pd.Series(parse_sequencia(s)))

    # Carregar mapeamentos opcionais
    mapeamentos = carregar_mapeamentos(mapeamentos_path)

    # Mapear loja e plano
    loja_ids, loja_nomes, plano_ids, plano_codigos, plano_nomes = [], [], [], [], []
    for _, r in df.iterrows():
        loja_id, loja_nome = mapear_loja(r.get('centro_custo'), mapeamentos)
        plano_id, plano_codigo, plano_nome = mapear_plano(r.get('plano_contas'), mapeamentos)
        loja_ids.append(loja_id)
        loja_nomes.append(loja_nome)
        plano_ids.append(plano_id)
        plano_codigos.append(plano_codigo)
        plano_nomes.append(plano_nome)

    df['loja_id'] = loja_ids
    df['loja_nome'] = loja_nomes
    df['plano_id'] = plano_ids
    df['plano_codigo'] = plano_codigos
    df['plano_nome'] = plano_nomes

    # Filtrar linhas com valor > 0
    df_valid = df[(df['valor_total'] > 0) & df['tipo'].isin(['receita', 'despesa'])].copy()
    print(f'✅ Registros válidos para ingestão: {len(df_valid)}')

    # Construir dados de lançamentos e parcelas (1 linha -> 1 lançamento + 1 parcela)
    lanc_rows = []
    parc_rows = []
    now_iso = datetime.now().isoformat()

    for _, r in df_valid.iterrows():
        lanc_id = str(uuid.uuid4())
        parc_id = str(uuid.uuid4())

        # competência: usar data_esperada se existir, senão realizada, senão hoje
        comp = r['data_esperada_dt'] or r['data_realizada_dt'] or date.today()
        venc = r['data_esperada_dt'] or comp

        lanc_rows.append({
            'id': lanc_id,
            'loja_id': r['loja_id'],  # pode ser None, preencher depois via join
            'loja_nome': safe_str(r['loja_nome'], 120),
            'tipo': r['tipo'],  # receita | despesa
            'plano_id': r['plano_id'],  # pode ser None
            'plano_codigo': safe_str(r['plano_codigo'], 64),
            'plano_nome': safe_str(r['plano_nome'], 200),
            'centro_custo_nome': safe_str(r.get('centro_custo'), 120),
            'fornecedor_cliente': safe_str(r.get('cliente_fornecedor'), 160),
            'descricao': safe_str(r.get('historico'), 200),
            'historico': safe_str(r.get('historico'), 500),
            'competencia': comp,
            'valor_total': r['valor_total'],
            'num_parcelas': int(r['total_parcelas']) if pd.notna(r['total_parcelas']) else 1,
            'origem': 'migracao_export',
            'status_aprovacao': 'aprovado',
            'documento_referencia': None,
            'observacoes': None,
            'metadata': json.dumps({
                'conta_bancaria': safe_str(r.get('conta_bancaria'), 160),
                'meio_pagamento': safe_str(r.get('meio_pagamento'), 80),
                'codigo_conciliacao': safe_str(r.get('codigo_conciliacao'), 200),
                'projeto': safe_str(r.get('projeto'), 160),
                'data_ultima_alteracao': safe_str(r.get('data_ultima_alteracao'), 40),
            }, ensure_ascii=False),
            'created_at': now_iso,
            'updated_at': now_iso,
        })

        status_parc = r['status_norm']
        valor_pago = None
        data_pagamento = None
        if status_parc == 'pago':
            # Usar valor pago/recebido se presente, senão valor_total
            if r['tipo'] == 'despesa':
                valor_pago = abs(r['valor_pago_num']) if r['valor_pago_num'] != 0 else r['valor_total']
            else:
                valor_pago = r['valor_recebido_num'] if r['valor_recebido_num'] != 0 else r['valor_total']
            data_pagamento = r['data_realizada_dt'] or venc

        parc_rows.append({
            'id': parc_id,
            'lancamento_id': lanc_id,
            'parcela': int(r['parcela_atual']) if pd.notna(r['parcela_atual']) else 1,
            'vencimento': venc,
            'valor': r['valor_total'],
            'juros': 0,
            'desconto': 0,
            'valor_pago': valor_pago,
            'status': status_parc,  # pago | previsto
            'data_pagamento': data_pagamento,
            'forma_pagamento': safe_str(r.get('meio_pagamento'), 80),
            'conta_bancaria': safe_str(r.get('conta_bancaria'), 160),
            'comprovante': None,
            'observacao': None,
            'conciliado': True if r.get('codigo_conciliacao') else False,
            'cliente_fornecedor': safe_str(r.get('cliente_fornecedor'), 160),
            'created_at': now_iso,
            'updated_at': now_iso,
        })

    # DataFrames de saída
    df_lanc = pd.DataFrame(lanc_rows)
    df_parc = pd.DataFrame(parc_rows)

    # Pastas de saída
    seeds_dir = os.path.join(base_dir, 'data', 'seeds')
    analysis_dir = os.path.join(base_dir, 'data', 'analysis', 'base')
    os.makedirs(seeds_dir, exist_ok=True)
    os.makedirs(analysis_dir, exist_ok=True)

    # Auditoria: dump intermediário
    audit_path = os.path.join(analysis_dir, 'EXPORT_CLEAN.csv')
    df_valid.to_csv(audit_path, index=False, encoding='utf-8')

    # Saídas finais para import
    lanc_path = os.path.join(seeds_dir, 'lancamentos_from_export.csv')
    parc_path = os.path.join(seeds_dir, 'parcelas_from_export.csv')
    df_lanc.to_csv(lanc_path, index=False, encoding='utf-8')
    df_parc.to_csv(parc_path, index=False, encoding='utf-8')

    # Sumário
    receitas = df_lanc[df_lanc['tipo'] == 'receita']['valor_total'].sum()
    despesas = df_lanc[df_lanc['tipo'] == 'despesa']['valor_total'].sum()
    print('✅ Ingestão concluída!')
    print(f'   • Lançamentos: {len(df_lanc)} -> {lanc_path}')
    print(f'   • Parcelas:    {len(df_parc)} -> {parc_path}')
    print(f'   • Auditoria:   {audit_path}')
    print('💰 Totais:')
    print(f'   • Receitas: R$ {receitas:,.2f}')
    print(f'   • Despesas: R$ {despesas:,.2f}')
    print('\n⚠️ Próximos passos:')
    print('1) Preencha data/base/mapeamentos.json com os UUIDs reais de lojas e planos (se disponíveis).')
    print("   Exemplo: {\"lojas\": {\"Loja Suzano\": \"<uuid>\"}, \"planos\": {\"5.2.3\": \"<uuid>\"}}")
    print('2) Importe CSVs em Supabase: primeiro lancamentos, depois parcelas (relacionando por id).')
    print('3) Faça join por loja_nome/plano_codigo no banco para atualizar os IDs se necessário.')


if __name__ == '__main__':
    main()
