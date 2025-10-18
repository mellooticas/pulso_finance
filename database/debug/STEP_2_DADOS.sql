-- =============================================
-- STEP 2: INVESTIGAR DADOS EXISTENTES
-- =============================================
-- Execute esta query e me dê o resultado:

-- 🏢 Verificar lojas cadastradas
SELECT 
  codigo,
  nome,
  ativa
FROM lojas 
ORDER BY codigo;

| codigo | nome             | ativa |
| ------ | ---------------- | ----- |
| ESC    | Escritório       | true  |
| MAU    | Loja Mauá        | true  |
| PER    | Loja Perus       | true  |
| RIO    | Loja Rio Pequeno | true  |
| SMT    | Loja São Mateus  | true  |
| SU2    | Loja Suzano II   | true  |
| SUZ    | Loja Suzano      | true  |

-- 📊 Verificar plano de contas (amostra)
SELECT 
  codigo,
  nome,
  categoria,
  aceita_lancamento
FROM plano_contas 
WHERE aceita_lancamento = true
ORDER BY codigo
LIMIT 10;

| codigo | nome                       | categoria | aceita_lancamento |
| ------ | -------------------------- | --------- | ----------------- |
| 13.99  | Saldo Inicial Padrão Yampa | outros    | true              |
| 3.1.1  | Vendas em Dinheiro         | receita   | true              |
| 3.1.10 | Pagamento de Festas        | receita   | true              |
| 3.1.2  | Vendas Cartões de Débito   | receita   | true              |
| 3.1.3  | Vendas Cartões de Crédito  | receita   | true              |
| 3.1.4  | Vendas Cartões Parceladas  | receita   | true              |
| 3.1.5  | Vendas Cheques             | receita   | true              |
| 3.1.6  | Vendas Crediário           | receita   | true              |
| 3.1.7  | Vendas Convênios           | receita   | true              |
| 3.1.8  | Vendas PIX                 | receita   | true              |


-- 💰 Verificar se já existem lançamentos
SELECT 
  origem,
  COUNT(*) as quantidade
FROM lancamentos 
GROUP BY origem;

Success. No rows returned




-- 👥 Verificar usuários
SELECT 
  email,
  papel,
  ativo
FROM usuarios;

| email                         | papel      | ativo |
| ----------------------------- | ---------- | ----- |
| financeiroesc@hotmail.com     | financeiro | true  |
| tgjphotos@gmail.com           | gerencial  | true  |
| junior@oticastatymello.com.br | admin      | true  |

-- 📋 Verificar ENUMs importantes
SELECT unnest(enum_range(NULL::tipo_lancamento)) as tipos_lancamento;

| tipos_lancamento |
| ---------------- |
| receber          |
| pagar            |
SELECT unnest(enum_range(NULL::status_parcela)) as status_parcela;

| status_parcela |
| -------------- |
| previsto       |
| vencido        |
| pago           |
| parcial        |
| cancelado      |
SELECT unnest(enum_range(NULL::origem_lanc)) as origem_lancamento;

| origem_lancamento |
| ----------------- |
| manual            |
| import_csv        |
| api               |
| conciliacao       |
| sistema           |
| migracao_yampa    |