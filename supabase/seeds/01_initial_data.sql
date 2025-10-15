-- =====================================================
-- PULSO FINANCE - SEEDS INICIAIS
-- Dados base extraídos da análise Yampa
-- =====================================================

-- =====================================================
-- 1. LOJAS DA REDE (baseado nos centros de custo)
-- =====================================================

INSERT INTO lojas (id, nome, codigo, razao_social, cnpj, ativa) VALUES
(gen_random_uuid(), 'Escritório', 'ESC', 'Mellooticas LTDA', '12.345.678/0001-00', true),
(gen_random_uuid(), 'Loja Suzano', 'SUZ', 'Mellooticas Suzano LTDA', '12.345.678/0002-00', true),
(gen_random_uuid(), 'Loja Mauá', 'MAU', 'Mellooticas Mauá LTDA', '12.345.678/0003-00', true),
(gen_random_uuid(), 'Loja Rio Pequeno', 'RIO', 'Mellooticas Rio Pequeno LTDA', '12.345.678/0004-00', true),
(gen_random_uuid(), 'Loja Suzano II', 'SU2', 'Mellooticas Suzano II LTDA', '12.345.678/0005-00', true),
(gen_random_uuid(), 'Loja São Mateus', 'SMT', 'Mellooticas São Mateus LTDA', '12.345.678/0006-00', true),
(gen_random_uuid(), 'Loja Perus', 'PER', 'Mellooticas Perus LTDA', '12.345.678/0007-00', true);

-- =====================================================
-- 2. FORMAS DE PAGAMENTO (baseado na análise)
-- =====================================================

INSERT INTO formas_pagamento (nome, tipo, taxa, prazo_dias, ativa) VALUES
('PIX', 'pix', 0.0000, 0, true),
('Dinheiro', 'dinheiro', 0.0000, 0, true),
('Boleto Bancário', 'boleto', 0.0150, 1, true),
('Cartão Débito à Vista', 'cartao_debito', 0.0299, 1, true),
('Cartão Crédito à Vista', 'cartao_credito', 0.0349, 30, true),
('Cartão Crédito Parcelado', 'cartao_credito', 0.0399, 30, true),
('Transferência Bancária', 'transferencia', 0.0000, 1, true);

-- =====================================================
-- 3. PLANO DE CONTAS ÓTICAS (baseado no arquivo Excel + análise)
-- =====================================================

-- RECEITAS (Classe 3)
INSERT INTO plano_contas (codigo, nome, categoria, grupo_dre, nivel, aceita_lancamento) VALUES
('3', 'RECEITAS', 'receita', 'receita_bruta', 1, false),
('3.1', 'Receitas de Vendas', 'receita', 'receita_bruta', 2, false),
('3.1.1', 'Vendas em Dinheiro', 'receita', 'receita_bruta', 3, true),
('3.1.2', 'Vendas Cartões de Débito', 'receita', 'receita_bruta', 3, true),
('3.1.3', 'Vendas Cartões de Crédito', 'receita', 'receita_bruta', 3, true),
('3.1.4', 'Vendas Cartões Parceladas', 'receita', 'receita_bruta', 3, true),
('3.1.5', 'Vendas Cheques', 'receita', 'receita_bruta', 3, true),
('3.1.6', 'Vendas Crediário', 'receita', 'receita_bruta', 3, true),
('3.1.7', 'Vendas Convênios', 'receita', 'receita_bruta', 3, true),
('3.1.8', 'Vendas PIX', 'receita', 'receita_bruta', 3, true),
('3.1.10', 'Pagamento de Festas', 'receita', 'receita_bruta', 3, true),
('3.2', 'Outras Receitas', 'receita', 'receita_bruta', 2, false),
('3.2.1', 'Receitas de Serviços', 'receita', 'receita_bruta', 3, true),
('3.2.2', 'Receitas Financeiras', 'receita', 'resultado_financeiro', 3, true);

