const { getClientes, createCliente } = require("../services/clienteService");

async function listar(req, res) {
  try {
    const clientes = await getClientes();
    res.json(clientes);
  } catch (err) {
    console.error("Erro ao listar clientes:", err);
    res.status(500).json({ error: "Erro ao listar clientes" });
  }
}

async function criar(req, res) {
  try {
    await createCliente(req.body);
    res.status(201).json({ return: "Cliente criado com sucesso!" });
  } catch (err) {
    console.error("Erro ao criar cliente:", err);
    res.status(500).json({ error: "Erro ao criar cliente" });
  }
}

module.exports = { listar, criar };
