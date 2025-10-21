-- ============================================================
-- 🔍 INVESTIGAÇÃO: Por que não aparecem contas a pagar?
-- Data: 20/10/2025 - Filtro até fim do mês
-- ============================================================

-- 1. Verificar estrutura e sample de lançamentos
SELECT 
    'SAMPLE DE LANÇAMENTOS' as secao,
    id,
    tipo,
    descricao,
    competencia,
    valor_total,
    num_parcelas,
    status_aprovacao,
    created_at
FROM lancamentos
LIMIT 5;


| secao                 | id                                   | tipo    | descricao                                                                                                | competencia | valor_total | num_parcelas | status_aprovacao | created_at                    |
| --------------------- | ------------------------------------ | ------- | -------------------------------------------------------------------------------------------------------- | ----------- | ----------- | ------------ | ---------------- | ----------------------------- |
| SAMPLE DE LANÇAMENTOS | 00813812-7893-4692-b435-977a172ab6c1 | receber | Conciliação - PIX RECEBIDO - CP :90400888-ELIEL DUARTE SILVA                                             | 2023-07-03  | 150.00      | 1            | aprovado         | 2025-10-18 13:51:23.105415+00 |
| SAMPLE DE LANÇAMENTOS | 008b547f-a461-4e18-b7b2-b640153f8a13 | receber | Conciliação - PIX RECEBIDO - ELIEL DUARTE SILVA                                                          | 2024-09-12  | 162.50      | 1            | aprovado         | 2025-10-18 13:51:24.209123+00 |
| SAMPLE DE LANÇAMENTOS | 009364bf-2578-4a32-bf84-1641a9b36630 | pagar   | Conciliação - PIX - ENVIADO - 09/01 21:24 STEFANY RAYNE SANTOS                                           | 2023-01-09  | 35.20       | 1            | aprovado         | 2025-10-18 13:51:22.564873+00 |
| SAMPLE DE LANÇAMENTOS | 009b1043-cb71-4343-88b1-09e559a806e3 | receber | CARNe - 6144: ROSALINA ALVES YAMAUCHI                                                                    | 2022-10-04  | 115.00      | 1            | aprovado         | 2025-10-18 13:51:22.494651+00 |
| SAMPLE DE LANÇAMENTOS | 00a43d87-970b-4e93-8467-7e0eceb3afb7 | pagar   | BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OSs 10700 e 10701 (diferença - coloração + 2 montagens) | 2025-04-14  | 71.00       | 1            | aprovado         | 2025-10-18 13:51:24.702446+00 |




-- 1.5. Verificar PARCELAS (onde estão os vencimentos!)
SELECT 
    'SAMPLE DE PARCELAS' as secao,
    p.id,
    p.vencimento,
    p.valor,
    p.status,
    p.data_pagamento,
    l.tipo as tipo_lancamento,
    l.descricao
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
ORDER BY p.vencimento DESC
LIMIT 10;

| secao              | id                                   | vencimento | valor  | status | data_pagamento | tipo_lancamento | descricao                                                                                          |
| ------------------ | ------------------------------------ | ---------- | ------ | ------ | -------------- | --------------- | -------------------------------------------------------------------------------------------------- |
| SAMPLE DE PARCELAS | 3a84c388-6430-412d-9e82-c3ea3319775c | 2025-10-18 | 400.00 | pago   | 2025-10-18     | pagar           | ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 112/112 > PIX: 08.450.703.0001/23 (CNPJ) |
| SAMPLE DE PARCELAS | 353c12c4-ee3a-40d2-a9bf-b4e013cc0ea3 | 2025-10-18 | 400.00 | pago   | 2025-10-18     | pagar           | ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 111/112 > PIX: 08.450.703.0001/23 (CNPJ) |
| SAMPLE DE PARCELAS | a85cb930-41ab-402c-b646-cb0138bc6ea3 | 2025-10-18 | 400.00 | pago   | 2025-10-18     | pagar           | ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 110/112 > PIX: 08.450.703.0001/23 (CNPJ) |
| SAMPLE DE PARCELAS | aa2872f5-4e9e-4990-ae09-3f33f3654ed6 | 2025-10-18 | 400.00 | pago   | 2025-10-18     | pagar           | ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 109/112 > PIX: 08.450.703.0001/23 (CNPJ) |
| SAMPLE DE PARCELAS | e93bd349-970c-440e-b042-88a44e110018 | 2025-10-18 | 400.00 | pago   | 2025-10-18     | pagar           | ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 108/112 > PIX: 08.450.703.0001/23 (CNPJ) |
| SAMPLE DE PARCELAS | 3a5f0bf0-2d9e-4a96-8704-e113ed231b91 | 2025-10-18 | 400.00 | pago   | 2025-10-18     | pagar           | ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 107/112 > PIX: 08.450.703.0001/23 (CNPJ) |
| SAMPLE DE PARCELAS | 22329660-9002-428d-9627-901da11eb088 | 2025-10-18 | 400.00 | pago   | 2025-10-18     | pagar           | ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 106/112 > PIX: 08.450.703.0001/23 (CNPJ) |
| SAMPLE DE PARCELAS | 68e0d3a2-71a7-4693-95f8-e57c4b02e8b0 | 2025-10-18 | 400.00 | pago   | 2025-10-18     | pagar           | ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 105/112 > PIX: 08.450.703.0001/23 (CNPJ) |
| SAMPLE DE PARCELAS | 59285fd4-188e-4fc2-8b7f-9eaf8bcbacc7 | 2025-10-18 | 400.00 | pago   | 2025-10-18     | pagar           | ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 104/112 > PIX: 08.450.703.0001/23 (CNPJ) |
| SAMPLE DE PARCELAS | 605952dc-9db5-4e78-a55b-9b10fcf3f4c2 | 2025-10-18 | 400.00 | pago   | 2025-10-18     | pagar           | ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 103/112 > PIX: 08.450.703.0001/23 (CNPJ) |


