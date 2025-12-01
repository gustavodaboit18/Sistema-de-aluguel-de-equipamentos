# Sistema De Aluguel De Equipamentos
Sistema para aluguel de equipamentos de construção Cívil desenvolvido em Backend e SQL utilizando as tecnologias SQL Server e Node JS.

Desenvolvedores:
- Bruno de Moraes Supriano
- Gustavo Correa da Boit
- Isabela Zanette Martinello
- Igor Porto de Matos
- Luiz Eduardo Madeira Pires

Utilizamos a ferramenta de modelagem de dados [drawSQL](https://drawsql.app) para criação do modelo físico do banco de dados, para posterior exportação dos scripts DDL das tabelas e relacionamentos.<br>
Arquivo fonte: [Modelo Fisico](https://drawsql.app/teams/bruno-time/diagrams/aluguel-de-equipamentos).<br>

![image](https://github.com/gustavodaboit18/Sistema-de-aluguel-de-equipamentos/blob/main/modelo_fisico/Modelo_ER.png?raw=true)

### Dicionário de Dados
As informações sobre as tabelas e índices foram documentados na planilha [AluguelEquipamento-Dicionario.xlsx](dicionario_dados/AluguelEquipamento-Dicionario.xlsx).

### Referências Bibliográticas
Colocar aqui as referencias de artigos, sites, outros repositórios e livros que usou para o projeto.

Abaixo, segue os scripts SQL separados por tipo:
+ [Tabelas](scripts/ddl/tabelas)
+ [Índices](scripts/ddl/indices)
+ [Gatilhos](scripts/ddl/gatilhos)
+ [Procedimentos armazenados](scripts/ddl/procedimentos-armazenados)
+ [Funções](scripts/ddl/funcoes)
+ [DML](scripts/dml)


# Ambiente SQL Server em Docker

Este projeto utiliza um container Docker do SQL Server já configurado para:

- Subir automaticamente a instância do SQL Server.
- Executar todos os scripts `.sql` localizados na pasta `/docker/sql/` durante a inicialização.
- Garantir que o SQL esteja completamente online antes de rodar qualquer script.

--

# Como rodar o SQL Server no Docker

## 1. Subir o container
Use exatamente estes comandos no diretório onde está o `docker-compose.yml`:

```sh
docker compose down -v
docker compose build --no-cache
docker compose up
```


# 🚀 Execução do Backend

Para iniciar o servidor Node.js do projeto, siga os passos abaixo:

## 📂 1. Acessar o diretório do backend

```sh
cd Sistema-de-aluguel-de-equipamentos/src
npm install
Use npm init -y apenas caso não exista um arquivo package.json.
```

## 📂 2. Instalar dependências
```sh
# Dependências utilizadas:
npm install express
npm install nodemon
```

## 📂 3. Executar
```sh
# Execução:
npm run dev
```
# 🚀 Execução do Frontend
```sh
Acessar no navegador o arquivo index.html
```

