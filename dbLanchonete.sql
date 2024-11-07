-- apagar o banco de dados existente
drop database dbLanchonete;

--criar um banco de dados
create database dbLanchonete;

-- visualizar banco de dados
show databases;

-- acessar o banco de dados
use dbLanchonete;

-- visualizar o banco de dados
show tables;

-- criando tabelas para o banco de dados

create table tbUsuarios(
codUsu int,
nome varchar(30),
senha varchar(12)
);

create table tbFuncionarios(
codFunc int,
nome varchar(100),
email varchar(100),
telefone char(10),
logradouro varchar(100),
numero char(10),
complemento varchar(50),
bairro varchar(100),
cep char(9),
cidade varchar(100),
estado varchar(2)
);

-- visualizar estrutura da tabela
desc tbUsuarios;
desc tbFuncionarios;