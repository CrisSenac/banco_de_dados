drop database dbPortaria;
create database dbPortaria;
use dbPortaria;

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
rg char(13) unique,
cpf char(14) not null unique,
sexo char(1) default 'F' check(sexo in('F','M')),
salario decimal(9,2) default 0 check(salario >=0),
primary key(codFunc)
);

insert into tbFuncionarios(nome,rg,cpf,sexo,salario)values('Jurandir da Silva','12.123.321-8','123.456.789-10','M',2500.45);
insert into tbFuncionarios(nome,rg,cpf,sexo,salario)values('Matheus Melo','52.741.528-7','425.785.985-77','M',2500.45);
insert into tbFuncionarios(nome,rg,cpf,sexo,salario)values('Ana Flores','321.654.987-1','741.852.963.00','F',1987.05);
insert into tbFuncionarios(nome,rg,cpf,sexo,salario)values('Gisele Goes','325.964.320-4','987.961.357-01','F',3000.57);

desc tbFuncionarios;