-- =====================================================
-- PULSO FINANCE - DADOS INICIAIS (SEEDS)
-- Execute após todas as outras queries do setup
-- =====================================================

-- =====================================================
-- 🏢 LOJAS DA REDE (6 LOJAS + ADMINISTRATIVA)
-- =====================================================

INSERT INTO lojas (id, nome, codigo, razao_social, cnpj, endereco, telefone, email, responsavel, ativa, meta_mensal) VALUES
(gen_random_uuid(), 'PULSO Ótica Centro', 'LJ001', 'PULSO Ótica Centro LTDA', '12.345.678/0001-01', '{"logradouro": "Rua das Flores, 123", "bairro": "Centro", "cidade": "São Paulo", "uf": "SP", "cep": "01234-567"}', '(11) 3456-7890', 'centro@pulsootica.com.br', 'Maria Silva', true, 180000.00),
(gen_random_uuid(), 'PULSO Ótica Shopping Norte', 'LJ002', 'PULSO Ótica Norte LTDA', '12.345.678/0002-02', '{"logradouro": "Av. Marginal Norte, 456", "bairro": "Vila Norte", "cidade": "São Paulo", "uf": "SP", "cep": "02345-678"}', '(11) 3567-8901', 'norte@pulsootica.com.br', 'João Santos', true, 220000.00),
(gen_random_uuid(), 'PULSO Ótica Zona Sul', 'LJ003', 'PULSO Ótica Sul LTDA', '12.345.678/0003-03', '{"logradouro": "Rua da Liberdade, 789", "bairro": "Vila Olímpia", "cidade": "São Paulo", "uf": "SP", "cep": "03456-789"}', '(11) 3678-9012', 'sul@pulsootica.com.br', 'Ana Costa', true, 195000.00),
(gen_random_uuid(), 'PULSO Ótica ABC', 'LJ004', 'PULSO Ótica ABC LTDA', '12.345.678/0004-04', '{"logradouro": "Av. Industrial, 321", "bairro": "Centro", "cidade": "Santo André", "uf": "SP", "cep": "04567-890"}', '(11) 4789-0123', 'abc@pulsootica.com.br', 'Carlos Mendes', true, 165000.00),
(gen_random_uuid(), 'PULSO Ótica Guarulhos', 'LJ005', 'PULSO Ótica Guarulhos LTDA', '12.345.678/0005-05', '{"logradouro": "Rua Presidente Vargas, 654", "bairro": "Centro", "cidade": "Guarulhos", "uf": "SP", "cep": "05678-901"}', '(11) 2890-1234', 'guarulhos@pulsootica.com.br', 'Fernanda Lima', true, 145000.00),
(gen_random_uuid(), 'PULSO Ótica Osasco', 'LJ006', 'PULSO Ótica Osasco LTDA', '12.345.678/0006-06', '{"logradouro": "Av. dos Autonomistas, 987", "bairro": "Centro", "cidade": "Osasco", "uf": "SP", "cep": "06789-012"}', '(11) 3901-2345', 'osasco@pulsootica.com.br', 'Roberto Ferreira', true, 155000.00),
(gen_random_uuid(), 'PULSO Matriz/Administrativa', 'ADM', 'PULSO Ótica Holding S.A.', '12.345.678/0001-00', '{"logradouro": "Av. Paulista, 1000", "bairro": "Bela Vista", "cidade": "São Paulo", "uf": "SP", "cep": "01310-100"}', '(11) 3000-0000', 'admin@pulsootica.com.br', 'Diretor Geral', true, 0.00);

-- =====================================================
-- 📊 PLANO DE CONTAS ESTRUTURADO
-- =====================================================

