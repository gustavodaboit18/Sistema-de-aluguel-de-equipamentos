const sql = require("mssql");
require("dotenv").config();

const config = {
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  server: process.env.DB_SERVER,               
  port: parseInt(process.env.DB_PORT),         
  database: process.env.DB_DATABASE,
  options: {
    trustServerCertificate: true
  }
};

const pool = new sql.ConnectionPool(config);
const poolConnect = pool.connect();

module.exports = { sql, pool, poolConnect };