-- 2. Contar lançamentos por tipo
SELECT 
    'LANÇAMENTOS POR TIPO' as secao,
    tipo,
    COUNT(*) as quantidade
FROM lancamentos
GROUP BY tipo;


| secao                | tipo    | quantidade |
| -------------------- | ------- | ---------- |
| LANÇAMENTOS POR TIPO | pagar   | 26596      |
| LANÇAMENTOS POR TIPO | receber | 16267      |



-- 3. Range de datas no banco
SELECT 
    'RANGE DE DATAS' as secao,
    MIN(competencia) as data_mais_antiga,
    MAX(competencia) as data_mais_recente,
    COUNT(*) as total_lancamentos
FROM lancamentos;


| secao          | data_mais_antiga | data_mais_recente | total_lancamentos |
| -------------- | ---------------- | ----------------- | ----------------- |
| RANGE DE DATAS | 2020-10-01       | 2025-10-18        | 42863             |

-- 4. Lançamentos em OUTUBRO/2025 (competência)
SELECT 
    'OUTUBRO 2025 - COMPETÊNCIA' as secao,
    tipo,
    COUNT(*) as quantidade,
    SUM(valor_total) as valor_total
FROM lancamentos
WHERE competencia >= '2025-10-01' 
  AND competencia <= '2025-10-31'
GROUP BY tipo;

| secao                      | tipo    | quantidade | valor_total |
| -------------------------- | ------- | ---------- | ----------- |
| OUTUBRO 2025 - COMPETÊNCIA | receber | 2          | 362.33      |
| OUTUBRO 2025 - COMPETÊNCIA | pagar   | 1562       | 707037.83   |

-- 5. PARCELAS com vencimento em OUTUBRO/2025 (AQUI ESTÃO AS CONTAS!)
SELECT 
    'OUTUBRO 2025 - VENCIMENTO (PARCELAS)' as secao,
    l.tipo,
    COUNT(*) as quantidade_parcelas,
    SUM(p.valor) as valor_total,
    COUNT(CASE WHEN p.status = 'previsto' THEN 1 END) as parcelas_previstas,
    COUNT(CASE WHEN p.status = 'pago' THEN 1 END) as parcelas_pagas,
    COUNT(CASE WHEN p.status = 'atrasado' THEN 1 END) as parcelas_atrasadas
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
WHERE p.vencimento >= '2025-10-01' 
  AND p.vencimento <= '2025-10-31'
GROUP BY l.tipo;

ERROR:  22P02: invalid input value for enum status_parcela: "atrasado"
LINE 8:     COUNT(CASE WHEN p.status = 'atrasado' THEN 1 END) as parcelas_atrasadas
                                       ^
Note: A limit of 100 was applied to your query. If this was the cause of a syntax error, try selecting "No limit" instead and re-run the query.


-- 6. Sample de PARCELAS em OUTUBRO/2025 (detalhado)
SELECT 
    'SAMPLE PARCELAS OUTUBRO 2025' as secao,
    p.vencimento,
    p.valor,
    p.status,
    p.data_pagamento,
    l.tipo as tipo_lancamento,
    l.descricao,
    lo.nome as loja
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
LEFT JOIN lojas lo ON l.loja_id = lo.id
WHERE p.vencimento >= '2025-10-01' 
  AND p.vencimento <= '2025-10-31'
ORDER BY p.vencimento, l.tipo
LIMIT 20;

