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