-- CUSTOS VARIÁVEIS (Classe 4)
INSERT INTO plano_contas (codigo, nome, categoria, grupo_dre, nivel, aceita_lancamento) VALUES
('4', 'CUSTOS VARIÁVEIS', 'custo', 'cmv', 1, false),
('4.1', 'Impostos sobre Vendas', 'custo', 'deducoes_vendas', 2, false),
('4.1.1', 'Simples Nacional', 'custo', 'deducoes_vendas', 3, true),
('4.1.2', 'ICMS', 'custo', 'deducoes_vendas', 3, true),
('4.1.3', 'PIS', 'custo', 'deducoes_vendas', 3, true),
('4.1.4', 'COFINS', 'custo', 'deducoes_vendas', 3, true),
('4.2', 'Custo dos Produtos Vendidos', 'custo', 'cmv', 2, false),
('4.2.1', 'Fornecedores de Armações', 'custo', 'cmv', 3, true),
('4.2.2', 'Fornecedores de Lentes', 'custo', 'cmv', 3, true),
('4.2.3', 'Fornecedores de Lentes de Contato', 'custo', 'cmv', 3, true),
('4.2.4', 'Fornecedores de Acessórios', 'custo', 'cmv', 3, true),
('4.3', 'Comissões sobre Vendas', 'custo', 'cmv', 2, false),
('4.3.1', 'Comissões Vendedores', 'custo', 'cmv', 3, true),
('4.3.2', 'Comissões Gerentes', 'custo', 'cmv', 3, true),
('4.4', 'Custos Operacionais', 'custo', 'cmv', 2, false),
('4.4.1', 'Frete de Compras', 'custo', 'cmv', 3, true),
('4.4.2', 'Embalagens', 'custo', 'cmv', 3, true),
('4.4.3', 'Gastos com Médicos', 'custo', 'cmv', 3, true),
('4.4.4', 'Montagem de Óculos', 'custo', 'cmv', 3, true),
('4.7', 'Taxas e Franquias', 'custo', 'cmv', 2, false),
('4.7.1', 'Pagamento Franquia', 'custo', 'cmv', 3, true);

-- DESPESAS OPERACIONAIS (Classe 5)
INSERT INTO plano_contas (codigo, nome, categoria, grupo_dre, nivel, aceita_lancamento) VALUES
('5', 'DESPESAS OPERACIONAIS', 'despesa', 'despesas_operacionais', 1, false),
('5.1', 'Despesas Administrativas', 'despesa', 'despesas_operacionais', 2, false),
('5.1.1', 'Material de Escritório', 'despesa', 'despesas_operacionais', 3, true),
('5.1.2', 'Telefone e Internet', 'despesa', 'despesas_operacionais', 3, true),
('5.1.3', 'Correios e Sedex', 'despesa', 'despesas_operacionais', 3, true),
('5.1.4', 'Software e Licenças', 'despesa', 'despesas_operacionais', 3, true),
('5.1.5', 'Contabilidade', 'despesa', 'despesas_operacionais', 3, true),
('5.2', 'Despesas Comerciais', 'despesa', 'despesas_operacionais', 2, false),
('5.2.1', 'Marketing e Publicidade', 'despesa', 'despesas_operacionais', 3, true),
('5.2.2', 'Brindes e Amostras', 'despesa', 'despesas_operacionais', 3, true),
('5.2.3', 'Viagens e Hospedagens', 'despesa', 'despesas_operacionais', 3, true),
('5.2.4', 'Aluguel e Condomínio', 'despesa', 'despesas_operacionais', 3, true),
('5.2.5', 'Energia Elétrica', 'despesa', 'despesas_operacionais', 3, true),
('5.2.6', 'Água e Esgoto', 'despesa', 'despesas_operacionais', 3, true),
('5.2.7', 'Limpeza e Conservação', 'despesa', 'despesas_operacionais', 3, true),
('5.2.8', 'Almoço / Supermercado / Lanches', 'despesa', 'despesas_operacionais', 3, true),
('5.2.21', 'Pagamento Cartão de Crédito', 'despesa', 'despesas_operacionais', 3, true),
('5.3', 'Despesas com Pessoal', 'despesa', 'despesas_operacionais', 2, false),
('5.3.1', 'Salário de Funcionários', 'despesa', 'despesas_operacionais', 3, true),
('5.3.2', 'Encargos Sociais', 'despesa', 'despesas_operacionais', 3, true),
('5.3.3', 'Vale Transporte e Refeição', 'despesa', 'despesas_operacionais', 3, true),
('5.3.4', 'Plano de Saúde', 'despesa', 'despesas_operacionais', 3, true),
('5.3.5', 'Treinamentos', 'despesa', 'despesas_operacionais', 3, true),
('5.3.9', 'Pró-labore', 'despesa', 'despesas_operacionais', 3, true),
('5.3.13', 'Vale Adiantamento', 'despesa', 'despesas_operacionais', 3, true);

