-- Databricks notebook source
-- DBTITLE 1,Selecionando as colunas da tabela, com um limite de 10 linhas
select posicao, titulo, ano, direcao, genero from filmes
limit 10

-- COMMAND ----------

-- DBTITLE 1,Verificando quantas linhas tem na tabela
select count(*) as contador from filmes

-- COMMAND ----------

-- DBTITLE 1,Agrupando os filmes totais por gênero
select genero, count(*) as contador  from filmes 
group by genero order by count(*) desc

-- COMMAND ----------

-- DBTITLE 1,Agrupando os filmes por gênero, porem apenas àqueles com ano maior ou igual a 1980
select genero, count(*) as contador from filmes where ano >=1980
group by genero order by contador desc 


-- COMMAND ----------

-- DBTITLE 1,Selecionando titulo e ano dos filmes que tenham comédia no gênero
select titulo, ano, genero from filmes where genero like '%Comédia%'

-- COMMAND ----------

-- DBTITLE 1,Seelcionando o maior ano, menos e ano médio
select max(ano) as maior, min (ano) as menor,
avg(ano) as ano_medio from filmes

-- COMMAND ----------

-- DBTITLE 1,Selecionando a posição e titulo dos filmes entre 2000 e 2015
select posicao, titulo from filmes where ano between 2000 and 2015

-- COMMAND ----------

-- DBTITLE 1,Selecionando o titulo e ano dos filmes que tenham drama no gênero e ano maior que 2000
select titulo, ano from filmes where ano > 2000
and genero like 'Drama' order by ano desc

-- COMMAND ----------