| secao                        | vencimento | valor   | status   | data_pagamento | tipo_lancamento | descricao                                                                              | loja             |
| ---------------------------- | ---------- | ------- | -------- | -------------- | --------------- | -------------------------------------------------------------------------------------- | ---------------- |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 36.00   | previsto | null           | receber         | Dinheiro em caixa                                                                      | Loja Suzano      |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 326.33  | previsto | null           | receber         | Dinheiro em caixa                                                                      | Loja Suzano      |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 1899.00 | pago     | 2025-10-18     | pagar           | UNIVERSIDADE ANHEMBI MORUMBI: Giovanna Mello de Camargo                                | Loja Suzano      |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 325.60  | pago     | 2025-10-18     | pagar           | CP SEGURADOS - CONTRIBUINTES INDIVIDUAIS - 11%                                         | Escritório       |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 1601.27 | pago     | 2025-10-18     | pagar           | CONTRIBUIÇÃO PREVIDENCIÁRIA DESCONTA SEGURADO-EMPREGADO/AVULSO                         | Loja Suzano      |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 55.78   | pago     | 2025-10-18     | pagar           | DARF IR                                                                                | Loja Suzano      |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 119.94  | pago     | 2025-10-18     | pagar           | INTERNET CLARO NET 209/001184802 - SUZANO                                              | Loja Suzano      |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 352.47  | pago     | 2025-10-18     | pagar           | DARF MÁRCIA TAKIUTTU                                                                   | Loja Suzano      |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 352.46  | pago     | 2025-10-18     | pagar           | DARF PEDRA MIECA                                                                       | Escritório       |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 313.47  | pago     | 2025-10-18     | pagar           | CONTRIBUIÇÃO PREVIDENCIÁRIA DESCONTA SEGURADO-EMPREGADO/AVULSO                         | Escritório       |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 352.48  | pago     | 2025-10-18     | pagar           | DARF VINÍCIUS TAKIUTTU                                                                 | Loja Suzano      |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 422.36  | pago     | 2025-10-18     | pagar           | DARF IR                                                                                | Loja Suzano      |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 99.60   | pago     | 2025-10-18     | pagar           | DARF IR                                                                                | Loja Rio Pequeno |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 164.97  | pago     | 2025-10-18     | pagar           | INTERNET CLARO NET 003/409666719 - RIO PEQUENO                                         | Loja Suzano      |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 319.75  | pago     | 2025-10-18     | pagar           | INTERNET CLARO NET 209/001174491 - ESCRITÓRIO                                          | Loja Suzano      |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 495.36  | pago     | 2025-10-18     | pagar           | CONTRIBUIÇÃO PREVIDENCIÁRIA DESCONTA SEGURADO-EMPREGADO/AVULSO                         | Loja Suzano      |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 260.33  | pago     | 2025-10-18     | pagar           | TAXA DE FISCALIZAÇÃO DE ESTABELECIMENTO E DE ANUNCIOS - Parcela 1/4                    | Loja Suzano      |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 128.33  | pago     | 2025-10-18     | pagar           | TAXA DE LICENÇA E FISCALIZAÇÃO DE FUCIONAMENTO (ALVARÁ DE FUNCIONAMENTO) - Parcela 2/4 | Loja Suzano II   |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 1940.10 | pago     | 2025-10-18     | pagar           | UNIVERSIDADE ANHEMBI MORUMBI: Giovanna Mello de Camargo                                | Escritório       |
| SAMPLE PARCELAS OUTUBRO 2025 | 2025-10-18 | 128.44  | pago     | 2025-10-18     | pagar           | INTERNET CLARO NET 003/407801031 - SÃO MATEUS                                          | Loja Suzano      |


-- 7. Verificar se existe tabela de parcelas
SELECT 
    'VERIFICAR PARCELAS' as secao,
    COUNT(*) as total_parcelas
FROM parcelas
WHERE vencimento >= '2025-10-01' 
  AND vencimento <= '2025-10-31';

  | secao              | total_parcelas |
| ------------------ | -------------- |
| VERIFICAR PARCELAS | 1564           |

-- 8. Sample de parcelas em outubro (se existir)
SELECT 
    p.vencimento,
    p.valor,
    p.status,
    l.tipo as tipo_lancamento,
    l.descricao
FROM parcelas p
LEFT JOIN lancamentos l ON p.lancamento_id = l.id
WHERE p.vencimento >= '2025-10-01' 
  AND p.vencimento <= '2025-10-31'
ORDER BY p.vencimento
LIMIT 10;


