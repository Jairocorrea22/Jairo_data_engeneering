-- Databricks notebook source
-- DBTITLE 1,Selecionando os dados da tabela
select * from filmes
limit 10

-- COMMAND ----------

-- DBTITLE 1,Selecionando a quantidade de filmes por distribuidora, agrupando e ordenando.
select  distribuidora, count(*) as qtd_obras from filmes
group by distribuidora
order by qtd_obras desc
limit 10


-- COMMAND ----------

-- DBTITLE 1,selecionando a quantidade de filmes por nacionalidade
select nacionalidade, count(*) as qtd_filmes from filmes
group by nacionalidade


-- COMMAND ----------

-- DBTITLE 1,Selecionando dados de filmes que tenham nacionalidade brasileira
select distribuidora, titulo, ano from filmes
where nacionalidade = 'Brasileira'
order by distribuidora

-- COMMAND ----------

-- DBTITLE 1,Verificando a quantidade de filmes por distribuidora
select distribuidora, count(*) as qtd_de_obras from filmes
group by distribuidora
order by qtd_de_obras desc

-- COMMAND ----------

-- DBTITLE 1,Qual foi o maior publico na exibição
select  max (publico_exibicao) from filmes 

-- COMMAND ----------

-- DBTITLE 1,Realizando uma subquery e verificando qual foi o filme com a maior exibição. Dessa forma, 
--caso surja algum outro filme com um publico maior, a consulta será atualizada

select colocacao, titulo, distribuidora, renda_exibicao, ano from filmes
where publico_exibicao >= (select max (publico_exibicao) from filmes)

-- COMMAND ----------

-- DBTITLE 1,Criando uma View com os 10 filmes com maior renda na exibição
create view top_filmes as
select colocacao, titulo, distribuidora, renda_exibicao, ano 
from filmes 
order by publico_exibicao desc
limit 10

-- COMMAND ----------

-- DBTITLE 1,Mostrando a view top_filmes criada
select * from top_filmes

-- COMMAND ----------

-- DBTITLE 1,Criando uma View com os 10 filmes brasileiros com maior renda na exibição
create view top_nacionais as
select colocacao, titulo, distribuidora, renda_exibicao, ano 
from filmes
where nacionalidade = 'Brasileira'
order by renda_exibicao desc
limit 10

-- COMMAND ----------

-- DBTITLE 1,Mostrando a view  top_nacionais criada
select * from top_nacionais

-- COMMAND ----------

-- DBTITLE 1,Criando uma view com os 10 filmes internacionas com maior renda na exibição
create view top_internacionais as
select colocacao, titulo, distribuidora, renda_exibicao, ano 
from filmes
where nacionalidade = 'Estrangeira'
order by renda_exibicao desc
limit 10

-- COMMAND ----------

-- DBTITLE 1,Mostrando a view top_internacionais criada
select * from top_internacionais

-- COMMAND ----------

-- DBTITLE 1,Fazendo a união das views top_nacionais e top_internacionais e ordenando por ano e renda de forma decrescente
select * from top_nacionais
union
select * from top_internacionais
order by ano desc, renda_exibicao desc
