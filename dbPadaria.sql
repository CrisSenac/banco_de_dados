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
comanda int not null,
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
codForn int not null,
codEst int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn),
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

insert into tbFornecedores(nome,email,telefone,endereco,cnpj)values('Grãos Gurgel','contato@graosgurgel.com.br','98762-2527','Rodovia Raposo Tavares KM27','41.828.849/0001-35');
insert into tbFornecedores(nome,email,telefone,endereco,cnpj)values('Farinaceos Fofão', 'contato@forfofao.com', '12345-7890', 'Rua A, 123', '12.345.678/0001-90');
insert into tbFornecedores(nome,email,telefone,endereco,cnpj)values('GreenAgro Solutions', 'vendas@greenagro.com', '98765-3210', 'Rua Verde, 200', '98.765.432/0001-87');
insert into tbFornecedores(nome,email,telefone,endereco,cnpj)values('TopShelf Distribuidora', 'suporte@topshelf.com', '11223-4455', 'Rua dos Comerciantes, 50', '11.223.344/0001-66');
insert into tbFornecedores(nome,email,telefone,endereco,cnpj)values('Alfa Equipamentos', 'info@alfaequipamentos.com', '55667-8899', 'Rua Industrial, 400', '55.667.788/0001-44');
insert into tbFornecedores(nome,email,telefone,endereco,cnpj)values('Nova Era Produtos', 'admin@novaera.com', '66778-9900', 'Rua do Progresso, 700', '66.778.899/0001-55');

insert into tbEstoque(descricao,quantidade,dataEntr,validade,codForn)values('Farinha de Trigo 10kg',3,'2024-11-15','2030-06-12',2);
insert into tbestoque(descricao,quantidade,dataEntr,validade,codForn)values('Cafe Moido',50,'2024-11-26','2031-10-03',1);
insert into tbEstoque(descricao,quantidade,dataEntr,validade,codForn)values('Leite Parmalat',100,'2024-01-12','2025-06-15',6);
insert into tbEstoque(descricao,quantidade,dataEntr,validade,codForn)values('Açucar Uniao',120,'2024-11-21','2026-05-21',1);
insert into tbEstoque(descricao,quantidade,dataEntr,validade,codForn)values('Copos Descartaveis',300,'2024-05-25','2050-07-30',5);

insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn,codEst)values('Pão Frances','26267','2030-06-12','2024-10-05','08:15:00',5,95.00,1,2);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn,codEst)values('Misto Quente', 'L123456789', '2025-12-31', '2024-11-26', '10:30:00', 100, 500.00, 1,1);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn,codEst)values('Café puro', 'L987654321', '2025-06-15', '2024-11-20', '14:15:00', 200, 375.00, 2,2);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn,codEst)values('Café com leite', 'L456789123', '2026-01-01', '2024-11-22', '09:00:00', 150, 120.00, 3,1);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn,codEst)values('Pão doce', 'L654321987', '2025-08-20', '2024-11-23', '11:45:00', 50, 300.00,4,1);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn,codEst)values('Leite','L321654987', '2025-11-15', '2024-11-25', '16:00:00', 300, 900.00, 5,2);

insert into tbUsuarios(nome,senha,codFunc)values('lurdes.maria','123456',1);
insert into tbUsuarios(nome,senha,codFunc)values('ana.silva','654321',2);
insert into tbUsuarios(nome,senha,codFunc)values('carlos.santos','147258',3);
insert into tbUsuarios(nome,senha,codFunc)values('beatriz.costa','369258',4);
insert into tbUsuarios(nome,senha,codFunc)values('daniel.servolo','258147',5);
insert into tbUsuarios(nome,senha,codFunc)values('joana.fernandes','987654',6);

insert into tbClientes(nome,telefone,comanda,dataNasc)values('João da Silva', '11987654321', 101, '1990-05-15');
insert into tbClientes(nome,telefone,comanda,dataNasc)values('Maria Oliveira', '11912345678', 102, '1985-08-20');
insert into tbClientes(nome,telefone,comanda,dataNasc)values('José Sevino','1198521454',103,'1965-10-01');
insert into tbClientes(nome,telefone,comanda,dataNasc)values('Alice Moreira S','11987553214',104,'2001-03-14');
insert into tbClientes(nome,telefone,comanda,dataNasc)values('Estefano Martins','11975363649',105,'1999-12-05');

insert into tbVendas(descricao,valor,quantidade,dataVend,horaVend,frmPagmnto,codUsu,codProd,codCli)values('Misto quente',10.00,1,'2024-11-22','05:30:00','PIX',1,2,1);
insert into tbVendas(descricao,valor,quantidade,dataVend,horaVend,frmPagmnto,codUsu,codProd,codCli)values('Pão Frances un',5.00,6,'2024-11-24', '10:30:00', 'Dinheiro',6,1,1);
insert into tbVendas(descricao,valor,quantidade,dataVend,horaVend,frmPagmnto,codUsu,codProd,codCli)values('Cafe com leite',4.00,1,'2024-11-25', '10:15:00','PIX',6,4,1);
insert into tbVendas(descricao,valor,quantidade,dataVend,horaVend,frmPagmnto,codUsu,codProd,codCli)values('Pão doce',5.00,2,'2024-11-21', '11:00:00', 'Débito',1,5,1);
insert into tbVendas(descricao,valor,quantidade,dataVend,horaVend,frmPagmnto,codUsu,codProd,codCli)values('Café puro',2.00,1,'2024-11-21', '13:45:00', 'Dinheiro',1,3,1);










select * from tbFuncionarios;
select * from tbFornecedores;
select * from tbClientes;
select * from tbEstoque;
select * from tbProdutos;
select * from tbUsuarios;
select * from tbVendas;

desc tbFuncionarios;
desc tbFornecedores;
desc tbClientes;
desc tbEstoque;
desc tbProdutos;
desc tbUsuarios;
desc tbVendas;


