const { sql, pool, poolConnect } = require("../config/db");

async function getManutencoes() {
  await poolConnect;
  const result = await pool.request().query("SELECT * FROM manutencao");
  return result.recordset;
}

async function createManutencao(data) {
  await poolConnect;

  const query = `
    INSERT INTO manutencao (id_equipamento, tipo, descricao, data_entrada, data_saida, custo)
    VALUES (@id_equipamento, @tipo, @descricao, @data_entrada, @data_saida, @custo)
  `;

  const request = pool.request();
  request.input("id_equipamento", sql.Int, data.id_equipamento);
  request.input("tipo", sql.VarChar, data.tipo);
  request.input("descricao", sql.VarChar, data.descricao);
  request.input("data_entrada", sql.Date, data.data_entrada);
  request.input("data_saida", sql.Date, data.data_saida);
  request.input("custo", sql.Decimal(10,2), data.custo);

  await request.query(query);
}

module.exports = { getManutencoes, createManutencao };
