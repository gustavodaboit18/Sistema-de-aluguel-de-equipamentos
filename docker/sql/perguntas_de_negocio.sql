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




