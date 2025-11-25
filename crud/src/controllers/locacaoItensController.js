const { getLocacaoItens, createLocacaoItem } = require("../services/locacaoItensService");

async function listar(req, res) {
  try {
    const itens = await getLocacaoItens();
    res.json(itens);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Erro ao listar itens de locação" });
  }
}

async function criar(req, res) {
  try {
    await createLocacaoItem(req.body);
    res.status(201).json({ message: "Item de locação criado com sucesso!" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Erro ao criar item de locação" });
  }
}

module.exports = { listar, criar };
