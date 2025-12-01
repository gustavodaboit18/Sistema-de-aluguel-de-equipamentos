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
