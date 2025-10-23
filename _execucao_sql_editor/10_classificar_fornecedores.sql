-- Classificação automática de fornecedores por categoria
-- Segura e idempotente: pode ser reexecutada.
-- Estratégia (priorize plano de contas, depois fallback por nome):
--  1) Marcar colaboradores via plano de contas (5.3.* pessoal, comissões internas 4.4.1/4.4.5)
--  2) Marcar instituições financeiras (fallback por nome)
--  3) Marcar fisco (fallback por nome)
--  4) Marcar rótulos genéricos como 'outro' (fallback por nome)
--  5) Ajustar prestador_pf quando tipo_pessoa = 'fisica' e não for colaborador
--  6) Padronizar tipo_pessoa de colaboradores como 'fisica'

-- 1) Colaboradores via plano de contas (não por descrição)
UPDATE fornecedores f
SET categoria = 'colaborador'
WHERE EXISTS (
  SELECT 1
  FROM lancamentos l
  JOIN plano_contas pc ON pc.id = l.plano_id
  WHERE l.fornecedor_id = f.id
    AND (
      pc.codigo ILIKE '5.3.%'         -- Pessoal/folha
      OR pc.codigo IN ('4.4.1','4.4.5') -- Comissões internas
    )
)
AND f.categoria <> 'colaborador';

-- 2) Instituições financeiras e adquirentes
UPDATE fornecedores f
SET categoria = 'instituicao_financeira'
WHERE (
  f.nome ILIKE '%BANCO%'
  OR f.nome ILIKE '%ITAÚ%'
  OR f.nome ILIKE '%BRADESCO%'
  OR f.nome ILIKE '%SANTANDER%'
  OR f.nome ILIKE '%CAIXA%'
  OR f.nome ILIKE '%NUBANK%'
  OR f.nome ILIKE '%CIELO%'
  OR f.nome ILIKE '%STONE%'
  OR f.nome ILIKE '%REDE%'
  OR f.nome ILIKE '%GETNET%'
  OR f.nome ILIKE '%MERCADO PAGO%'
  OR f.nome ILIKE '%PAGSEGURO%'
)
AND f.categoria <> 'instituicao_financeira'
AND f.categoria <> 'colaborador';

-- 3) Fisco / Órgãos públicos
UPDATE fornecedores f
SET categoria = 'fisco'
WHERE (
  f.nome ILIKE '%PREFEITURA%'
  OR f.nome ILIKE '%DARF%'
  OR f.nome ILIKE '%GPS%'
  OR f.nome ILIKE '%INSS%'
  OR f.nome ILIKE '%SEFAZ%'
  OR f.nome ILIKE '%RECEITA FEDERAL%'
  OR f.nome ILIKE '%GNRE%'
)
AND f.categoria NOT IN ('colaborador','fisco');

-- 4) Rótulos genéricos que não são beneficiários (ex.: ALMOÇO FUNCIONÁRIOS)
UPDATE fornecedores f
SET categoria = 'outro'
WHERE (
  f.nome ILIKE 'ALMOÇO%'
  OR f.nome ILIKE 'CONDUÇÃO%'
  OR f.nome ILIKE 'DESPESAS %'
  OR f.nome ILIKE 'PAGAMENTO %'
)
AND f.categoria NOT IN ('colaborador','instituicao_financeira','fisco');

-- 5) Prestador PF (autônomos que não são colaboradores)
UPDATE fornecedores f
SET categoria = 'prestador_pf'
WHERE f.tipo_pessoa = 'fisica'
  AND f.categoria NOT IN ('colaborador','instituicao_financeira','fisco','outro','prestador_pf');

-- Observação: categorias restantes ficam como 'fornecedor' (default).

-- 6) Padronizar tipo_pessoa para colaboradores (normalmente PF)
UPDATE fornecedores f
SET tipo_pessoa = 'fisica'
WHERE f.categoria = 'colaborador'
  AND f.tipo_pessoa <> 'fisica';

-- Relatórios rápidos
-- SELECT categoria, COUNT(*) FROM fornecedores GROUP BY 1 ORDER BY 1;
-- SELECT categoria, SUM(p.valor) FROM fornecedores f
-- JOIN lancamentos l ON l.fornecedor_id = f.id
-- JOIN parcelas p ON p.lancamento_id = l.id
-- GROUP BY 1 ORDER BY 2 DESC NULLS LAST;
