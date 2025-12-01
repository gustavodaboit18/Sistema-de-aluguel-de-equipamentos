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
