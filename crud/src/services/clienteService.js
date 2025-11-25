const { sql, pool, poolConnect } = require("../config/db");

async function getClientes() {
  await poolConnect;
  const result = await pool.request().query("SELECT * FROM cliente");
  return result.recordset;
}

async function createCliente(data) {
  await poolConnect;

  const query = `
    INSERT INTO cliente (nome, cpf, email, telefone, cnpj, tipo, nome_responsavel)
    VALUES (@nome, @cpf, @email, @telefone, @cnpj, @tipo, @responsavel)
  `;

  const request = pool.request();
  request.input("nome", sql.VarChar, data.nome);
  request.input("cpf", sql.Char(11), data.cpf);
  request.input("email", sql.VarChar, data.email);
  request.input("telefone", sql.VarChar, data.telefone);
  request.input("cnpj", sql.Char(14), data.cnpj);
  request.input("tipo", sql.VarChar, data.tipo);
  request.input("responsavel", sql.VarChar, data.nome_responsavel);

  await request.query(query);
}

module.exports = { getClientes, createCliente };
