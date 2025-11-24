----------------------------------------------------------
-- CRIA BASE
----------------------------------------------------------
IF DB_ID('EquipamentosDB') IS NULL
    CREATE DATABASE EquipamentosDB;
GO

USE EquipamentosDB;
GO

----------------------------------------------------------
-- TABELA EQUIPAMENTO
----------------------------------------------------------
DROP TABLE IF EXISTS equipamento;
GO

CREATE TABLE equipamento (
    id_equipamento INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    marca VARCHAR(30) NOT NULL,
    numero_de_serie VARCHAR(20) NOT NULL,
    data_compra DATE NOT NULL
);
GO

----------------------------------------------------------
-- TABELA CLIENTE
----------------------------------------------------------
DROP TABLE IF EXISTS cliente;
GO

CREATE TABLE cliente (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    cpf CHAR(11) NOT NULL,
    email VARCHAR(80) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    tipo VARCHAR(5) NOT NULL,
    nome_responsavel VARCHAR(80) NOT NULL
);
GO

----------------------------------------------------------
-- TABELA LOCACAO
----------------------------------------------------------
DROP TABLE IF EXISTS locacao;
GO

CREATE TABLE locacao (
    id_locacao INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_solicitacao DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);
GO

----------------------------------------------------------
-- TABELA LOCACAO_ITENS
----------------------------------------------------------
DROP TABLE IF EXISTS locacao_itens;
GO

CREATE TABLE locacao_itens (
    id_item INT IDENTITY(1,1) PRIMARY KEY,
    id_locacao INT NOT NULL,
    id_equipamento INT NOT NULL,
    data_solicitacao DATE NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    FOREIGN KEY (id_locacao) REFERENCES locacao(id_locacao),
    FOREIGN KEY (id_equipamento) REFERENCES equipamento(id_equipamento)
);
GO

----------------------------------------------------------
-- TABELA MANUTENCAO
----------------------------------------------------------
DROP TABLE IF EXISTS manutencao;
GO

CREATE TABLE manutencao (
    id_manutencao INT IDENTITY(1,1) PRIMARY KEY,
    id_equipamento INT NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    custo DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_equipamento) REFERENCES equipamento(id_equipamento)
);
GO

----------------------------------------------------------
-- TABELA TRANSACAO
----------------------------------------------------------
DROP TABLE IF EXISTS transacao;
GO

CREATE TABLE transacao (
    id_transacao INT IDENTITY(1,1) PRIMARY KEY,
    id_locacao INT NOT NULL,
    id_manutencao INT NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    data_retorno DATE NOT NULL,
    FOREIGN KEY (id_locacao) REFERENCES locacao(id_locacao),
    FOREIGN KEY (id_manutencao) REFERENCES manutencao(id_manutencao)
);
GO

----------------------------------------------------------
-- TABELA ESTOQUE
----------------------------------------------------------
DROP TABLE IF EXISTS estoque;
GO

CREATE TABLE estoque (
    id_estoque INT IDENTITY(1,1) PRIMARY KEY,
    id_equipamento INT NOT NULL,
    tipo BIGINT NOT NULL,
    qtde_disponivel BIGINT NOT NULL,
    FOREIGN KEY (id_equipamento) REFERENCES equipamento(id_equipamento)
);
GO

----------------------------------------------------------
-- TABELA LOG_ENTRADASAIDA
----------------------------------------------------------
DROP TABLE IF EXISTS log_entradasaida;
GO

CREATE TABLE log_entradasaida (
    id_log INT IDENTITY(1,1) PRIMARY KEY,
    id_equipamento INT NOT NULL,
    tipo CHAR(1) NOT NULL,
    data DATETIME NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_equipamento) REFERENCES equipamento(id_equipamento)
);
GO

----------------------------------------------------------
-- INSERTS INICIAIS
----------------------------------------------------------

