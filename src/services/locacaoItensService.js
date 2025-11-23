const { sql, pool, poolConnect } = require("../config/db");

async function getLocacaoItens() {
  await poolConnect;
  const result = await pool.request().query("SELECT * FROM locacao_itens");
  return result.recordset;
}

async function createLocacaoItem(data) {
  await poolConnect;

  const query = `
    INSERT INTO locacao_itens (id_locacao, id_equipamento, data_solicitacao, data_inicio, data_fim)
    VALUES (@id_locacao, @id_equipamento, @data_solicitacao, @data_inicio, @data_fim)
  `;

  const request = pool.request();
  request.input("id_locacao", sql.Int, data.id_locacao);
  request.input("id_equipamento", sql.Int, data.id_equipamento);
  request.input("data_solicitacao", sql.Date, data.data_solicitacao);
  request.input("data_inicio", sql.Date, data.data_inicio);
  request.input("data_fim", sql.Date, data.data_fim);

  await request.query(query);
}

module.exports = { getLocacaoItens, createLocacaoItem };
