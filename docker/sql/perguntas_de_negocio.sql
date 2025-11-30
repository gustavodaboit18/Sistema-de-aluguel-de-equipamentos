--pergunta 1: 1-Em qual cliente está cada equipamento? JOIN


SELECT e.nome,e.marca,e.id_equipamento ,c.nome
FROM equipamento e 
inner join locacao_itens li on li.id_equipamento=e.id_equipamento
inner join locacao l on l.id_locacao=li.id_locacao
inner join cliente c on c.id_cliente=l.id_cliente

-- pergunta 2-Qual os 5 equipamentos que teve mais aluguéis? CTE

with cte as(
select e.nome,e.marca,li.id_equipamento,count(li.id_locacao) as qtde_locacoes
from locacao_itens li, equipamento e
where e.id_equipamento=li.id_equipamento
group by li.id_equipamento, e.nome,e.marca
), ranking as(
select *, ROW_NUMBER() OVER( ORDER BY qtde_locacoes desc) as rank
from cte
)
select * from ranking
where rank<=5
order by qtde_locacoes desc

-- pergunta 3- Quais os 5 equipamentos com mais tempo ocioso? WINDOW FINCTION(rank)

WITH ultima_locacao AS (
SELECT 
        e.id_equipamento,
        e.nome,
        e.data_compra,
        MAX(li.data_fim) AS ultima_locacao_data
    FROM equipamento e
    LEFT JOIN locacao_itens li 
        ON li.id_equipamento = e.id_equipamento
    GROUP BY 
        e.id_equipamento, e.nome, e.data_compra
),
tempos AS (
    SELECT
        id_equipamento,
        nome,
        DATEDIFF(DAY, COALESCE(ultima_locacao_data, data_compra), GETDATE()) AS dias_ocioso
    FROM ultima_locacao
),
ranking AS (
    SELECT
        id_equipamento,
        nome,
        dias_ocioso,
        RANK() OVER (ORDER BY dias_ocioso DESC) AS posicao
    FROM tempos
)
SELECT TOP 5
    id_equipamento,
    nome,
    dias_ocioso,
    posicao
FROM ranking
ORDER BY posicao;
    
-- pergunta 4- Quais os três equipamentos que geraram mais receita para a empresa em um determinado ano? FUNCTION

DROP FUNCTION IF EXISTS dbo.fn_EquipamentosReceita;
GO
CREATE FUNCTION dbo.fn_EquipamentosReceita (@Ano INT)
RETURNS TABLE
AS
RETURN (
    SELECT TOP 3 
        li.id_equipamento AS id_equip,
        SUM(e.preco) AS receita
    FROM locacao_itens li
    INNER JOIN equipamento e ON e.id_equipamento = li.id_equipamento
    WHERE 
        li.data_inicio >= DATEFROMPARTS(@Ano, 1, 1)
        AND li.data_inicio < DATEFROMPARTS(@Ano + 1, 1, 1)
    GROUP BY li.id_equipamento
    ORDER BY receita DESC
);
GO

select * from dbo.fn_EquipamentosReceita(2023);





