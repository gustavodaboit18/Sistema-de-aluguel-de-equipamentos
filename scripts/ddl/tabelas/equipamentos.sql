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

