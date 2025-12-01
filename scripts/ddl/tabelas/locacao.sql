DROP TABLE IF EXISTS locacao;
GO

CREATE TABLE locacao (
    id_locacao INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_solicitacao DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);
GO
