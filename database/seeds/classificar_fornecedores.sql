-- Classificação automática de fornecedores por categoria
-- Segura e idempotente: pode ser reexecutada.
-- Estratégia:
--  1) Marcar colaboradores por padrões fortes em nome
--  2) Marcar instituições financeiras
--  3) Marcar fisco
--  4) Marcar rótulos genéricos como 'outro'
--  5) Ajustar prestador_pf quando tipo_pessoa = 'fisica' e não for colaborador

-- 1) Colaboradores (folha/adiantamento/benefícios)
UPDATE fornecedores f
SET categoria = 'colaborador'
WHERE (
  f.nome ILIKE '%FUNCIONÁRIOS%'
  OR f.nome ILIKE '%SALÁRIO%'
  OR f.nome ILIKE '%PAGAMENTO FUNCIONÁRIOS%'
  OR f.nome ILIKE '%ADIANTAMENTO%'
  OR f.nome ILIKE '%FOLHA%'
  OR f.nome ILIKE '%VALE TRANSPORTE%'
  OR f.nome ILIKE '% VT %' OR f.nome ILIKE 'VT %' OR f.nome ILIKE '% VT'
  OR f.nome ILIKE '%VR%'
  OR f.nome ILIKE '%FÉRIAS%'
  OR f.nome ILIKE '%RESCISÃO%'
  OR f.nome ILIKE '%DÉCIMO TERCEIRO%'
  OR f.nome ILIKE '%13º%'
  OR f.nome ILIKE '%EXAME ADMISSIONAL%'
  OR f.nome ILIKE '%COMISSÃO:%'
  OR f.nome ILIKE '%TESTE:%'
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

-- Relatórios rápidos
-- SELECT categoria, COUNT(*) FROM fornecedores GROUP BY 1 ORDER BY 1;
-- SELECT categoria, SUM(p.valor) FROM fornecedores f
-- JOIN lancamentos l ON l.fornecedor_id = f.id
-- JOIN parcelas p ON p.lancamento_id = l.id
-- GROUP BY 1 ORDER BY 2 DESC NULLS LAST;
