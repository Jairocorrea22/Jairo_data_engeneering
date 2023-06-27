# Desafio3_HowBootcamps
## Ultimo desafio do bootcamp de Engenharia de Dados - 06/2023

</p>

## 📝 Sumário

- [Sobre](#sobre)
- [Resumo](#Resumo)
- [Autor](#autor)
- [Aprendizados](#Aprendizados)

## 🧐 Sobre <a name = "sobre"></a>

Esse projeto faz parte do terceiro e ultimo desafio do bootcamp de engenharia de dados da How Bootcamps.
O desafio consiste em utilizar a arquitetura AWS para criar um projeto de engenharia de dados.

## 🏁 Resumo <a name = "Resumo"></a>

Nesse projeto de engenharia utilizamos o AWS Glue para catalogar e o Amazon Athena para tratar os dados armazenados no bucket S3. Em seguida, os dados tratados são conectados ao Power BI através do Simba Athena para análise e visualização. Esse fluxo de trabalho permite que os dados sejam explorados de forma eficiente, transformados conforme necessário e apresentados de maneira significativa no Power BI.


![Projeto How](https://github.com/Jairocorrea22/Jairo_data_engeneering/assets/111188620/26d09edc-a6c8-46ea-b0ca-363fa9feccde)

## Passos

 -  Armazenamento de dados: Os dados iniciais são armazenados em um bucket S3 (Amazon Simple Storage Service).
   O bucket S3 é um serviço de armazenamento na nuvem altamente escalável e durável fornecido pela Amazon Web Services (AWS).

 - Catalogação de dados: O AWS Glue é utilizado para catalogar os dados armazenados no bucket S3. O Glue é um serviço totalmente gerenciado que permite descobrir, catalogar e transformar automaticamente os dados. Nesse projeto, utilizamos um crawler do Glue para explorar o bucket S3, identificar os dados disponíveis e criar um catálogo de metadados para esses dados.
   
 - Conexão do Glue com o Amazon Athena: O Amazon Athena é um serviço de consulta interativo e sem servidor que permite analisar dados diretamente no catálogo do Glue usando SQL. Uma conexão direta foi estabelecida entre o Glue e o Athena, permitindo que o Athena acesse os dados catalogados pelo Glue sem a necessidade de carregá-los em outro local de armazenamento.

 - Tratamento de dados no Athena: Com a conexão estabelecida, é possível utilizar o Athena para executar consultas SQL nos dados armazenados no bucket S3. O Athena permite filtrar, transformar e agregar os dados conforme necessário para atender aos requisitos do projeto.
   
 - Conexão do Athena com o Power BI: Para visualizar e explorar os dados tratados no Athena, é necessário conectar o Athena ao Power BI, que é uma plataforma de análise e visualização de dados. A conexão é estabelecida através de uma conexão ODBC (Open Database Connectivity) com o Simba Athena. O Simba Athena é um driver ODBC específico para o Amazon Athena, que permite que aplicativos como o Power BI se comuniquem com o Athena e recuperem os resultados das consultas.
   
 - Análise e visualização dos dados no Power BI: Após a conexão estabelecida, os dados tratados no Athena podem ser utilizados no Power BI para criar dashboards interativos, relatórios e visualizações personalizadas. O Power BI oferece recursos avançados de análise e visualização de dados, permitindo explorar e compartilhar insights a partir dos dados tratados.

   


## Prints do projeto

- Conexão Glue -> Athena
  
  ![Captura de tela 2023-06-27 133046](https://github.com/Jairocorrea22/Jairo_data_engeneering/assets/111188620/98961bd1-15aa-4eda-86d0-eb260790c4c3)

- Conexão ODBC
  
![Captura de tela 2023-06-27 133330](https://github.com/Jairocorrea22/Jairo_data_engeneering/assets/111188620/427ad91c-2a7a-4d2f-a5f5-d94ffbdcc713)

- Conexão Powerbi
  
  ![Captura de tela 2023-06-27 124503](https://github.com/Jairocorrea22/Jairo_data_engeneering/assets/111188620/9b2d0cd0-6409-438e-b2f5-48e2641bdbe0)

 - Relatorio
   
![Captura de tela 2023-06-27 124146](https://github.com/Jairocorrea22/Jairo_data_engeneering/assets/111188620/a54ed12d-3033-435e-b468-0009bb568e78)

   




## ✍️ Autor <a name = "autor"></a>

- [@Jairocorrêa](https://www.linkedin.com/in/jairo-corr%C3%AAa-a48456120/)