-- EQUIPAMENTO
INSERT INTO equipamento (nome, preco, marca, numero_de_serie, data_compra)
VALUES
('Gerador 10kVA', 8500.00, 'Honda', 'G10A55HND', '2024-01-10'),
('Furadeira Industrial', 1200.00, 'Bosch', 'FRD887BSC', '2024-03-15'),
('Compressor de Ar', 4500.00, 'Schulz', 'CPR551SCL', '2023-11-20'),
('Betoneira 400L', 3200.00, 'Menegotti', 'BTN400MNG', '2022-05-03'),
('Gerador 20kVA', 14500.00, 'Yamaha', 'G20YMH221', '2023-12-01'),
('Furadeira Impacto', 900.00, 'Makita', 'FRDIMP998', '2024-05-03'),
('Compressor Industrial', 7200.00, 'Chicago', 'CMP999CHI', '2022-10-11'),
('Betoneira 600L', 5500.00, 'CSM', 'BTN600CSM', '2024-08-20'),
('Martelete 10kg', 2000.00, 'Bosch', 'MTL10BSC', '2024-04-18'),
('Martelete 16kg', 3200.00, 'Makita', 'MTL16MKT', '2023-09-13'),
('Cortadora de piso', 4800.00, 'Norton', 'CRT444NRT', '2024-07-11'),
('Andaime metálico', 300.00, 'FortLev', 'ADM111FTL', '2022-04-30'),
('Nível laser', 850.00, 'Bosch', 'NVL001BSC', '2024-10-01'),
('Gerador portátil', 5800.00, 'Honda', 'GPRT055H', '2024-02-19'),
('Compactador de solo', 7000.00, 'Mikasa', 'CPS777MKS', '2024-03-22'),
('Escora metálica', 150.00, 'FortLev', 'ESCR99FTL', '2023-05-17'),
('Serra mármore', 830.00, 'Makita', 'SRM22MKT', '2024-01-27'),
('Plaina elétrica', 1200.00, 'Bosch', 'PLE885BSC', '2023-12-15'),
('Lixadeira', 980.00, 'Bosch', 'LXD001BSC', '2024-06-30'),
('Cortadora de madeira', 1900.00, 'Makita', 'CTM001MKT', '2024-08-21');


-- CLIENTE
INSERT INTO cliente (nome, cpf, email, telefone, cnpj, tipo, nome_responsavel)
VALUES
('Construtora Alfa', '12345678901', 'contato@alfa.com', '48999990000', '11111111111111', 'PJ', 'João Pereira'),
('Carlos Silva', '98765432100', 'carlos@gmail.com', '48988887777', '00000000000000', 'PF', 'Carlos Silva'),
('Engenharia Beta', '11122233344', 'beta@eng.com', '48988880000', '22222222222222', 'PJ', 'Ana Costa'),
('Construtora Delta', '55443322111', 'delta@delta.com', '48977776666', '33333333333333', 'PJ', 'Roberto Lima'),
('Marcos Paulo', '33445566778', 'marcos@gmail.com', '48999887766', '00000000000000', 'PF', 'Marcos Paulo'),
('Construtora Gamma', '11223344556', 'gamma@gamma.com', '48999558877', '44444444444444', 'PJ', 'Eduardo Santos'),
('Lucas Andrade', '99887766554', 'lucas@gmail.com', '48997665544', '00000000000000', 'PF', 'Lucas Andrade'),
('Construtora Zeta', '22334455667', 'zeta@zeta.com', '48993445566', '55555555555555', 'PJ', 'Rafael Souza'),
('Julio Costa', '88776655443', 'julio@gmail.com', '48995544322', '00000000000000', 'PF', 'Julio Costa'),
('Construtora Omega', '77665544332', 'omega@omega.com', '48996642211', '66666666666666', 'PJ', 'Marcelo Torres'),
('Pedro Henrique', '55667788990', 'pedro@gmail.com', '48994443322', '00000000000000', 'PF', 'Pedro Henrique'),
('Construtora Supra', '55442211009', 'supra@supra.com', '48993336666', '77777777777777', 'PJ', 'Victor Hugo'),
('Ana Ferreira', '11225577990', 'ana@gmail.com', '48997775533', '00000000000000', 'PF', 'Ana Ferreira'),
('Construtora Prime', '99884433221', 'prime@prime.com', '48998884422', '88888888888888', 'PJ', 'Mateus Silva'),
('Leo Costa', '66554433221', 'leo@gmail.com', '48993335577', '00000000000000', 'PF', 'Leo Costa'),
('Construtora Orion', '33446688001', 'orion@orion.com', '48991122334', '99999999999999', 'PJ', 'Daniel Costa'),
('Claudio Souza', '11220033445', 'claudio@gmail.com', '48995566778', '00000000000000', 'PF', 'Claudio Souza'),
('Construtora Hiper', '66778899002', 'hiper@hiper.com', '48992233445', '10101010101010', 'PJ', 'Sérgio Duarte'),
('Renato Gomes', '99335566772', 'renato@gmail.com', '48993321122', '00000000000000', 'PF', 'Renato Gomes'),
('Construtora Mega', '11229988776', 'mega@mega.com', '48998877665', '12121212121212', 'PJ', 'Thiago Alves');

