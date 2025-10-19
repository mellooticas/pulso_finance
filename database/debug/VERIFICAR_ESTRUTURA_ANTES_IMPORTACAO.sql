-- =============================================
-- SCRIPT DE VERIFICAÇÃO INICIAL - PULSO FINANCE  
-- Execute este script primeiro no Supabase
-- =============================================

-- 🔍 STEP 1: Verificar se as tabelas principais existem
SELECT 
  table_name as "Tabela",
  CASE 
    WHEN table_name = 'lancamentos' THEN '💰 (Principal)'
    WHEN table_name = 'parcelas' THEN '📋 (Principal)'
    WHEN table_name = 'lojas' THEN '🏢 (Principal)'
    WHEN table_name = 'plano_contas' THEN '📊 (Principal)'
    WHEN table_name LIKE '%usuario%' THEN '👥'
    ELSE '📋'
  END as "Status"
FROM information_schema.tables 
WHERE table_schema = 'public' 
  AND table_name IN ('lancamentos', 'parcelas', 'lojas', 'plano_contas', 'usuarios')
ORDER BY table_name;

| Tabela       | Status         |
| ------------ | -------------- |
| lancamentos  | 💰 (Principal) |
| lojas        | 🏢 (Principal) |
| parcelas     | 📋 (Principal) |
| plano_contas | 📊 (Principal) |
| usuarios     | 👥             |

-- 🏢 STEP 2: Verificar lojas existentes
SELECT 
  id as "UUID da Loja",
  nome as "Nome",
  codigo as "Código",
  ativa as "Ativa"
FROM lojas 
ORDER BY nome;

| UUID da Loja                         | Nome             | Código | Ativa |
| ------------------------------------ | ---------------- | ------ | ----- |
| 692e5aea-e785-4675-9d44-9f3e24b36b01 | Escritório       | ESC    | true  |
| b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe | Loja Mauá        | MAU    | true  |
| 03474a07-f330-48bc-8329-5ca698083a62 | Loja Perus       | PER    | true  |
| 60a71af7-86ba-49e2-a4c7-7d1efc6cd8da | Loja Rio Pequeno | RIO    | true  |
| a23b528f-6cbb-4753-b1e9-6d387c8c5666 | Loja São Mateus  | SMT    | true  |
| 3704fcce-6e02-411d-a0ad-d96de801345a | Loja Suzano      | SUZ    | true  |
| 84f6b026-e712-4a5d-9062-9921287ac4b7 | Loja Suzano II   | SU2    | true  |

-- 📊 STEP 3: Verificar planos de conta principais
SELECT 
  id as "UUID do Plano",
  codigo as "Código", 
  nome as "Nome",
  categoria as "Categoria"
FROM plano_contas 
WHERE aceita_lancamento = true
ORDER BY codigo;

