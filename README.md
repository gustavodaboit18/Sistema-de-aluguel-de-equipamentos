# Sistema De Aluguel De Equipamentos
Sistema para aluguel de equipamentos de construção Cívil desenvolvido em Backend e SQL utilizando as tecnologias SQL Server e Node JS.

Desenvolvedores:
- Bruno de Moraes Supriano
- Gustavo Correa da Boit
- Isabela Zanette Martinello
- Igor Porto de Matos
- Luiz Eduardo Madeira Pires

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