-- RECEITAS
INSERT INTO plano_contas (codigo, nome, categoria, grupo_dre, nivel, pai_id, aceita_lancamento, ordem_exibicao) VALUES
('3.0.0.0', 'RECEITAS', 'receita', 'receita_bruta', 1, NULL, false, 1),
('3.1.0.0', 'RECEITA OPERACIONAL', 'receita', 'receita_bruta', 2, (SELECT id FROM plano_contas WHERE codigo = '3.0.0.0'), false, 1),
('3.1.1.0', 'Venda de Produtos', 'receita', 'receita_bruta', 3, (SELECT id FROM plano_contas WHERE codigo = '3.1.0.0'), false, 1),
('3.1.1.1', 'Óculos de Grau', 'receita', 'receita_bruta', 4, (SELECT id FROM plano_contas WHERE codigo = '3.1.1.0'), true, 1),
('3.1.1.2', 'Óculos de Sol', 'receita', 'receita_bruta', 4, (SELECT id FROM plano_contas WHERE codigo = '3.1.1.0'), true, 2),
('3.1.1.3', 'Lentes de Contato', 'receita', 'receita_bruta', 4, (SELECT id FROM plano_contas WHERE codigo = '3.1.1.0'), true, 3),
('3.1.1.4', 'Acessórios', 'receita', 'receita_bruta', 4, (SELECT id FROM plano_contas WHERE codigo = '3.1.1.0'), true, 4),
('3.1.2.0', 'Prestação de Serviços', 'receita', 'receita_bruta', 3, (SELECT id FROM plano_contas WHERE codigo = '3.1.0.0'), false, 2),
('3.1.2.1', 'Exames Oftalmológicos', 'receita', 'receita_bruta', 4, (SELECT id FROM plano_contas WHERE codigo = '3.1.2.0'), true, 1),
('3.1.2.2', 'Reparos e Ajustes', 'receita', 'receita_bruta', 4, (SELECT id FROM plano_contas WHERE codigo = '3.1.2.0'), true, 2),

-- DEDUÇÕES
('3.2.0.0', 'DEDUÇÕES DE VENDAS', 'receita', 'deducoes_vendas', 2, (SELECT id FROM plano_contas WHERE codigo = '3.0.0.0'), false, 2),
('3.2.1.1', 'Devoluções', 'receita', 'deducoes_vendas', 4, (SELECT id FROM plano_contas WHERE codigo = '3.2.0.0'), true, 1),
('3.2.2.1', 'Descontos Concedidos', 'receita', 'deducoes_vendas', 4, (SELECT id FROM plano_contas WHERE codigo = '3.2.0.0'), true, 2),
('3.2.3.1', 'Impostos s/ Vendas', 'receita', 'deducoes_vendas', 4, (SELECT id FROM plano_contas WHERE codigo = '3.2.0.0'), true, 3);

-- CUSTOS
INSERT INTO plano_contas (codigo, nome, categoria, grupo_dre, nivel, pai_id, aceita_lancamento, ordem_exibicao) VALUES
('4.0.0.0', 'CUSTOS', 'custo', 'cmv', 1, NULL, false, 2),
('4.1.0.0', 'CUSTO DOS PRODUTOS VENDIDOS', 'custo', 'cmv', 2, (SELECT id FROM plano_contas WHERE codigo = '4.0.0.0'), false, 1),
('4.1.1.1', 'Custo Óculos de Grau', 'custo', 'cmv', 4, (SELECT id FROM plano_contas WHERE codigo = '4.1.0.0'), true, 1),
('4.1.1.2', 'Custo Óculos de Sol', 'custo', 'cmv', 4, (SELECT id FROM plano_contas WHERE codigo = '4.1.0.0'), true, 2),
('4.1.1.3', 'Custo Lentes de Contato', 'custo', 'cmv', 4, (SELECT id FROM plano_contas WHERE codigo = '4.1.0.0'), true, 3),
('4.1.1.4', 'Custo Acessórios', 'custo', 'cmv', 4, (SELECT id FROM plano_contas WHERE codigo = '4.1.0.0'), true, 4),
('4.1.2.1', 'Fretes de Compras', 'custo', 'cmv', 4, (SELECT id FROM plano_contas WHERE codigo = '4.1.0.0'), true, 5);

