const { getManutencoes, createManutencao } = require("../services/manutencaoService");

async function listar(req, res) {
  try {
    const manutencoes = await getManutencoes();
    res.json(manutencoes);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Erro ao listar manutenções" });
  }
}

async function criar(req, res) {
  try {
    await createManutencao(req.body);
    res.status(201).json({ message: "Manutenção criada com sucesso!" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Erro ao criar manutenção" });
  }
}

module.exports = { listar, criar };
