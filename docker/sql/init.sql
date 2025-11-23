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
('Gerador 5kVA', 3500.00, 'Honda', 'SN001', '2023-01-10'),
('Martelete 10kg', 1200.00, 'Bosch', 'SN002', '2023-02-15'),
('Compactador Solo', 8000.00, 'Makita', 'SN003', '2023-03-20');
GO

-- CLIENTE
INSERT INTO cliente (nome, cpf, email, telefone, cnpj, tipo, nome_responsavel)
VALUES
('Construtora Alpha', '12345678901', 'contato@alpha.com', '48999990000', '11222333000199', 'PJ', 'Carlos Silva'),
('João Pereira', '98765432100', 'joao@gmail.com', '48988887777', '00000000000000', 'PF', 'João Pereira');
GO