-- INVESTIMENTOS (Classe 6)
INSERT INTO plano_contas (codigo, nome, categoria, grupo_dre, nivel, aceita_lancamento) VALUES
('6', 'INVESTIMENTOS', 'investimento', 'outros', 1, false),
('6.1', 'Móveis e Utensílios', 'investimento', 'outros', 2, true),
('6.2', 'Equipamentos de Informática', 'investimento', 'outros', 2, true),
('6.3', 'Reformas e Benfeitorias', 'investimento', 'outros', 2, true),
('6.4', 'Veículos', 'investimento', 'outros', 2, true);

-- MOVIMENTAÇÕES NÃO OPERACIONAIS (Classe 7)
INSERT INTO plano_contas (codigo, nome, categoria, grupo_dre, nivel, aceita_lancamento) VALUES
('7', 'MOVIMENTAÇÕES NÃO OPERACIONAIS', 'outros', 'resultado_financeiro', 1, false),
('7.1', 'Entradas Não Operacionais', 'receita', 'resultado_financeiro', 2, false),
('7.1.1', 'Empréstimos Obtidos', 'receita', 'resultado_financeiro', 3, true),
('7.2', 'Saídas Não Operacionais', 'despesa', 'resultado_financeiro', 2, false),
('7.2.1', 'Pagamento de Empréstimos', 'despesa', 'resultado_financeiro', 3, true);

-- OUTRAS CONTAS
INSERT INTO plano_contas (codigo, nome, categoria, grupo_dre, nivel, aceita_lancamento) VALUES
('13', 'CONTAS ESPECIAIS', 'outros', 'outros', 1, false),
('13.99', 'Saldo Inicial Padrão Yampa', 'outros', 'outros', 2, true);

-- =====================================================
-- 4. CENTROS DE CUSTO POR LOJA
-- =====================================================

-- Obter IDs das lojas para criar centros de custo
DO $$
DECLARE
    loja_escritorio_id UUID;
    loja_suzano_id UUID;
    loja_maua_id UUID;
    loja_rio_id UUID;
    loja_suzano2_id UUID;
    loja_smateus_id UUID;
    loja_perus_id UUID;
BEGIN
    -- Buscar IDs das lojas
    SELECT id INTO loja_escritorio_id FROM lojas WHERE codigo = 'ESC';
    SELECT id INTO loja_suzano_id FROM lojas WHERE codigo = 'SUZ';
    SELECT id INTO loja_maua_id FROM lojas WHERE codigo = 'MAU';
    SELECT id INTO loja_rio_id FROM lojas WHERE codigo = 'RIO';
    SELECT id INTO loja_suzano2_id FROM lojas WHERE codigo = 'SU2';
    SELECT id INTO loja_smateus_id FROM lojas WHERE codigo = 'SMT';
    SELECT id INTO loja_perus_id FROM lojas WHERE codigo = 'PER';
    
    -- Criar centros de custo
    INSERT INTO centros_custo (loja_id, codigo, nome, descricao) VALUES
    (loja_escritorio_id, 'ADM', 'Administrativo', 'Centro administrativo e suporte'),
    (loja_suzano_id, 'VND', 'Vendas', 'Centro de vendas da loja'),
    (loja_suzano_id, 'OPE', 'Operacional', 'Operações da loja'),
    (loja_maua_id, 'VND', 'Vendas', 'Centro de vendas da loja'),
    (loja_maua_id, 'OPE', 'Operacional', 'Operações da loja'),
    (loja_rio_id, 'VND', 'Vendas', 'Centro de vendas da loja'),
    (loja_rio_id, 'OPE', 'Operacional', 'Operações da loja'),
    (loja_suzano2_id, 'VND', 'Vendas', 'Centro de vendas da loja'),
    (loja_suzano2_id, 'OPE', 'Operacional', 'Operações da loja'),
    (loja_smateus_id, 'VND', 'Vendas', 'Centro de vendas da loja'),
    (loja_smateus_id, 'OPE', 'Operacional', 'Operações da loja'),
    (loja_perus_id, 'VND', 'Vendas', 'Centro de vendas da loja'),
    (loja_perus_id, 'OPE', 'Operacional', 'Operações da loja');
END $$;

-- =====================================================
-- 5. FORNECEDORES PRINCIPAIS (baseado na análise)
-- =====================================================

