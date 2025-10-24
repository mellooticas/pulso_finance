-- Inserts/Updates para tabela public.lojas

INSERT INTO public.lojas (id, nome, codigo, razao_social, cnpj, endereco, telefone, email, responsavel, ativa, meta_mensal, created_at, updated_at)
VALUES
('069c77db-2502-4fa6-b714-51e76f9bc719', 'Mello Óticas Rio Pequeno', '011', 'VISIONTECH ÓPTICA LTDA', '12.345.678/0007-76',
 '{"logradouro": "Avenida do Rio Pequeno", "numero": "675", "bairro": "Rio Pequeno", "cidade": "São Paulo", "uf": "SP", "cep": "05119-001"}', 
 '(11) 97745-3897', NULL, 'Dr. João Silva Santos', true, 0, '2025-04-14 13:17:07.376736', '2025-07-03 17:47:11.263955')
ON CONFLICT (id) DO UPDATE SET
  nome = EXCLUDED.nome,
  codigo = EXCLUDED.codigo,
  razao_social = EXCLUDED.razao_social,
  cnpj = EXCLUDED.cnpj,
  endereco = EXCLUDED.endereco,
  telefone = EXCLUDED.telefone,
  email = EXCLUDED.email,
  responsavel = EXCLUDED.responsavel,
  ativa = EXCLUDED.ativa,
  meta_mensal = EXCLUDED.meta_mensal,
  updated_at = EXCLUDED.updated_at;

INSERT INTO public.lojas (id, nome, codigo, razao_social, cnpj, endereco, telefone, email, responsavel, ativa, meta_mensal, created_at, updated_at)
VALUES
('534cba2b-932f-4d26-b003-ae1dcb903361', 'Mello Óticas - Escritório', '013', 'VISIONTECH ÓPTICA LTDA', '12.345.678/0001-90',
 '{"logradouro": "Rua Alfredo Batista Pizolato", "numero": "148", "bairro": "Centro", "cidade": "Suzano", "uf": "SP", "cep": "08675-000"}',
 '(11) 98599-2141', NULL, 'Dr. João Silva Santos', true, 0, '2025-04-08 16:57:35.02716', '2025-07-04 21:55:43.888636')
ON CONFLICT (id) DO UPDATE SET
  nome = EXCLUDED.nome,
  codigo = EXCLUDED.codigo,
  razao_social = EXCLUDED.razao_social,
  cnpj = EXCLUDED.cnpj,
  endereco = EXCLUDED.endereco,
  telefone = EXCLUDED.telefone,
  email = EXCLUDED.email,
  responsavel = EXCLUDED.responsavel,
  ativa = EXCLUDED.ativa,
  meta_mensal = EXCLUDED.meta_mensal,
  updated_at = EXCLUDED.updated_at;

INSERT INTO public.lojas (id, nome, codigo, razao_social, cnpj, endereco, telefone, email, responsavel, ativa, meta_mensal, created_at, updated_at)
VALUES
('bab835bc-2df1-4f54-87c3-8151c61ec642', 'Lancaster - Suzano', '042', 'VISIONTECH ÓPTICA LTDA', '12.345.678/0002-71',
 '{"logradouro": "Rua General Francisco Glicério", "numero": "940", "bairro": "Centro", "cidade": "Suzano", "uf": "SP", "cep": "08674-000"}',
 '(11) 94989-5783', NULL, 'Dr. João Silva Santos', true, 0, '2025-04-08 16:56:25.769983', '2025-07-03 17:47:11.263955')
ON CONFLICT (id) DO UPDATE SET
  nome = EXCLUDED.nome,
  codigo = EXCLUDED.codigo,
  razao_social = EXCLUDED.razao_social,
  cnpj = EXCLUDED.cnpj,
  endereco = EXCLUDED.endereco,
  telefone = EXCLUDED.telefone,
  email = EXCLUDED.email,
  responsavel = EXCLUDED.responsavel,
  ativa = EXCLUDED.ativa,
  meta_mensal = EXCLUDED.meta_mensal,
  updated_at = EXCLUDED.updated_at;

INSERT INTO public.lojas (id, nome, codigo, razao_social, cnpj, endereco, telefone, email, responsavel, ativa, meta_mensal, created_at, updated_at)
VALUES
('f03f5cc3-d2ed-4fa1-b8a8-d49f2b0ff59b', 'Mello Óticas - Perus', NULL, 'VISIONTECH ÓPTICA LTDA', '12.345.678/0006-95',
 '{"logradouro": "Rua Antônio Maia", "numero": "803", "bairro": "Perus", "cidade": "São Paulo", "uf": "SP", "cep": "05203-001"}',
 '(11) 95341-2999', NULL, 'Dr. João Silva Santos', true, 0, '2025-04-14 13:17:07.376736', '2025-07-03 17:47:11.263955')
