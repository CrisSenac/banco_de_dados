drop database dbPadaria;
create database dbPadaria;
use dbPadaria;

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
cpf char(14) not null unique,
sexo char(1) default 'F' check(sexo in('F','M')),
cargo varchar(20),
salario decimal(9,2) default 0 check(salario >=0),
primary key(codFunc)
);

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(20) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc) references tbFuncionarios(codFunc)
);


create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100),
telefone char(10),
endereco varchar(100),
cnpj char(18) not null unique,
primary key(codForn)
);


create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100) not null,
lote char(12),
validade date,
dataEntr date,
horaEntr time,
quantidade int,
preco decimal(9,2),
codForn int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn)
);


create table tbVendas(
codVend int not null auto_increment,
descricao varchar(100),
valor decimal(9,2),
quantidade int,
dataVend date,
horaVend time,
frmPagmnto varchar(10),
codUsu int not null,
codProd int not null,
codCli int not null,
primary key(codVend),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codProd)references tbProdutos(codProd)
);

insert into tbFuncionarios(nome,cpf,sexo,cargo,salario)values('Lurdes Maria','123.456.789-10','F','Op. de caixa',1615.00);

insert into tbUsuarios(nome,senha,codFunc)values('lurdes.maria','123456',1);

insert into tbFornecedores(nome,email,telefone,endereco,cnpj)values('Grãos Gurgel','contato@graosgurgel.com.br','98762-2527','Rodovia Raposo Tavares KM27','41.828.849/0001-35');

insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Farinha de trigo 30kg','26267','2030/06/12','2024/10/05','08:15:00',5,95.00,1);

insert into tbVendas(valor,quantidade,dataVend,horaVend,frmPagmnto,codUsu,codProd,codCli)values('');

select * from tbFuncionarios;
select * from tbUsuarios;
select * from tbFornecedores;
select * from tbProdutos;
select * from tbVendas;

desc tbFuncionarios;
desc tbUsuarios;
desc tbFornecedores;
desc tbProdutos;
desc tbVendas;


