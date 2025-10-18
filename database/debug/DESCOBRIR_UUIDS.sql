-- =============================================
-- INVESTIGAR UUIDs REAIS - PULSO FINANCE
-- =============================================
-- Execute para descobrir os UUIDs corretos das FKs

-- 🏢 UUIDs das lojas (para usar nas FKs)
SELECT 
  id,
  codigo,
  nome
FROM lojas 
ORDER BY codigo;

| id                                   | codigo | nome             |
| ------------------------------------ | ------ | ---------------- |
| 692e5aea-e785-4675-9d44-9f3e24b36b01 | ESC    | Escritório       |
| b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe | MAU    | Loja Mauá        |
| 03474a07-f330-48bc-8329-5ca698083a62 | PER    | Loja Perus       |
| 60a71af7-86ba-49e2-a4c7-7d1efc6cd8da | RIO    | Loja Rio Pequeno |
| a23b528f-6cbb-4753-b1e9-6d387c8c5666 | SMT    | Loja São Mateus  |
| 84f6b026-e712-4a5d-9062-9921287ac4b7 | SU2    | Loja Suzano II   |
| 3704fcce-6e02-411d-a0ad-d96de801345a | SUZ    | Loja Suzano      |

-- 📊 UUIDs do plano de contas (primeiros 20)
SELECT 
  id,
  codigo,
  nome,
  categoria
FROM plano_contas 
WHERE aceita_lancamento = true
ORDER BY codigo;
| id                                   | codigo | nome                              | categoria    |
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


-- 👥 UUIDs dos usuários
SELECT 
  id,
  email,
  papel
FROM usuarios;

| id                                   | email                         | papel      |
| ------------------------------------ | ----------------------------- | ---------- |
| 84ab5c15-1d27-4933-a3f1-bb9d57f77e7a | financeiroesc@hotmail.com     | financeiro |
| 4d316b1a-4914-4d0f-8724-2330ca0c97a8 | tgjphotos@gmail.com           | gerencial  |
| 8a138b5b-9bfd-4ee3-8a02-18ac8f3124dc | junior@oticastatymello.com.br | admin      |


-- 💳 UUIDs das formas de pagamento
SELECT 
  id,
  nome,
  tipo
FROM formas_pagamento;

| id                                   | nome                     | tipo           |
| ------------------------------------ | ------------------------ | -------------- |
| cb8bf5a9-31d2-49de-bcb7-e2579feabdaf | PIX                      | pix            |
| 43e2dcf9-1e47-45a5-8357-746a2b3e4d53 | Dinheiro                 | dinheiro       |
| 6fcfbf8d-c183-45c8-8c61-6c665d1a6286 | Boleto Bancário          | boleto         |
| 60c9dc7d-435e-4e49-97d2-539803fff4b9 | Cartão Débito à Vista    | cartao_debito  |
| 54b6ee98-0b09-48d1-a53d-91b47cf2b74e | Cartão Crédito à Vista   | cartao_credito |
| 2c2f77cb-83c1-486f-8ebe-d3999cebe9a1 | Cartão Crédito Parcelado | cartao_credito |
| f78af8f2-9e7d-44db-9c75-77dfc5f6e998 | Transferência Bancária   | transferencia  |


-- 🏦 UUIDs das contas financeiras
SELECT 
  id,
  apelido,
  tipo,
  loja_id
FROM contas_financeiras;

| id                                   | apelido                  | tipo           | loja_id                              |
| ------------------------------------ | ------------------------ | -------------- | ------------------------------------ |
| ff3720b1-5a68-4863-97cf-ee9de465f872 | Escritório - CC BB       | conta_corrente | 692e5aea-e785-4675-9d44-9f3e24b36b01 |
| 27a7ee11-e1ce-46dd-897f-63272f4c0107 | Loja Suzano - CC BB      | conta_corrente | 3704fcce-6e02-411d-a0ad-d96de801345a |
| f7982fa6-cb67-430d-9502-d5d84962375d | Loja Mauá - CC BB        | conta_corrente | b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe |
| e8c5e985-2d57-477a-8505-9f1e73b8d1f2 | Loja Rio Pequeno - CC BB | conta_corrente | 60a71af7-86ba-49e2-a4c7-7d1efc6cd8da |
| c70713a1-aa28-4679-ac60-6752f38e8392 | Loja Suzano II - CC BB   | conta_corrente | 84f6b026-e712-4a5d-9062-9921287ac4b7 |
| f6bf66d0-ca41-423f-acd5-87d3a5cf3d4a | Loja São Mateus - CC BB  | conta_corrente | a23b528f-6cbb-4753-b1e9-6d387c8c5666 |
| 1c86faec-c400-4531-b7f1-7ba6168250bd | Loja Perus - CC BB       | conta_corrente | 03474a07-f330-48bc-8329-5ca698083a62 |
| 244039c9-a0d2-4f1f-ba44-e082e92bc02b | Escritório - Caixa       | caixa          | 692e5aea-e785-4675-9d44-9f3e24b36b01 |
| 9159f2d7-1e61-4308-a06c-e6f034acb3b8 | Loja Suzano - Caixa      | caixa          | 3704fcce-6e02-411d-a0ad-d96de801345a |
| 15514aa8-5ba1-4993-8972-d9189d10c85f | Loja Mauá - Caixa        | caixa          | b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe |
| 02ec6788-b9bb-4632-99da-dcc602b92034 | Loja Rio Pequeno - Caixa | caixa          | 60a71af7-86ba-49e2-a4c7-7d1efc6cd8da |
| 1a75ab11-e5fb-4754-a730-87d2d25263a8 | Loja Suzano II - Caixa   | caixa          | 84f6b026-e712-4a5d-9062-9921287ac4b7 |
| 2761e718-0230-4532-b483-06f468018203 | Loja São Mateus - Caixa  | caixa          | a23b528f-6cbb-4753-b1e9-6d387c8c5666 |
| adbba3de-d4a4-4d43-b2c5-09a718c964ec | Loja Perus - Caixa       | caixa          | 03474a07-f330-48bc-8329-5ca698083a62 |
