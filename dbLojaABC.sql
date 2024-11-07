drop database dbLojaABC;

create database dbLojaABC;

use dbLojaABC;

create table tbFuncionarios(
codFunc int,
nome varchar(100),
email varchar(100),
cpf char(14) unique,
endereco varchar(100),
cep char(9),
numero char(10),
bairro varchar(100),
cidade varchar(100),
estado char(2),
telefone char(10),
dataNasc date,
salario decimal(9,2)
);

desc tbFuncionarios;

insert into tbFuncionarios(codFunc,nome,email,cpf,endereco,cep,numero,bairro,cidade,estado,telefone,dataNasc,salario)values(1,'Francisca da Silva','francisca.s@hotmail.com','123.456.789-10','Rua Doutor Antonio','05856-000','15','Santo Amaro','São Paulo','SP','98765-4123','2000/10/31',1500.00);