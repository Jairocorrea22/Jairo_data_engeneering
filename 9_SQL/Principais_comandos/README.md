# Comandos SQL Mais Utilizados

## Comandos Basicos


``SELECT`` usado para selecionar dados de uma tabela.

``INSERT`` usado para inserir novos dados em uma tabela.

``UPDATE`` usado para atualizar dados existentes em uma tabela

``DELETE`` usado para excluir dados existentes de uma tabela.

``CREATE`` usado para criar uma nova tabela ou um novo banco de dados.

``DROP`` usado para excluir uma tabela ou um banco de dados existente.

``ALTER`` usado para modificar uma tabela existente.




## Comandos Intermediarios


``JOIN`` usado para combinar dados de duas ou mais tabelas relacionadas.

``GROUP BY`` usado para agrupar dados com base em uma ou mais colunas.

``HAVING`` usado para filtrar dados agrupados com base em uma condição.

``ORDER BY`` usado para classificar os resultados com base em uma ou mais colunas.

``DISTINCT`` usado para retornar apenas valores únicos em uma coluna.


## Comandos Avançados

``UNION`` usado para combinar o resultado de duas ou mais consultas SELECT.

``CASE`` usado para executar condições e retornar valores diferentes com base em uma ou mais condições.

``INDEX`` usado para criar índices em uma ou mais colunas de uma tabela para melhorar o desempenho da consulta.

``TRANSACTION`` usado para agrupar uma ou mais operações em uma transação e garantir a integridade dos dados.

``VIEW`` usado para criar uma visão de uma ou mais tabelas existentes, permitindo que os usuários consultem e atualizem esses dados como se fossem uma tabela real.


## Wndown Functions


 - Usadas para realizar cálculos em um conjunto de linhas (janela) que estão relacionadas a uma linha atual em uma tabela. 
 Algumas das funções de janela mais comuns do SQL são:



``ROW_NUMBER()`` atribui um número a cada linha dentro de uma janela.


``RANK()`` atribui uma classificação às linhas dentro de uma janela, com valores iguais recebendo a mesma classificação.

``DENSE_RANK()`` atribui uma classificação às linhas dentro de uma janela, com valores iguais recebendo a mesma classificação e valores empatados não deixando lacunas nas classificações.

``LEAD()`` retorna o valor da próxima linha dentro de uma janela.

``LAG()`` retorna o valor da linha anterior dentro de uma janela.

``SUM(), AVG(), COUNT(), MAX() e MIN()`` estas funções são usadas para realizar cálculos agregados (soma, média, contagem, máximo e mínimo) em um conjunto de linhas dentro de uma janela.

``FIRST_VALUE() e LAST_VALUE()`` estas funções retornam o primeiro e o último valor dentro de uma janela.