INSERT INTO fornecedores (nome, tipo_pessoa, documento, ativo) VALUES
('SOLÓTICA - Lentes de Contato', 'juridica', '65.532.707/0001-94', true),
('FAST COMPANY ARMAÇÕES E LENTES LTDA', 'juridica', NULL, true),
('KONSEP CONTABILIDADE E CONSULTORIA LTDA', 'juridica', NULL, true),
('EDP BANDEIRANTES', 'juridica', NULL, true),
('CLARO NET', 'juridica', NULL, true),
('Restaurante Japallu', 'juridica', NULL, true),
('Padaria Renascer', 'juridica', NULL, true),
('Liris Ichie - Confeitaria', 'juridica', NULL, true),
('iFood', 'juridica', NULL, true),
('Uber', 'juridica', NULL, true),
('Softpel', 'juridica', NULL, true),
('Giovanna Mello de Camargo', 'fisica', NULL, true);

-- =====================================================
-- 6. CONTAS FINANCEIRAS EXEMPLO
-- =====================================================

-- Criar contas financeiras para cada loja
DO $$
DECLARE
    loja_rec RECORD;
BEGIN
    FOR loja_rec IN SELECT id, nome, codigo FROM lojas
    LOOP
        INSERT INTO contas_financeiras (loja_id, tipo, banco, apelido, saldo_inicial, ativa) VALUES
        (loja_rec.id, 'conta_corrente', 'Banco do Brasil', loja_rec.nome || ' - CC BB', 0, true),
        (loja_rec.id, 'caixa', NULL, loja_rec.nome || ' - Caixa', 0, true);
    END LOOP;
END $$;

-- =====================================================
-- 7. USUÁRIOS EXEMPLO (a serem criados via Supabase Auth)
-- =====================================================

-- Nota: Os usuários serão criados via Supabase Auth UI/API
-- Este é apenas um exemplo da estrutura esperada

/*
Usuários a serem criados:

1. admin@mellooticas.com (ADMIN)
   - Acesso completo a todas as lojas
   - BI avançado, analytics, insights

2. financeiro@mellooticas.com (FINANCEIRO)  
   - Acesso a todas as lojas
   - KPIs operacionais, DRE, fluxo de caixa

3. suzano@mellooticas.com (GERENCIAL)
   - Acesso apenas à Loja Suzano
   - Dashboard operacional básico

4. maua@mellooticas.com (GERENCIAL)
   - Acesso apenas à Loja Mauá
   - Dashboard operacional básico

... (outros gerentes)
*/

-- =====================================================
-- CONCLUSÃO DOS SEEDS
-- =====================================================

-- Atualizar referências pai no plano de contas
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '3') WHERE codigo LIKE '3.%' AND codigo != '3';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '3.1') WHERE codigo LIKE '3.1.%' AND codigo != '3.1';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '3.2') WHERE codigo LIKE '3.2.%' AND codigo != '3.2';

UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '4') WHERE codigo LIKE '4.%' AND codigo != '4';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '4.1') WHERE codigo LIKE '4.1.%' AND codigo != '4.1';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '4.2') WHERE codigo LIKE '4.2.%' AND codigo != '4.2';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '4.3') WHERE codigo LIKE '4.3.%' AND codigo != '4.3';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '4.4') WHERE codigo LIKE '4.4.%' AND codigo != '4.4';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '4.7') WHERE codigo LIKE '4.7.%' AND codigo != '4.7';

UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '5') WHERE codigo LIKE '5.%' AND codigo != '5';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '5.1') WHERE codigo LIKE '5.1.%' AND codigo != '5.1';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '5.2') WHERE codigo LIKE '5.2.%' AND codigo != '5.2';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '5.3') WHERE codigo LIKE '5.3.%' AND codigo != '5.3';

UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '6') WHERE codigo LIKE '6.%' AND codigo != '6';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '7') WHERE codigo LIKE '7.%' AND codigo != '7';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '7.1') WHERE codigo LIKE '7.1.%' AND codigo != '7.1';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '7.2') WHERE codigo LIKE '7.2.%' AND codigo != '7.2';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '13') WHERE codigo LIKE '13.%' AND codigo != '13';

-- Definir ordem de exibição
UPDATE plano_contas SET ordem_exibicao = 
  CASE codigo
    WHEN '3' THEN 100
    WHEN '4' THEN 200  
    WHEN '5' THEN 300
    WHEN '6' THEN 400
    WHEN '7' THEN 500
    WHEN '13' THEN 900
    ELSE 
      (SELECT ordem_exibicao FROM plano_contas p WHERE p.id = plano_contas.pai_id) + 
      (ROW_NUMBER() OVER (PARTITION BY pai_id ORDER BY codigo))
  END;