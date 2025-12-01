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
