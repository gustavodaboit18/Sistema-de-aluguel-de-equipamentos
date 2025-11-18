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
CREATE TABLE equipamento (
    id_equipamento INT NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    marca VARCHAR(30) NOT NULL,
    numero_de_serie VARCHAR(20) NOT NULL,
    data_compra DATE NOT NULL
);
GO

----------------------------------------------------------
-- CLIENTE
----------------------------------------------------------
CREATE TABLE cliente (
    id_cliente INT NOT NULL PRIMARY KEY,
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
-- LOCACAO
----------------------------------------------------------
CREATE TABLE locacao (
    id_locacao INT NOT NULL PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_solicitacao DATE NOT NULL
);
GO

CREATE INDEX locacao_id_cliente_index ON locacao(id_cliente);
GO

----------------------------------------------------------
-- LOCACAO ITENS
----------------------------------------------------------
CREATE TABLE locacao_itens (
    id_item INT NOT NULL PRIMARY KEY,
    id_locacao INT NOT NULL,
    id_equipamento INT NOT NULL,
    data_solicitacao DATE NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL
);
GO

CREATE INDEX locacao_itens_id_locacao_index ON locacao_itens(id_locacao);
CREATE INDEX locacao_itens_id_equipamento_index ON locacao_itens(id_equipamento);
GO

----------------------------------------------------------
-- MANUTENCAO
----------------------------------------------------------
CREATE TABLE manutencao (
    id_manutencao INT NOT NULL PRIMARY KEY,
    id_equipamento INT NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    custo DECIMAL(10, 2) NOT NULL
);
GO

CREATE INDEX manutencao_id_equipamento_index ON manutencao(id_equipamento);
GO

----------------------------------------------------------
-- TRANSACAO
----------------------------------------------------------
CREATE TABLE transacao (
    id_transacao INT NOT NULL PRIMARY KEY,
    id_locacao INT NOT NULL,
    id_manutencao INT NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    data_retorno DATE NOT NULL
);
GO

CREATE INDEX transacao_id_locacao_index ON transacao(id_locacao);
CREATE INDEX transacao_id_manutencao_index ON transacao(id_manutencao);
GO

----------------------------------------------------------
-- ESTOQUE
----------------------------------------------------------
CREATE TABLE estoque (
    id_estoque INT NOT NULL PRIMARY KEY,
    id_equipamento INT NOT NULL,
    tipo BIGINT NOT NULL,
    qtde_disponivel BIGINT NOT NULL
);
GO

CREATE INDEX estoque_id_equipamento_index ON estoque(id_equipamento);
GO

----------------------------------------------------------
-- LOG_ENTRADASAIDA
----------------------------------------------------------
CREATE TABLE log_entradasaida (
    id_log INT NOT NULL PRIMARY KEY,
    id_equipamento INT NOT NULL,
    tipo CHAR(1) NOT NULL,
    data DATETIME NOT NULL,
    quantidade INT NOT NULL
);
GO

CREATE INDEX log_entradasaida_id_equipamento_index ON log_entradasaida(id_equipamento);
GO

----------------------------------------------------------
-- FOREIGN KEYS
----------------------------------------------------------
ALTER TABLE locacao
    ADD FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE log_entradasaida
    ADD FOREIGN KEY (id_equipamento) REFERENCES equipamento(id_equipamento);

ALTER TABLE locacao_itens
    ADD FOREIGN KEY (id_equipamento) REFERENCES equipamento(id_equipamento);

ALTER TABLE manutencao
    ADD FOREIGN KEY (id_equipamento) REFERENCES equipamento(id_equipamento);

ALTER TABLE transacao
    ADD FOREIGN KEY (id_manutencao) REFERENCES manutencao(id_manutencao);

ALTER TABLE locacao_itens
    ADD FOREIGN KEY (id_locacao) REFERENCES locacao(id_locacao);

ALTER TABLE transacao
    ADD FOREIGN KEY (id_locacao) REFERENCES locacao(id_locacao);

ALTER TABLE estoque
    ADD FOREIGN KEY (id_equipamento) REFERENCES equipamento(id_equipamento);
GO

----------------------------------------------------------
-- INSERTS
----------------------------------------------------------

-- EQUIPAMENTO
INSERT INTO equipamento (id_equipamento, nome, preco, marca, numero_de_serie, data_compra)
VALUES
(1, 'Gerador 5kVA', 3500.00, 'Honda', 'SN001', '2023-01-10'),
(2, 'Martelete 10kg', 1200.00, 'Bosch', 'SN002', '2023-02-15'),
(3, 'Compactador Solo', 8000.00, 'Makita', 'SN003', '2023-03-20');

-- CLIENTE
INSERT INTO cliente (id_cliente, nome, cpf, email, telefone, cnpj, tipo, nome_responsavel)
VALUES
(1, 'Construtora Alpha', '12345678901', 'contato@alpha.com', '48999990000', '11222333000199', 'PJ', 'Carlos Silva'),
(2, 'João Pereira', '98765432100', 'joao@gmail.com', '48988887777', '00000000000000', 'PF', 'João Pereira');

-- LOCACAO
INSERT INTO locacao (id_locacao, id_cliente, data_solicitacao)
VALUES
(1, 1, '2024-01-05'),
(2, 2, '2024-01-10');

-- LOCACAO_ITENS
INSERT INTO locacao_itens (id_item, id_locacao, id_equipamento, data_solicitacao, data_inicio, data_fim)
VALUES
(1, 1, 1, '2024-01-05', '2024-01-06', '2024-01-15'),
(2, 1, 2, '2024-01-05', '2024-01-06', '2024-01-12'),
(3, 2, 3, '2024-01-10', '2024-01-11', '2024-01-20');

-- MANUTENCAO
INSERT INTO manutencao (id_manutencao, id_equipamento, tipo, descricao, data_entrada, data_saida, custo)
VALUES
(1, 2, 'Corretiva', 'Substituição de peça interna', '2024-01-20', '2024-01-25', 350.00),
(2, 1, 'Preventiva', 'Revisão geral', '2024-02-01', '2024-02-03', 150.00);

-- TRANSACAO
INSERT INTO transacao (id_transacao, id_locacao, id_manutencao, tipo, data_retorno)
VALUES
(1, 1, 1, 'RETORNO', '2024-01-25'),
(2, 2, 2, 'RETORNO', '2024-02-03');

-- ESTOQUE
INSERT INTO estoque (id_estoque, id_equipamento, tipo, qtde_disponivel)
VALUES
(1, 1, 1, 3),
(2, 2, 1, 5),
(3, 3, 1, 2);

-- LOG_ENTRADASAIDA
INSERT INTO log_entradasaida (id_log, id_equipamento, tipo, data, quantidade)
VALUES
(1, 1, 'E', '2024-01-01 08:00:00', 3),
(2, 2, 'S', '2024-01-06 09:00:00', 1),
(3, 3, 'S', '2024-01-11 14:30:00', 1);
GO
