const { getLocacoes, createLocacao } = require("../services/locacaoService");

async function listar(req, res) {
  try {
    const locacoes = await getLocacoes();
    res.json(locacoes);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Erro ao listar locações" });
  }
}

async function criar(req, res) {
  try {
    await createLocacao(req.body);
    res.status(201).json({ message: "Locação criada com sucesso!" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Erro ao criar locação" });
  }
}

module.exports = { listar, criar };
