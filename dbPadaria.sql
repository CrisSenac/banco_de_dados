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

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100),
telefone char(11),
endereco varchar(100),
cnpj char(18) not null unique,
primary key(codForn)
);

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100),
telefone char(11),
dataNasc date,
primary key(codCli)
);

create table tbEstoque(
codEst int not null auto_increment,
descricao varchar(100),
quantidade int,
dataEntr date,
validade date,
codForn int not null,
primary key(codEst),
foreign key(codForn) references tbFornecedores(codForn)
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
primary key(codProd),
foreign key(codEst) references tbEstoque(codEst)
);


create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(20) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc) references tbFuncionarios(codFunc)
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
foreign key(codProd)references tbProdutos(codProd),
foreign key(codCli) references tbClientes(codCli)
);

insert into tbFuncionarios(nome,cpf,sexo,cargo,salario)values('Lurdes Maria','123.456.789-10','F','Op. de caixa',1815.00);
insert into tbFuncionarios(nome,cpf,sexo,cargo,salario)values('Ana Silva', '123.456.789-00', 'F', 'Gerente', 7500.00);
insert into tbFuncionarios(nome,cpf,sexo,cargo,salario)values('Carlos Santos', '234.567.890-11', 'M', 'Padeiro', 3500.00);
insert into tbFuncionarios(nome,cpf,sexo,cargo,salario)values('Beatriz Costa', '345.678.901-22', 'F', 'Atendente', 2500.00);
insert into tbFuncionarios(nome,cpf,sexo,cargo,salario)values('Daniel Servolo','657.478.635-11','M','Padeiro',3000.00);
insert into tbFuncionarios(nome,cpf,sexo,cargo,salario)values('Joana Fernandes','159.741.369-36','F','Op. de caixa',1815.00);

insert into tbUsuarios(nome,senha,codFunc)values('lurdes.maria','123456',1);
insert into tbUsuarios(nome,senha,codFunc)values('ana.silva','654321',2);
insert into tbUsuarios(nome,senha,codFunc)values('carlos.santos','147258',3);
insert into tbUsuarios(nome,senha,codFunc)values('beatriz.costa','369258',4);
insert into tbUsuarios(nome,senha,codFunc)values('daniel.servolo','258147',5);
insert into tbUsuarios(nome,senha,codFunc)values('joana.fernandes','987654',6);

insert into tbFornecedores(nome,email,telefone,endereco,cnpj)values('Grãos Gurgel','contato@graosgurgel.com.br','98762-2527','Rodovia Raposo Tavares KM27','41.828.849/0001-35');
insert into tbFornecedores(nome,email,telefone,endereco,cnpj)values('Farinaceos Fofão', 'contato@forfofao.com', '1234567890', 'Rua A, 123', '12.345.678/0001-90');
insert into tbFornecedores(nome,email,telefone,endereco,cnpj)values('GreenAgro Solutions', 'vendas@greenagro.com', '9876543210', 'Rua Verde, 200', '98.765.432/0001-87');
insert into tbFornecedores(nome,email,telefone,endereco,cnpj)values('TopShelf Distribuidora', 'suporte@topshelf.com', '1122334455', 'Rua dos Comerciantes, 50', '11.223.344/0001-66');
insert into tbFornecedores(nome,email,telefone,endereco,cnpj)values('Alfa Equipamentos', 'info@alfaequipamentos.com', '5566778899', 'Rua Industrial, 400', '55.667.788/0001-44');
insert into tbFornecedores(nome,email,telefone,endereco,cnpj)values('Nova Era Produtos', 'admin@novaera.com', '6677889900', 'Rua do Progresso, 700', '66.778.899/0001-55');

insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Pão Frances','26267','2030/06/12','2024/10/05','08:15:00',5,95.00,1);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Misto Quente', 'L123456789', '2025-12-31', '2024-11-26', '10:30:00', 100, 500.00, 1);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Café puro', 'L987654321', '2025-06-15', '2024-11-20', '14:15:00', 200, 375.00, 2);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Café com leite', 'L456789123', '2026-01-01', '2024-11-22', '09:00:00', 150, 120.00, 3);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Pão doce', 'L654321987', '2025-08-20', '2024-11-23', '11:45:00', 50, 300.00, 4);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Leite','L321654987', '2025-11-15', '2024-11-25', '16:00:00', 300, 900.00, 5);

insert into tbVendas(descricao,valor,quantidade,dataVend,horaVend,frmPagmnto,codUsu,codProd)values('Misto quente',10.00,1,'2024-11-22', '05:30:00','PIX'1,2);
insert into tbVendas(descricao,valor,quantidade,dataVend,horaVend,frmPagmnto,codUsu,codProd)values('Pão Frances un',5.00,6,'2024-11-24', '10:30:00', 'Dinheiro',6,1);
insert into tbVendas(descricao,valor,quantidade,dataVend,horaVend,frmPagmnto,codUsu,codProd)values('Cafe com leite',4.00,'2024-11-25', '10:15:00','PIX',6,4);
insert into tbVendas(descricao,valor,quantidade,dataVend,horaVend,frmPagmnto,codUsu,codProd)values('Pão doce',5.00,'2024-11-21', '11:00:00', 'Débito',1,5);
insert into tbVendas(descricao,valor,quantidade,dataVend,horaVend,frmPagmnto,codUsu,codProd)values('Café puro',2.00,'2024-11-21', '13:45:00', 'Dinheiro',1,3);



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


