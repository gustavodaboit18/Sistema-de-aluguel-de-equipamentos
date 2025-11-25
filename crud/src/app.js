const express = require("express");
const cors = require("cors");

const clienteRouter = require("./routes/clienteRoutes");
const equipamentoRoutes = require("./routes/equipamentoRoutes");
const locacaoRouter = require("./routes/locacaoRoutes");
const locacaoItensRouter = require("./routes/locacaoItensRoutes");
const manutencaoRouter = require("./routes/manutencaoRoutes");

const app = express();

app.use(cors());
app.use(express.json());

app.use("/clientes", clienteRouter);
app.use("/equipamentos", equipamentoRoutes);
app.use("/locacoes", locacaoRouter);
app.use("/locacao-itens", locacaoItensRouter);
app.use("/manutencoes", manutencaoRouter);



module.exports = app;
