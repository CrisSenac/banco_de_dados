-- apagar o banco de dados
drop database dbLoterica;
-- criar o banco de dados
create database dbLoterica;
-- acessar o banco de dados
use dbLoterica;
-- criar as tabelas
create table tbFuncionarios(
codFunc int,
nome varchar(100),
email varchar(100),
telefone char(10),
cpf char(14),
idade int,
salario decimal(9,2)
);
 
-- inserindo registros nas tabelas
insert into tbFuncionarios(codFunc,nome,email,telefone,cpf)values(1,'Paulo Antunes da Silva','paulo.asilva@hotmail.com','94521-7852','253.254.258-77');
insert into tbFuncionarios(codFunc,nome,email,telefone,cpf)values(2,'Regina Joaquina','regina.j@hotmail.com','96857-2314','123.456.789-10');
insert into tbFuncionarios(codFunc,nome,email,telefone,cpf)values(3,'Maria de Andrade','mariazinha.and@hotmail.com','98765-4321','321.654.987-01');
insert into tbFuncionarios(nome,email)values('Ronaldo Rodrigues','ronaldo.rodrigues@hotmail.com');
insert into tbFuncionarios(codFunc,email,cpf)values(5,'fernando.cunha@hotmail.com','258.147.369-01');
-- visualizando os estruturas das tabelas
desc tbFuncionarios;
-- visualizando os registros das tabelas
select * from tbFuncionarios;
--uso do alias para visualização do usuário
select codFunc as 'Código', nome as 'Nome', email as 'E-mail', telefone as 'Celular', cpf as 'CPF' from tbFuncionarios;
--alterar dados nas tabelas
update tbFuncionarios set nome = 'Fernando Cunha', email = 'fernando.ccunha@hotmail.com', telefone = '98765-0427' where codFunc = 5;
update tbFuncionarios set codFunc = 4, telefone = '96321-0745', cpf = '147.364.963-15' where nome = 'Ronaldo Rodrigues';

update tbFuncionarios set idade = '51', salario = 4500.00 where codFunc = 1;
update tbFuncionarios set idade = '34', salario = 2500.00 where codFunc = 2;
update tbFuncionarios set idade = '21', salario = 1500.00 where codFunc = 3;
update tbFuncionarios set idade = '48', salario = 3000.00 where codFunc = 4;
update tbFuncionarios set idade = '29', salario = 3500.00 where codFunc = 5;


select nome, salario * 1.10 as 'Aumento de salário' from tbFuncionarios;

select nome, salario * 0.75 as 'Diminuir salário' from tbFuncionarios;
select codfunc * 3.14161825 as 'PI', salario * 1.10 as 'Aumento', idade + 10 from tbfuncionarios;