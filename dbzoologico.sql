-- Crie uma database chamada ZOOLOGICO. 
 
 -- apagar o banco de dados
drop database dbZoologico;
-- criar o banco de dados
create database dbZoologico;
-- acessar o banco de dados
use dbZoologico;
-- criar as tabelas
create table tbAnimais(
codAni int,
tipo char(15),
nome char(30),
idade int,
valor decimal(9,2)
);


insert into tbAnimais(codAni,tipo,nome,idade,valor)values(1,'cachorro','Djudi',3,300.00);
insert into tbAnimais(codAni,tipo,nome,idade,valor)values(2,'cachorro','Sula',5,300.00);
insert into tbAnimais(codAni,tipo,nome,idade,valor)values(3,'cachorro','Sarina',7,300.00);
insert into tbAnimais(codAni,tipo,nome,idade,valor)values(4,'gato','Pipa',2,500.00);
insert into tbAnimais(codAni,tipo,nome,idade,valor)values(5,'gato','Sarengue',2,500.00);
insert into tbAnimais(codAni,tipo,nome,idade,valor)values(6,'gato','Clarences',1,500.00);
insert into tbAnimais(codAni,tipo,nome,idade,valor)values(7,'coruja','Agnes',0,700.00);
insert into tbAnimais(codAni,tipo,nome,idade,valor)values(8,'coruja','Arabela',1,700.00);
insert into tbAnimais(codAni,tipo,nome,idade,valor)values(9,'sapo','Quash',1,100.00);
insert into tbAnimais(codAni,tipo,nome,idade,valor)values(10,'peixe','Fish',0,100.00);

desc tbAnimais;

--3. Escreva um comando que exiba todas as colunas e todas as linhas da tabela ANIMAIS
select * from tbAnimais;

--4. Escreva um comando que exiba apenas as colunas TIPO e NOME da tabela ANIMAIS, apresentando todos os registros da tabela. 
select tipo,nome from tbAnimais;

--5. Escreva um comando que exiba apenas as colunas TIPO, NOME e IDADE da tabela ANIMAIS, apresentado todos os registros. 
select tipo,nome,idade from tbAnimais;

--6. Escreva um comando que exiba apenas as colunas TIPO e NOME da tabela ANIMAIS apresentando todos os registros. Apresente a legenda da coluna TIPO com o alias [Tipo de Animal] e a coluna nome com o alias [Nome do Animal]
select tipo as 'Tipo de Animal', nome as 'Nome do Animal' from tbAnimais;

--7. Escreva um comando que exiba apenas as colunas TIPO, NOME e IDADE da tabela ANIMAIS apresentando todos os registros. Apresente a legenda da coluna TIPO com o alias [Tipo de Animal], da coluna nome com o alias [Nome do Animal] e da coluna IDADE com o alias [Tempo de Vida].
select tipo as 'Tipo de Animal', nome as 'Nome do Animal', idade as 'Tempo de Vida' from tbAnimais;

--8. Escreva um comando que apresente os dados da tabela ANIMAIS
select tipo as 'Tipo de Animal', nome as 'Nome do Animal', idade as 'Tempo de Vida', 'Procedencia' as 'Animal Domestico' from tbAnimais;

--9. Escreva um comando que apresente os dados da tabela ANIMAIS
select tipo as 'Tipo de Animal', nome as 'Nome do Animal', idade as 'Tempo de Vida', 'Procedencia' as 'Animal Domestico', valor * 1.10 as 'Valor de Venda' from tbAnimais;

--10. Escreva um comando que apresente os dados da tabela ANIMAIS como vemos a seguir, apresentando uma vez os dados repetidos. 
select distinct tipo as 'Tipo de Animal', valor as 'Valor Original', valor * 1.10 as 'Valor de Venda' from tbAnimais;