-- DESPESAS OPERACIONAIS
INSERT INTO plano_contas (codigo, nome, categoria, grupo_dre, nivel, pai_id, aceita_lancamento, ordem_exibicao) VALUES
('5.0.0.0', 'DESPESAS', 'despesa', 'despesas_operacionais', 1, NULL, false, 3),
('5.1.0.0', 'DESPESAS ADMINISTRATIVAS', 'despesa', 'despesas_operacionais', 2, (SELECT id FROM plano_contas WHERE codigo = '5.0.0.0'), false, 1),
('5.1.1.1', 'Salários e Ordenados', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 1),
('5.1.1.2', 'Encargos Sociais', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 2),
('5.1.1.3', 'FGTS', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 3),
('5.1.1.4', 'Vale Transporte', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 4),
('5.1.1.5', 'Vale Alimentação', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 5),
('5.1.2.1', 'Energia Elétrica', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 6),
('5.1.2.2', 'Telefone/Internet', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 7),
('5.1.2.3', 'Água e Esgoto', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 8),
('5.1.3.1', 'Aluguel', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 9),
('5.1.3.2', 'Condomínio', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 10),
('5.1.3.3', 'IPTU', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 11),
('5.1.4.1', 'Material de Escritório', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 12),
('5.1.4.2', 'Material de Limpeza', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 13),
('5.1.5.1', 'Marketing e Publicidade', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 14),
('5.1.5.2', 'Assessoria Contábil', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 15),
('5.1.5.3', 'Assessoria Jurídica', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 16),
('5.1.6.1', 'Manutenção e Reparos', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 17),
('5.1.6.2', 'Seguros', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 18),
('5.1.7.1', 'Impostos e Taxas', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 19),
('5.1.8.1', 'Depreciação', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.1.0.0'), true, 20);

-- DESPESAS COMERCIAIS
INSERT INTO plano_contas (codigo, nome, categoria, grupo_dre, nivel, pai_id, aceita_lancamento, ordem_exibicao) VALUES
('5.2.0.0', 'DESPESAS COMERCIAIS', 'despesa', 'despesas_operacionais', 2, (SELECT id FROM plano_contas WHERE codigo = '5.0.0.0'), false, 2),
('5.2.1.1', 'Comissões sobre Vendas', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.2.0.0'), true, 1),
('5.2.2.1', 'Frete sobre Vendas', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.2.0.0'), true, 2),
('5.2.3.1', 'Cartão de Crédito - Taxa', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.2.0.0'), true, 3),
('5.2.3.2', 'PIX - Taxa', 'despesa', 'despesas_operacionais', 4, (SELECT id FROM plano_contas WHERE codigo = '5.2.0.0'), true, 4);

-- RESULTADO FINANCEIRO
INSERT INTO plano_contas (codigo, nome, categoria, grupo_dre, nivel, pai_id, aceita_lancamento, ordem_exibicao) VALUES
('6.0.0.0', 'RESULTADO FINANCEIRO', 'receita', 'resultado_financeiro', 1, NULL, false, 4),
('6.1.0.0', 'RECEITAS FINANCEIRAS', 'receita', 'resultado_financeiro', 2, (SELECT id FROM plano_contas WHERE codigo = '6.0.0.0'), false, 1),
('6.1.1.1', 'Juros Recebidos', 'receita', 'resultado_financeiro', 4, (SELECT id FROM plano_contas WHERE codigo = '6.1.0.0'), true, 1),
('6.1.1.2', 'Rendimentos Aplicações', 'receita', 'resultado_financeiro', 4, (SELECT id FROM plano_contas WHERE codigo = '6.1.0.0'), true, 2),
('6.1.1.3', 'Descontos Obtidos', 'receita', 'resultado_financeiro', 4, (SELECT id FROM plano_contas WHERE codigo = '6.1.0.0'), true, 3),
('6.2.0.0', 'DESPESAS FINANCEIRAS', 'despesa', 'resultado_financeiro', 2, (SELECT id FROM plano_contas WHERE codigo = '6.0.0.0'), false, 2),
('6.2.1.1', 'Juros Pagos', 'despesa', 'resultado_financeiro', 4, (SELECT id FROM plano_contas WHERE codigo = '6.2.0.0'), true, 1),
('6.2.1.2', 'Multas e Juros', 'despesa', 'resultado_financeiro', 4, (SELECT id FROM plano_contas WHERE codigo = '6.2.0.0'), true, 2),
('6.2.1.3', 'Tarifas Bancárias', 'despesa', 'resultado_financeiro', 4, (SELECT id FROM plano_contas WHERE codigo = '6.2.0.0'), true, 3),
('6.2.1.4', 'IOF', 'despesa', 'resultado_financeiro', 4, (SELECT id FROM plano_contas WHERE codigo = '6.2.0.0'), true, 4);

-- =====================================================
-- 💰 FORMAS DE PAGAMENTO
-- =====================================================

INSERT INTO formas_pagamento (nome, tipo, taxa, prazo_dias, ativa, configuracoes) VALUES
('Dinheiro', 'dinheiro', 0.0000, 0, true, '{"aceita_parcelamento": false}'),
('PIX', 'pix', 0.0000, 0, true, '{"aceita_parcelamento": false}'),
('Cartão Débito', 'cartao_debito', 0.0200, 1, true, '{"aceita_parcelamento": false}'),
('Cartão Crédito à Vista', 'cartao_credito', 0.0280, 30, true, '{"aceita_parcelamento": true, "max_parcelas": 1}'),
('Cartão Crédito 2x', 'cartao_credito', 0.0320, 30, true, '{"aceita_parcelamento": true, "max_parcelas": 2}'),
('Cartão Crédito 3x', 'cartao_credito', 0.0350, 30, true, '{"aceita_parcelamento": true, "max_parcelas": 3}'),
('Cartão Crédito 4x', 'cartao_credito', 0.0380, 30, true, '{"aceita_parcelamento": true, "max_parcelas": 4}'),
('Cartão Crédito 5x', 'cartao_credito', 0.0410, 30, true, '{"aceita_parcelamento": true, "max_parcelas": 5}'),
('Cartão Crédito 6x', 'cartao_credito', 0.0440, 30, true, '{"aceita_parcelamento": true, "max_parcelas": 6}'),
('Boleto', 'boleto', 0.0090, 3, true, '{"aceita_parcelamento": false}'),
('Transferência', 'transferencia', 0.0000, 1, true, '{"aceita_parcelamento": false}'),
('Outros', 'outros', 0.0000, 0, true, '{"aceita_parcelamento": true}');

-- =====================================================
-- 🏦 CONTAS FINANCEIRAS PARA CADA LOJA
-- =====================================================

INSERT INTO contas_financeiras (loja_id, tipo, banco, agencia, numero, digito, apelido, saldo_inicial, saldo_atual, ativa) 
SELECT 
  l.id as loja_id,
  'conta_corrente'::tipo_conta_financeira,
  'Banco do Brasil',
  '1234',
  '56789',
  '0',
  l.codigo || ' - BB CC',
  50000.00,
  50000.00,
  true
FROM lojas l WHERE l.codigo LIKE 'LJ%';

INSERT INTO contas_financeiras (loja_id, tipo, banco, agencia, numero, digito, apelido, saldo_inicial, saldo_atual, ativa) 
SELECT 
  l.id as loja_id,
  'caixa'::tipo_conta_financeira,
  NULL,
  NULL,
  NULL,
  NULL,
  l.codigo || ' - Caixa',
  5000.00,
  5000.00,
  true
FROM lojas l WHERE l.codigo LIKE 'LJ%';

-- Conta matriz
INSERT INTO contas_financeiras (loja_id, tipo, banco, agencia, numero, digito, apelido, saldo_inicial, saldo_atual, ativa) 
SELECT 
  l.id as loja_id,
  'conta_corrente'::tipo_conta_financeira,
  'Itaú',
  '9876',
  '12345',
  '1',
  'Matriz - Itaú',
  500000.00,
  500000.00,
  true
FROM lojas l WHERE l.codigo = 'ADM';

-- =====================================================
-- 🧾 CENTROS DE CUSTO
-- =====================================================

INSERT INTO centros_custo (loja_id, codigo, nome, descricao, ativo)
SELECT 
  l.id,
  'VENDA',
  'Vendas',
  'Centro de custo para operações de venda',
  true
FROM lojas l;

INSERT INTO centros_custo (loja_id, codigo, nome, descricao, ativo)
SELECT 
  l.id,
  'ADMIN',
  'Administrativo',
  'Centro de custo para despesas administrativas',
  true
FROM lojas l;

-- =====================================================
-- 👥 FORNECEDORES PRINCIPAIS
-- =====================================================

INSERT INTO fornecedores (nome, tipo_pessoa, documento, email, telefone, endereco, observacoes, ativo) VALUES
('Luxottica do Brasil', 'juridica', '12.345.678/0001-90', 'comercial@luxottica.com.br', '(11) 3456-7890', '{"logradouro": "Av. Industrial, 1000", "cidade": "São Paulo", "uf": "SP"}', 'Fornecedor principal Ray-Ban, Oakley', true),
('Essilor Brasil', 'juridica', '23.456.789/0001-01', 'vendas@essilor.com.br', '(11) 2345-6789', '{"logradouro": "Rua das Lentes, 500", "cidade": "São Paulo", "uf": "SP"}', 'Lentes oftálmicas premium', true),
('Zeiss Vision Care', 'juridica', '34.567.890/0001-12', 'contato@zeiss.com.br', '(11) 4567-8901', '{"logradouro": "Av. Tecnologia, 200", "cidade": "São Paulo", "uf": "SP"}', 'Lentes de alta qualidade', true),
('Johnson & Johnson Vision', 'juridica', '45.678.901/0001-23', 'comercial@jnjvision.com.br', '(11) 5678-9012', '{"logradouro": "Rua Inovação, 300", "cidade": "São Paulo", "uf": "SP"}', 'Lentes de contato', true),
('Safilo Group', 'juridica', '56.789.012/0001-34', 'brasil@safilo.com', '(11) 6789-0123', '{"logradouro": "Av. Fashion, 400", "cidade": "São Paulo", "uf": "SP"}', 'Marcas de luxo', true),
('Centrolab', 'juridica', '67.890.123/0001-45', 'pedidos@centrolab.com.br', '(11) 7890-1234', '{"logradouro": "Rua do Laboratório, 100", "cidade": "São Paulo", "uf": "SP"}', 'Laboratório surfaçagem', true),
('Alpha Optical', 'juridica', '78.901.234/0001-56', 'vendas@alphaoptical.com.br', '(11) 8901-2345', '{"logradouro": "Av. Ótica, 600", "cidade": "São Paulo", "uf": "SP"}', 'Distribuidor nacional', true),
('Óticas Carol', 'juridica', '89.012.345/0001-67', 'franquia@oticascarol.com.br', '(11) 9012-3456', '{"logradouro": "Rua Comercial, 700", "cidade": "São Paulo", "uf": "SP"}', 'Rede parceira', true),
('Enel São Paulo', 'juridica', '90.123.456/0001-78', 'atendimento@enel.com.br', '0800-72-72-196', '{"logradouro": "Av. Energia, 800", "cidade": "São Paulo", "uf": "SP"}', 'Concessionária energia elétrica', true),
('Vivo Empresas', 'juridica', '01.234.567/0001-89', 'empresas@vivo.com.br', '(11) 1234-5678', '{"logradouro": "Av. Comunicação, 900", "cidade": "São Paulo", "uf": "SP"}', 'Telecom e internet', true);

-- =====================================================
-- ✅ VALIDAÇÃO DOS DADOS
-- =====================================================

-- Verificar se tudo foi inserido corretamente
SELECT 'Lojas criadas:' as item, COUNT(*) as total FROM lojas
UNION ALL
SELECT 'Contas do plano:' as item, COUNT(*) as total FROM plano_contas
UNION ALL
SELECT 'Formas de pagamento:' as item, COUNT(*) as total FROM formas_pagamento
UNION ALL
SELECT 'Contas financeiras:' as item, COUNT(*) as total FROM contas_financeiras
UNION ALL
SELECT 'Centros de custo:' as item, COUNT(*) as total FROM centros_custo
UNION ALL
SELECT 'Fornecedores:' as item, COUNT(*) as total FROM fornecedores;

-- =====================================================
-- 🔄 ATUALIZAR VIEWS MATERIALIZADAS
-- =====================================================

REFRESH MATERIALIZED VIEW mv_dre_mensal;
REFRESH MATERIALIZED VIEW mv_fluxo_caixa;

-- =====================================================
-- 🎉 SETUP COMPLETO!
-- =====================================================

SELECT 
  '🎉 PULSO Finance configurado com sucesso!' as status,
  'Acesse o Authentication no Supabase para criar os primeiros usuários' as proximo_passo;