| vencimento | valor   | status   | tipo_lancamento | descricao                                                      |
| ---------- | ------- | -------- | --------------- | -------------------------------------------------------------- |
| 2025-10-18 | 36.00   | previsto | receber         | Dinheiro em caixa                                              |
| 2025-10-18 | 326.33  | previsto | receber         | Dinheiro em caixa                                              |
| 2025-10-18 | 1940.10 | pago     | pagar           | UNIVERSIDADE ANHEMBI MORUMBI: Giovanna Mello de Camargo        |
| 2025-10-18 | 164.97  | pago     | pagar           | INTERNET CLARO NET 003/409666719 - RIO PEQUENO                 |
| 2025-10-18 | 319.75  | pago     | pagar           | INTERNET CLARO NET 209/001174491 - ESCRITÓRIO                  |
| 2025-10-18 | 128.44  | pago     | pagar           | INTERNET CLARO NET 003/407801031 - SÃO MATEUS                  |
| 2025-10-18 | 1899.00 | pago     | pagar           | UNIVERSIDADE ANHEMBI MORUMBI: Giovanna Mello de Camargo        |
| 2025-10-18 | 313.47  | pago     | pagar           | CONTRIBUIÇÃO PREVIDENCIÁRIA DESCONTA SEGURADO-EMPREGADO/AVULSO |
| 2025-10-18 | 55.78   | pago     | pagar           | DARF IR                                                        |
| 2025-10-18 | 119.94  | pago     | pagar           | INTERNET CLARO NET 209/001184802 - SUZANO                      |

-- 9. Verificar distribuição temporal das PARCELAS
SELECT 
    TO_CHAR(p.vencimento, 'YYYY-MM') as mes_ano,
    l.tipo,
    COUNT(*) as quantidade_parcelas,
    SUM(p.valor) as valor_total
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
GROUP BY TO_CHAR(p.vencimento, 'YYYY-MM'), l.tipo
ORDER BY mes_ano DESC, l.tipo
LIMIT 20;

| mes_ano | tipo    | quantidade_parcelas | valor_total |
| ------- | ------- | ------------------- | ----------- |
| 2025-10 | receber | 2                   | 362.33      |
| 2025-10 | pagar   | 1562                | 707037.83   |
| 2025-09 | receber | 33                  | 12495.34    |
| 2025-09 | pagar   | 78                  | 23582.75    |
| 2025-08 | receber | 133                 | 78070.74    |
| 2025-08 | pagar   | 264                 | 74109.21    |
| 2025-07 | receber | 198                 | 94972.10    |
| 2025-07 | pagar   | 319                 | 84104.02    |
| 2025-06 | receber | 189                 | 77043.64    |
| 2025-06 | pagar   | 253                 | 73180.32    |
| 2025-05 | receber | 224                 | 83380.48    |
| 2025-05 | pagar   | 245                 | 75313.58    |
| 2025-04 | receber | 208                 | 75423.48    |
| 2025-04 | pagar   | 267                 | 64659.65    |
| 2025-03 | receber | 250                 | 84769.69    |
| 2025-03 | pagar   | 296                 | 79299.32    |
| 2025-02 | receber | 298                 | 96441.59    |
| 2025-02 | pagar   | 318                 | 89226.27    |
| 2025-01 | receber | 289                 | 94587.88    |
| 2025-01 | pagar   | 318                 | 84836.25    |

-- 10. ANÁLISE CRÍTICA: Parcelas previstas vs pagas
SELECT 
    'ANÁLISE DE STATUS' as secao,
    p.status,
    COUNT(*) as quantidade,
    SUM(p.valor) as valor_total
FROM parcelas p
WHERE p.vencimento >= '2025-10-01' 
  AND p.vencimento <= '2025-10-31'
GROUP BY p.status
ORDER BY p.status;

| secao             | status   | quantidade | valor_total |
| ----------------- | -------- | ---------- | ----------- |
| ANÁLISE DE STATUS | previsto | 2          | 362.33      |
| ANÁLISE DE STATUS | pago     | 1562       | 707037.83   |

-- ============================================================
-- 💡 ANÁLISE ESPERADA:
--
-- CENÁRIO 1: Dados são de 2024 ou anteriores
--   - MAX(competencia) < '2025-10-01'
--   - Solução: Verificar se dados precisam ser atualizados
--
-- CENÁRIO 2: Sistema usa 'data_vencimento' para contas futuras
--   - competencia está no passado, data_vencimento no futuro
--   - Solução: Filtrar por data_vencimento em vez de competencia
--
-- CENÁRIO 3: Contas a pagar estão em tabela 'parcelas'
--   - lancamentos tem competência passada
--   - parcelas tem vencimentos futuros
--   - Solução: Consultar tabela parcelas
--
-- CENÁRIO 4: Não há dados futuros cadastrados
--   - Sistema só tem histórico, sem previsões
--   - Solução: Implementar cadastro de contas a pagar futuras
-- ============================================================
