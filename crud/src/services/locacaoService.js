const { sql, pool, poolConnect } = require("../config/db");

async function getLocacoes() {
  await poolConnect;
  const result = await pool.request().query("SELECT * FROM locacao");
  return result.recordset;
}

async function createLocacao(data) {
  await poolConnect;

  const query = `
    INSERT INTO locacao (id_cliente, data_solicitacao)
    VALUES (@id_cliente, @data_solicitacao)
  `;

  const request = pool.request();
  request.input("id_cliente", sql.Int, data.id_cliente);
  request.input("data_solicitacao", sql.Date, data.data_solicitacao);

  await request.query(query);
}

module.exports = { getLocacoes, createLocacao };