ON CONFLICT (id) DO UPDATE SET
  nome = EXCLUDED.nome,
  codigo = EXCLUDED.codigo,
  razao_social = EXCLUDED.razao_social,
  cnpj = EXCLUDED.cnpj,
  endereco = EXCLUDED.endereco,
  telefone = EXCLUDED.telefone,
  email = EXCLUDED.email,
  responsavel = EXCLUDED.responsavel,
  ativa = EXCLUDED.ativa,
  meta_mensal = EXCLUDED.meta_mensal,
  updated_at = EXCLUDED.updated_at;

INSERT INTO public.lojas (id, nome, codigo, razao_social, cnpj, endereco, telefone, email, responsavel, ativa, meta_mensal, created_at, updated_at)
VALUES
('f2a684b9-91b3-4650-b2c0-d64124d3a571', 'Mello Óticas - São Mateus', '012', 'VISIONTECH ÓPTICA LTDA', '12.345.678/0005-14',
 '{"logradouro": "Rua Tita Ruffo", "numero": "1046", "bairro": "São Mateus", "cidade": "São Paulo", "uf": "SP", "cep": "03949-000"}',
 '(11) 95398-9706', NULL, 'Dr. João Silva Santos', true, 0, '2025-04-14 13:17:07.376736', '2025-07-03 17:47:11.263955')
ON CONFLICT (id) DO UPDATE SET
  nome = EXCLUDED.nome,
  codigo = EXCLUDED.codigo,
  razao_social = EXCLUDED.razao_social,
  cnpj = EXCLUDED.cnpj,
  endereco = EXCLUDED.endereco,
  telefone = EXCLUDED.telefone,
  email = EXCLUDED.email,
  responsavel = EXCLUDED.responsavel,
  ativa = EXCLUDED.ativa,
  meta_mensal = EXCLUDED.meta_mensal,
  updated_at = EXCLUDED.updated_at;

INSERT INTO public.lojas (id, nome, codigo, razao_social, cnpj, endereco, telefone, email, responsavel, ativa, meta_mensal, created_at, updated_at)
VALUES
('f333a360-ee11-4a16-b98c-1d41961ca0bd', 'Mello Óticas - Suzano II', '010', 'VISIONTECH ÓPTICA LTDA', '12.345.678/0003-52',
 '{"logradouro": "Travessa Guaió", "numero": "367", "bairro": "Centro", "cidade": "Suzano", "uf": "SP", "cep": "08673-000"}',
 '(11) 98459-9535', NULL, 'Dr. João Silva Santos', true, 0, '2025-04-14 13:17:07.376736', '2025-07-03 17:47:11.263955')
ON CONFLICT (id) DO UPDATE SET
  nome = EXCLUDED.nome,
  codigo = EXCLUDED.codigo,
  razao_social = EXCLUDED.razao_social,
  cnpj = EXCLUDED.cnpj,
  endereco = EXCLUDED.endereco,
  telefone = EXCLUDED.telefone,
  email = EXCLUDED.email,
  responsavel = EXCLUDED.responsavel,
  ativa = EXCLUDED.ativa,
  meta_mensal = EXCLUDED.meta_mensal,
  updated_at = EXCLUDED.updated_at;

INSERT INTO public.lojas (id, nome, codigo, razao_social, cnpj, endereco, telefone, email, responsavel, ativa, meta_mensal, created_at, updated_at)
VALUES
('f8302fdd-615d-44c6-9dd2-233332937fe1', 'Lancaster - Mauá', '048', 'VISIONTECH ÓPTICA LTDA', '12.345.678/0004-33',
 '{"logradouro": "Centro", "numero": "S/N", "bairro": "Centro", "cidade": "Mauá", "uf": "SP", "cep": "09310-000"}',
 '(11) 98122-4601', NULL, 'Dr. João Silva Santos', true, 0, '2025-04-14 13:17:07.376736', '2025-07-03 17:47:11.263955')
ON CONFLICT (id) DO UPDATE SET
  nome = EXCLUDED.nome,
  codigo = EXCLUDED.codigo,
  razao_social = EXCLUDED.razao_social,
  cnpj = EXCLUDED.cnpj,
  endereco = EXCLUDED.endereco,
  telefone = EXCLUDED.telefone,
  email = EXCLUDED.email,
  responsavel = EXCLUDED.responsavel,
  ativa = EXCLUDED.ativa,
  meta_mensal = EXCLUDED.meta_mensal,
  updated_at = EXCLUDED.updated_at;