-- locacao
INSERT INTO locacao (id_cliente, data_solicitacao)
VALUES
(1, '2024-05-10'),
(2, '2024-06-01'),
(3, '2024-04-20'),
(4, '2024-02-11'),
(5, '2024-01-19'),
(6, '2024-03-08'),
(7, '2023-12-22'),
(8, '2024-07-10'),
(9, '2024-06-30'),
(10, '2024-09-01'),
(11, '2024-10-15'),
(12, '2024-11-04'),
(13, '2024-07-20'),
(14, '2024-07-21'),
(15, '2023-09-14'),
(16, '2024-05-18'),
(17, '2024-06-10'),
(18, '2023-11-27'),
(19, '2024-03-29'),
(20, '2024-08-14'),
(1, '2024-10-25'),
(5, '2024-08-05'),
(10, '2024-11-15'),
(15, '2024-01-08'),
(20, '2024-09-28');

-- locacao_itens
INSERT INTO locacao_itens (id_locacao, id_equipamento, data_solicitacao, data_inicio, data_fim)
VALUES
(1, 1, '2024-05-10', '2024-05-12', '2024-05-20'),
(1, 2, '2024-05-10', '2024-05-12', '2024-05-20'),
(2, 3, '2024-06-01', '2024-06-02', '2024-06-10'),
(3, 4, '2024-04-20', '2024-04-22', '2024-05-01'),
(4, 5, '2024-02-11', '2024-02-12', '2024-02-28'),
(5, 6, '2024-01-19', '2024-01-20', '2024-01-28'),
(6, 7, '2024-03-08', '2024-03-09', '2024-03-25'),
(7, 8, '2023-12-22', '2023-12-23', '2024-01-05'),
(8, 9, '2024-07-10', '2024-07-11', '2024-07-20'),
(9, 10, '2024-06-30', '2024-07-01', '2024-07-15'),
(10, 11, '2024-09-01', '2024-09-02', '2024-09-10'),
(11, 12, '2024-10-15', '2024-10-16', '2024-10-30'),
(12, 13, '2024-11-04', '2024-11-05', '2024-11-20'),
(13, 14, '2024-07-20', '2024-07-21', '2024-07-29'),
(14, 15, '2024-07-21', '2024-07-22', '2024-07-27'),
(15, 16, '2023-09-14', '2023-09-15', '2023-10-01'),
(16, 17, '2024-05-18', '2024-05-19', '2024-06-01'),
(17, 18, '2024-06-10', '2024-06-11', '2024-06-20'),
(18, 19, '2023-11-27', '2023-11-28', '2023-12-10'),
(19, 20, '2024-03-29', '2024-03-30', '2024-04-08'),
(20, 1, '2024-08-14', '2024-08-16', '2024-08-25'),
(21, 1, '2024-10-25', '2024-10-27', '2024-11-05'),
(22, 6, '2024-08-05', '2024-08-07', '2024-08-15'),
(23, 11, '2024-11-15', '2024-11-17', '2024-11-25'),
(24, 16, '2024-01-08', '2024-01-10', '2024-01-20');


