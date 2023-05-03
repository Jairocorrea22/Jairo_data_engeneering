-- Verificando os dados das tabelas
select top 5 * from clientes
select top 5 * from produtos
select  top 5 * from vendas


-- Custo total

SELECT v.dt_venda
	,p.nome_prod
	,(
		SELECT v.qtd * v.pr_custo
		) AS Custo_total
FROM vendas AS v
INNER JOIN produtos AS p ON v.cod_prod = p.cod_prod




-- Vendas por clientes

SELECT v.dt_venda
	,c.nome_cliente 
FROM clientes AS c
INNER JOIN vendas AS v ON c.cod_cliente = v.cod_cliente



-- Quantidade de v endas por clientes

SELECT c.nome_cliente
	,COUNT(v.dt_venda) AS Vendas
FROM clientes AS c
INNER JOIN vendas AS v ON c.cod_cliente = v.cod_cliente
GROUP BY nome_cliente
ORDER BY Vendas DESC



 -- Lucro por clientes

SELECT c.nome_cliente
	,sum((v.pr_unit - v.pr_custo) * v.qtd) AS lucro
FROM clientes AS c
INNER JOIN vendas AS v ON c.cod_cliente = v.cod_cliente
GROUP BY c.nome_cliente
ORDER BY lucro DESC



-- View Balanco

create view balanco as 
SELECT dt_venda as Data_de_venda
	,sum(qtd * pr_custo) AS Custo_total
	,sum(qtd * pr_unit) AS Vendas_totais
FROM vendas
GROUP BY dt_venda

Select * from balanco order by Data_de_venda

 



 -- View Lucro Liquido

 create view lucro as
SELECT dt_venda as Data_de_venda
	,sum(qtd * pr_custo) AS Custo_total
	,sum(qtd * pr_unit) AS Vendas_totais
	,sum((qtd * pr_unit) - (qtd * pr_custo)) AS Lucro_liquido
FROM vendas
GROUP BY dt_venda

select * from lucro order by Data_de_venda




