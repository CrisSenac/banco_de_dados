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

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(20) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbClientes(
codCli int not null auto_increment,
nome varchar(50),
email varchar(50),
telCel char(10),
primary key(codCli)
);


create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100),
telefone char(10),
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
valor decimal(9,2),
quantidade int,
dataVend date,
horaVend time,
codUsu int not null,
codProd int not null,
codCli int not null,
primary key(codVend),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codProd)references tbProdutos(codProd),
foreign key(codCli)references tbClientes(codCli));

insert into tbFuncionarios(nome,rg,cpf,sexo,salario)values('Jurandir da Silva','12.123.321-8','123.456.789-10','M',2500.45);
insert into tbFuncionarios(nome,rg,cpf,sexo,salario)values('Matheus Melo','52.741.528-7','425.785.985-77','M',2500.45);
insert into tbFuncionarios(nome,rg,cpf,sexo,salario)values('Ana Flores','321.654.987-1','741.852.963.00','F',1980.05);
insert into tbFuncionarios(nome,rg,cpf,sexo,salario)values('Gisele Goes','325.964.320-4','987.961.357-01','F',3000.57);

insert into tbClientes(nome,email,telCel)values('Joana Antunes','joana.antunes@hotmail.com','95782-4631');
insert into tbClientes(nome,email,telCel)values('Katia Assad','katia.assad@hotmail.com','98765-4321');
insert into tbClientes(nome,email,telCel)values('Mauricio de Souza','mauricio.souza@hotmail.com','98214-6573');

insert into tbFornecedores(nome,email,telefone,cnpj)values('Armarinhos Fernandes','sac@armarinhosf.com.br','98523-8745','48.076.221./0001-91');
insert into tbFornecedores(nome,email,telefone,cnpj)values('Hortifrut Fernando','sac@fernando.com.br','91473-0285','42.489.825./0001-61');
insert into tbFornecedores(nome,email,telefone,cnpj)values('Assai Atacadista','sac@assai.com.br','94173-0285','43.489.723./0001-81');
insert into tbFornecedores(nome,email,telefone,cnpj)values('Tenda Atacado','sac@tenda.com.br','97143-0285','24.489.825./0001-71');

insert into tbUsuarios(nome,senha,codFunc)values('ana.flores','123456',3);
insert into tbUsuarios(nome,senha,codFunc)values('matheus.melo','123456',2);
insert into tbUsuarios(nome,senha,codFunc)values('jurandir.silva','123456',1);

insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Papel Sulfite','524515','2030/12/21','2024/11/21','11:46:00',200,25.35,1);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Arroz Tipo 1','2024001','2030/11/10','2024/11/21','08:30:00',100, 5.50, 3);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Feijao Carioca','2024002','2026/11/05','2024/11/21','09:15:00',1000,7.20, 2);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Oleo de Soja 900ml','2024003','2026/11/02','2024/11/21','10:00:00',350,9.80, 3);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Acucar Refinado','2024004','2025/11/06','2024/11/21','11:45:00',600,4.10, 4);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Cafe Torrado e Moido','2024005','2024/11/21','15/11/2024', '07:50:00',750,12.40, 3);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Banana','26262','2025/05/05','2024/11/21','08:00:15',250,12.00,2);

insert into tbVendas(valor,quantidade,dataVend,horaVend,codUsu,codProd,codCli)values(10.50,5,'2024/11/21','08:30:05',2,2,2);
insert into tbVendas(valor,quantidade,dataVend,horaVend,codUsu,codProd,codCli)values(3.35,3,'2024/11/20','11:30:05',3,3,3);
insert into tbVendas(valor,quantidade,dataVend,horaVend,codUsu,codProd,codCli)values(100.25,1,'2024/11/19','10:32:05',1,1,3);
insert into tbVendas(valor,quantidade,dataVend,horaVend,codUsu,codProd,codCli)values(55.50,5,'2024/11/19','10:35:05',1,4,3);
insert into tbVendas(valor,quantidade,dataVend,horaVend,codUsu,codProd,codCli)values(50.00,2,'2024/11/19','10:40:05',1,1,3);

select * from tbFuncionarios;
select * from tbClientes;
select * from tbFornecedores;
select * from tbUsuarios;
select * from tbProdutos;
select * from tbVendas;

desc tbFuncionarios;
desc tbUsuarios;
desc tbClientes;
desc tbFornecedores;
desc tbProdutos;
desc tbVendas;


-- inner join

select func.nome as 'Nome do Funcionario',
usu.nome as 'Nome do Usuario' from tbUsuarios as usu
inner join   tbFuncionarios as func
on usu.codFunc = func.codFunc
where func.codFunc = 2;

select func.nome as 'Nome do Funcionario',
usu.nome as 'Nome do Usuario' from tbUsuarios as usu
inner join   tbFuncionarios as func
on usu.codFunc = func.codFunc
where func.nome like '%n%';

select func.nome,cli.nome,prod.descricao,
vend.quantidade,vend.valor
from tbVendas as vend
inner join tbFuncionarios 
as func on func.codfunc = vend.codUsu 
inner join
 tbClientes as cli on vend.codCli = cli.codCli
inner join
tbProdutos as prod on vend.codProd = prod.codProd;

-- Nome do fornecedor, lote do produto , validade do produto, 
-- email do fornecedor, quantidade de produto, 
-- cnpj do fornecedor, preço do produto.
 
-- A pergunta é para a tabela produtos.

select forn.nome as 'Nome do Fornecedor',prod.lote as 'Lote Produto',prod.validade as 'Validade Produto',forn.email as 'E-mail Fornecedor',prod.quantidade as 'Quantidade Produto',
forn.cnpj as 'CNPJ Fornecedor',prod.preco as 'Preço Produto'
from tbProdutos as prod 
inner join tbFornecedores as forn;
