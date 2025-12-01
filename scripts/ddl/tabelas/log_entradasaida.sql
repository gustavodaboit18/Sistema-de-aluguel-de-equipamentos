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
