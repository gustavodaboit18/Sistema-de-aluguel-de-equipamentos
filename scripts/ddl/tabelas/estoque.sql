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
