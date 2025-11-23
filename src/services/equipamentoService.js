const { sql, pool, poolConnect } = require("../config/db");

async function getEquipamentos() {
  await poolConnect;
  const result = await pool.request().query("SELECT * FROM equipamento");
  return result.recordset;
}

async function createEquipamento(data) {
  await poolConnect;

  const query = `
    INSERT INTO equipamento (id_equipamento, nome, preco, marca, numero_de_serie, data_compra)
    VALUES (@nome, @preco, @marca, @serie, @data)
  `;

  const request = pool.request();
  
  request.input("nome", sql.VarChar, data.nome);
  request.input("preco", sql.Decimal(10,2), data.preco);
  request.input("marca", sql.VarChar, data.marca);
  request.input("serie", sql.VarChar, data.numero_de_serie);
  request.input("data", sql.Date, data.data_compra);

  await request.query(query);
}

module.exports = { getEquipamentos, createEquipamento };