| UUID do Plano                        | Código | Nome                              | Categoria    |
| ------------------------------------ | ------ | --------------------------------- | ------------ |
| 96cebc3d-191f-4881-83af-66da5e56b1f8 | 13.99  | Saldo Inicial Padrão Yampa        | outros       |
| 7245ff34-af3e-44ce-8c29-f874dd392683 | 3.1.1  | Vendas em Dinheiro                | receita      |
| c010ac34-7fa2-48f7-96f9-fecc5d3849ac | 3.1.10 | Pagamento de Festas               | receita      |
| 29fa1653-1d27-4c2e-aef1-b87ad8c0faef | 3.1.2  | Vendas Cartões de Débito          | receita      |
| 515cb77e-d834-42e6-a1e8-cc2978e1cf9f | 3.1.3  | Vendas Cartões de Crédito         | receita      |
| 5b71ec0d-eae3-49ad-840a-4bbc1636bc64 | 3.1.4  | Vendas Cartões Parceladas         | receita      |
| 49dc783b-163a-4f1f-bf94-ccaf82f8feea | 3.1.5  | Vendas Cheques                    | receita      |
| 5201796a-6388-4ae1-aee8-c29296a72783 | 3.1.6  | Vendas Crediário                  | receita      |
| 7f54fec1-95d6-4e6c-96f0-d2a1e34dc619 | 3.1.7  | Vendas Convênios                  | receita      |
| 2742c847-cf17-44de-aafe-5ad00dd7d4cd | 3.1.8  | Vendas PIX                        | receita      |
| 8c355f2e-a7ad-4a5e-965c-59b3c6b3420e | 3.2.1  | Receitas de Serviços              | receita      |
| e755bbb3-34be-4986-a33b-1d8b3d3ce90d | 3.2.2  | Receitas Financeiras              | receita      |
| e140db2e-9e5a-433a-90d5-3ffcabb3a006 | 4.1.1  | Simples Nacional                  | custo        |
| f3ed42e7-82fc-45be-9a1c-87b1b425cbf8 | 4.1.2  | ICMS                              | custo        |
| af4f8748-de5e-4775-8379-8b3f47344ea2 | 4.1.3  | PIS                               | custo        |
| b5478163-bde3-4169-bff3-5b8a93d467d0 | 4.1.4  | COFINS                            | custo        |
| 3cdba05e-54f4-4e55-a3c0-f882c6a4dc47 | 4.2.1  | Fornecedores de Armações          | custo        |
| abb96b4a-004b-430b-8f6a-371c2b85b67f | 4.2.2  | Fornecedores de Lentes            | custo        |
| 491d08a9-cef8-4cdb-b861-da5c3f936af7 | 4.2.3  | Fornecedores de Lentes de Contato | custo        |
| 5a645cb4-8ba7-4863-8f81-f98822b7471a | 4.2.4  | Fornecedores de Acessórios        | custo        |
| 972d15bc-cf5c-42c0-b511-61ce686f8c54 | 4.3.1  | Comissões Vendedores              | custo        |
| 50a76b8c-e522-48bd-9418-d5659422c4f9 | 4.3.2  | Comissões Gerentes                | custo        |
| 9084205a-7e52-4dfc-a985-95ed445052c7 | 4.4.1  | Frete de Compras                  | custo        |
| 239403e1-7f1e-41b7-a031-3bc45cd1f1e1 | 4.4.2  | Embalagens                        | custo        |
| 094acf65-667f-416f-b538-31b51780157f | 4.4.3  | Gastos com Médicos                | custo        |
| c1aece91-3b3a-4c39-809f-b20172060ed9 | 4.4.4  | Montagem de Óculos                | custo        |
| c079b017-4c3a-410c-8b22-005754974fd6 | 4.7.1  | Pagamento Franquia                | custo        |
| 117f51c0-c89a-4c59-a6f3-4529cadadb45 | 5.1.1  | Material de Escritório            | despesa      |
| 19b7c33c-66e3-48e0-a9ae-c07ae01c6a50 | 5.1.2  | Telefone e Internet               | despesa      |
| 3862d682-0489-487d-8ef7-e8ba1cc669a0 | 5.1.3  | Correios e Sedex                  | despesa      |
| 64cd5a66-adc2-41d3-9f74-d684abb6265e | 5.1.4  | Software e Licenças               | despesa      |
| a81eb1b4-b40b-4af8-8fe3-2f36aeff862b | 5.1.5  | Contabilidade                     | despesa      |
| bfb0a395-60a4-4e3a-979c-22011db0a09b | 5.2.1  | Marketing e Publicidade           | despesa      |
| 19c55834-bac9-4bb7-b99f-4d7a4b162b7c | 5.2.2  | Brindes e Amostras                | despesa      |
| c669181e-37d4-4187-971e-3f71976346f1 | 5.2.21 | Pagamento Cartão de Crédito       | despesa      |
| 4a568769-f70c-43ab-9897-b96f8d413970 | 5.2.3  | Viagens e Hospedagens             | despesa      |
| 0aade745-1ec4-4999-9413-6b4307c59512 | 5.2.4  | Aluguel e Condomínio              | despesa      |
| bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7 | 5.2.5  | Energia Elétrica                  | despesa      |
| 0bd0f9c9-8eac-4a3e-8543-dbceead21cbe | 5.2.6  | Água e Esgoto                     | despesa      |
| a5a3f22a-9a85-4ab1-b9d6-e3509e0e4886 | 5.2.7  | Limpeza e Conservação             | despesa      |
| 496da68c-25cd-4934-8b43-fa1444f0591a | 5.2.8  | Almoço / Supermercado / Lanches   | despesa      |
| 445a81a4-179f-4046-80d6-4dd451cb6145 | 5.3.1  | Salário de Funcionários           | despesa      |
| ecaf0751-654a-43cb-97b4-3edb6bbd5a5d | 5.3.13 | Vale Adiantamento                 | despesa      |
| 4bce1b17-76ac-4381-a268-463973cec6bf | 5.3.2  | Encargos Sociais                  | despesa      |
| 01da7f53-41be-4c95-8ead-36c08d4a8b3c | 5.3.3  | Vale Transporte e Refeição        | despesa      |
| e580f87d-05db-4c11-a824-701e0bfb2a27 | 5.3.4  | Plano de Saúde                    | despesa      |
| 483645c7-1262-447b-9fd5-677178d9dae9 | 5.3.5  | Treinamentos                      | despesa      |
| d32b023e-18ad-4736-a208-5d228a1c7a90 | 5.3.9  | Pró-labore                        | despesa      |
| a31ac3ec-5538-457e-a5c6-835756d95886 | 6.1    | Móveis e Utensílios               | investimento |
| 9081185a-a006-4987-9715-53a0c81c8fdf | 6.2    | Equipamentos de Informática       | investimento |
| 7cf9fb21-40d8-446a-8f62-b236ac5e8aad | 6.3    | Reformas e Benfeitorias           | investimento |
| d5c819f4-3a74-4310-bd95-34782e5ea06b | 6.4    | Veículos                          | investimento |
| 45565837-907b-4455-93b5-6393c59e15be | 7.1.1  | Empréstimos Obtidos               | receita      |
| 6c489434-25ab-418c-9337-5ad11479e3c7 | 7.2.1  | Pagamento de Empréstimos          | despesa      |

-- 💰 STEP 4: Verificar dados atuais (se existem)
SELECT 
  'Lançamentos' as "Tabela",
  COUNT(*) as "Registros Atuais",
  SUM(CASE WHEN tipo = 'receber' THEN valor_total ELSE 0 END) as "Total Receitas",
  SUM(CASE WHEN tipo = 'pagar' THEN valor_total ELSE 0 END) as "Total Despesas"
FROM lancamentos

UNION ALL

SELECT 
  'Parcelas' as "Tabela",
  COUNT(*) as "Registros Atuais",
  SUM(CASE WHEN status = 'pago' THEN valor_pago ELSE 0 END) as "Total Pago",
  SUM(valor) as "Total Previsto"
FROM parcelas;


| Tabela      | Registros Atuais | Total Receitas | Total Despesas |
| ----------- | ---------------- | -------------- | -------------- |
| Lançamentos | 21351            | 2057341.30     | 2767265.31     |
| Parcelas    | 21351            | 4815159.80     | 4824606.61     |

-- 🎯 INSTRUÇÕES:
-- 1. Execute este script e anote o UUID da sua loja principal
-- 2. Verifique se existem planos de conta ou se precisa criar
-- 3. Se houver dados atuais, decida se quer limpar ou manter