-- MANUTENCAO (20 registros)
INSERT INTO manutencao (id_equipamento, tipo, descricao, data_entrada, data_saida, custo)
VALUES
(2, 'Preventiva', 'Troca de escovas e limpeza', '2024-02-01', '2024-02-03', 200.00),
(3, 'Reparo', 'Substituição de válvula', '2024-03-11', '2024-03-15', 450.00),
(1, 'Preventiva', 'Troca de óleo', '2024-04-05', '2024-04-06', 300.00),
(4, 'Reparo', 'Correção de vazamento', '2024-05-02', '2024-05-10', 500.00),
(5, 'Preventiva', 'Manutenção geral', '2024-06-01', '2024-06-02', 250.00),
(6, 'Reparo', 'Troca de rolamentos', '2024-06-11', '2024-06-18', 600.00),
(7, 'Reparo', 'Solda da estrutura', '2024-03-19', '2024-03-25', 300.00),
(8, 'Preventiva', 'Engraxamento', '2024-08-25', '2024-08-26', 120.00),
(9, 'Preventiva', 'Troca de broca', '2024-04-18', '2024-04-18', 90.00),
(10, 'Reparo', 'Troca de impacto', '2024-05-20', '2024-05-30', 550.00),
(11, 'Reparo', 'Correção do coletor', '2024-07-11', '2024-07-18', 400.00),
(12, 'Preventiva', 'Revisão da pintura', '2024-04-30', '2024-05-01', 80.00),
(13, 'Preventiva', 'Calibração', '2024-10-01', '2024-10-02', 140.00),
(14, 'Reparo', 'Troca de rotor', '2024-02-19', '2024-02-25', 350.00),
(15, 'Reparo', 'Correção de borracha', '2024-04-22', '2024-04-29', 260.00),
(16, 'Preventiva', 'Limpeza', '2024-05-18', '2024-05-18', 50.00),
(17, 'Preventiva', 'Troca de disco', '2024-01-27', '2024-01-27', 110.00),
(18, 'Reparo', 'Conserto elétrico', '2023-12-15', '2023-12-17', 370.00),
(19, 'Preventiva', 'Troca de lixa', '2024-06-30', '2024-06-30', 70.00),
(20, 'Reparo', 'Correção de motor', '2024-08-21', '2024-08-25', 490.00);


-- TRANSACAO (20 registros)
INSERT INTO transacao (id_locacao, id_manutencao, tipo, data_retorno)
VALUES
(1, 1, 'saida', '2024-05-12'),
(2, 2, 'entrada', '2024-06-10'),
(3, 3, 'saida', '2024-04-22'),
(4, 4, 'entrada', '2024-05-10'),
(5, 5, 'saida', '2024-01-20'),
(6, 6, 'entrada', '2024-06-18'),
(7, 7, 'saida', '2023-12-23'),
(8, 8, 'entrada', '2024-08-26'),
(9, 9, 'saida', '2024-07-01'),
(10, 10, 'entrada', '2024-05-30'),
(11, 11, 'saida', '2024-10-16'),
(12, 12, 'entrada', '2024-10-02'),
(13, 13, 'saida', '2024-07-21'),
(14, 14, 'entrada', '2024-02-25'),
(15, 15, 'saida', '2023-09-15'),
(16, 16, 'entrada', '2024-05-18'),
(17, 17, 'saida', '2024-06-11'),
(18, 18, 'entrada', '2023-12-17'),
(19, 19, 'saida', '2024-06-30'),
(20, 20, 'entrada', '2024-08-25');


-- ESTOQUE (20 registros)
INSERT INTO estoque (id_equipamento, tipo, qtde_disponivel)
VALUES
(1, 1, 3),
(2, 1, 5),
(3, 1, 2),
(4, 1, 1),
(5, 1, 4),
(6, 1, 3),
(7, 1, 2),
(8, 1, 2),
(9, 1, 5),
(10, 1, 4),
(11, 1, 3),
(12, 1, 50),
(13, 1, 10),
(14, 1, 2),
(15, 1, 1),
(16, 1, 150),
(17, 1, 4),
(18, 1, 5),
(19, 1, 3),
(20, 1, 1);


-- LOG_ENTRADASAIDA (20 registros)
INSERT INTO log_entradasaida (id_equipamento, tipo, data, quantidade)
VALUES
(1, 'E', '2024-05-01 08:20:00', 1),
(2, 'S', '2024-05-12 09:10:00', 1),
(3, 'E', '2024-06-03 14:33:00', 1),
(4, 'S', '2024-04-22 10:00:00', 1),
(5, 'E', '2024-02-12 11:10:00', 1),
(6, 'S', '2024-01-20 15:45:00', 1),
(7, 'E', '2024-03-09 09:55:00', 1),
(8, 'S', '2023-12-23 13:40:00', 1),
(9, 'E', '2024-04-19 16:20:00', 1),
(10, 'S', '2024-05-21 08:25:00', 1),
(11, 'S', '2024-07-12 14:30:00', 1),
(12, 'E', '2024-04-30 10:30:00', 5),
(13, 'E', '2024-10-02 11:35:00', 2),
(14, 'S', '2024-02-20 12:10:00', 1),
(15, 'E', '2024-04-23 12:22:00', 1),
(16, 'E', '2024-05-19 12:50:00', 15),
(17, 'E', '2024-01-28 09:33:00', 3),
(18, 'S', '2023-12-16 13:15:00', 1),
(19, 'E', '2024-06-30 10:10:00', 5),
(20, 'S', '2024-08-22 11:55:00', 1);
