const service = require("../services/equipamentoService");

async function listar(req, res) {
  try {
    const dados = await service.getEquipamentos();
    res.json(dados);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
}

async function criar(req, res) {
  try {
    await service.createEquipamento(req.body);
    res.status(201).json({ message: "Equipamento criado." });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
}

module.exports = { listar, criar };
