
create table cliente (
    IdCli int generated always as identity (start with 1, increment by 1) primary key,
    Nome varchar(100) not null,
    Sexo varchar (20),
    Status boolean,
    DataNasc Date not null,
    EstadoCivil varchar(30) not null,
    CPF varchar (30) not null,
    Tel varchar (30),
    Cel varchar (30),
    Email varchar(30),
    Logradouro varchar(150) not null,
    Numero varchar(30) not null,
    Complemento varchar(30),
    CEP varchar(10) not null,
    Bairro varchar(100) not null,
    Cidade varchar(100) not null,
    Estado varchar(100) not null
);

rename column cliente.DATANASC to data;
rename column cliente.TEL to TELEFONE;
rename column cliente.CEL to CELULAR;

create table filial (
    IdFilial int generated always as identity (start with 1, increment by 1) primary key,
    Filial_Nome varchar(100) not null,
    Estado varchar(100) not null,
    Cidade Varchar(100) not null,
    Status boolean
);

create table setor (
    IdSetor int generated always as identity (start with 1, increment by 1) primary key,
    Setor_Nome varchar(100) not null,
    Descricao varchar(200),
    Status boolean
);

create table cargo (
    IdCargo int generated always as identity (start with 1, increment by 1) primary key,
    IdSetor int not null,
    Cargo_Nome varchar(100) not null,
    Descricao varchar(200),
    Status boolean,
    foreign key (IdSetor) references setor(IdSetor)
);

create table funcionario (
    IdFunc int generated always as identity (start with 1, increment by 1) primary key,
    IdFilial int not null,
    IdCargo int not null,
    --IdSetor int not null,
    Nome varchar(100) not null,
    Login varchar(100) unique not null,
    Senha varchar(100) not null,
    Status boolean not null,
    foreign key (IdFilial) references filial(IdFilial),
    foreign key (IdCargo) references cargo(IdCargo)
);

create table produto (
    IdProd int generated always as identity (start with 1, increment by 1) primary key,
    Nome varchar(100) not null,
    Fabricante varchar(100) not null,
    TipoProd varchar(100) not null,
    Quantidade int,
    Status boolean,
    Valor float,
    Garantia int,
    DataFab Date
);

create table pedido (
    IdPedido int generated always as identity (start with 1, increment by 1) primary key,
    IdCli int not null,
    IdFilial int not null,
    DataComp Date,
    Valor float,
    foreign key (IdCli) references cliente(IdCli),
    foreign key (IdFilial) references filial(IdFilial)
);

create table itensPedidos (
    IdItem int generated always as identity (start with 1, increment by 1) primary key,
    IdProd int not null,
    IdPedido int not null,
    Quantidade int,
    SubTotal float,
    foreign key (IdProd) references produto(IdProd),
    foreign key (IdPedido) references pedido(IdPedido)
);

create table modulo (
    IdModulo int generated always as identity (start with 1, increment by 1) primary key,
    Modulo_Nome varchar(100) not null,
    Sub_Nome varchar(100)
);

create table permissao (
    IdPerm int generated always as identity (start with 1, increment by 1) primary key,
    IdModulo int not null,
    IdCargo int not null,
    foreign key (IdModulo) references modulo(IdModulo),
    foreign key (IdCargo) references cargo(IdCargo)
);

-- Modulo --
INSERT INTO modulo (MODULO_NOME, SUB_NOME) VALUES ('cliente', 'consulta');
INSERT INTO modulo (MODULO_NOME, SUB_NOME) VALUES ('cliente', 'cadastro');

INSERT INTO modulo (MODULO_NOME, SUB_NOME) VALUES ('funcionario', 'consulta');
INSERT INTO modulo (MODULO_NOME, SUB_NOME) VALUES ('funcionario', 'cadastro');

INSERT INTO modulo (MODULO_NOME, SUB_NOME) VALUES ('produto', 'consulta');
INSERT INTO modulo (MODULO_NOME, SUB_NOME) VALUES ('produto', 'cadastro');

INSERT INTO modulo (MODULO_NOME, SUB_NOME) VALUES ('relatorio', 'consulta');

INSERT INTO modulo (MODULO_NOME, SUB_NOME) VALUES ('venda', 'cadastro');

-- Setor --
INSERT INTO setor (SETOR_NOME, DESCRICAO, STATUS) VALUES ('Produtos/Serviços', 
    'O BackOffice cuida da manutenção dos produtos no sistema e em estoque.', true);

INSERT INTO setor (SETOR_NOME, DESCRICAO, STATUS) VALUES ('Vendas', 
    'Vendas lida diretamente com o cliente.', true);

INSERT INTO setor (SETOR_NOME, DESCRICAO, STATUS) VALUES ('T.I', 
    'Cuida do cadastro de novos funcionarios e da suporte ao sistema.', true);


-- CARGO --
-- BackOffice --
INSERT INTO cargo (IDSETOR, CARGO_NOME, DESCRICAO, STATUS) VALUES (1, 'Gerente', 
    'Gerencia a equipe.', true);

INSERT INTO cargo (IDSETOR, CARGO_NOME, DESCRICAO, STATUS) VALUES (1, 'Atendente', 
    'Atendimento ao cliente.', true);

INSERT INTO cargo (IDSETOR, CARGO_NOME, DESCRICAO, STATUS) VALUES (1, 'Analista', 
    'Analise de produtos.', true);

INSERT INTO cargo (IDSETOR, CARGO_NOME, DESCRICAO, STATUS) VALUES (1, 'Estoquista', 
    'Responsável pelo estoque de produtos.', true);

-- Vendas -- 
INSERT INTO cargo (IDSETOR, CARGO_NOME, DESCRICAO, STATUS) VALUES (2, 'Gerente', 
    'Gerencia a equipe.', true);

INSERT INTO cargo (IDSETOR, CARGO_NOME, DESCRICAO, STATUS) VALUES (2, 'Vendedor', 
    'Vende os produtos.', true);

INSERT INTO cargo (IDSETOR, CARGO_NOME, DESCRICAO, STATUS) VALUES (2, 'Analista', 
    'Analisa as vendas.', true);

-- T.I --
INSERT INTO cargo (IDSETOR, CARGO_NOME, DESCRICAO, STATUS) VALUES (3, 'Gerente', 
    'Gerencia a equipe.', true);

INSERT INTO cargo (IDSETOR, CARGO_NOME, DESCRICAO, STATUS) VALUES (3, 'Suporte', 
    'Gerencia a equipe.', true);

INSERT INTO cargo (IDSETOR, CARGO_NOME, DESCRICAO, STATUS) VALUES (3, 'Analista', 
    'Gerencia a equipe.', true);

-- PERMISSAO --
-- Gerente BackOffice --
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (5, 1);
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (7, 1);

-- Atendente BackOffice --
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (5, 2);
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (6, 2);

-- Estoquista BackOffice --
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (5, 4);
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (6, 4);

-- Gerente Vendas --
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (1, 5);
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (7, 5);

-- Vendedor Vendas --
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (1, 6);
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (2, 6);
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (8, 6);

-- Analista Vendas --
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (1, 7);
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (7, 7);

-- Gerente T.I --
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (3, 8);
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (7, 8);

-- Suporte T.I --
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (3, 9);
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (4, 9);

-- Analista T.I --
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (1, 10);
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (2, 10);
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (3, 10);
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (4, 10);
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (5, 10);
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (6, 10);
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (7, 10);
INSERT INTO permissao (IDMODULO, IDCARGO) VALUES (8, 10);

-- FILIAL --
INSERT INTO filial (FILIAL_NOME, ESTADO, CIDADE, STATUS) VALUES ('Filial Recife', 'Pernambuco', 'Recife', true);
INSERT INTO filial (FILIAL_NOME, ESTADO, CIDADE, STATUS) VALUES ('Filial Porto Alegre', 'Rio Grande do Sul', 'Porto Alegre', true);
INSERT INTO filial (FILIAL_NOME, ESTADO, CIDADE, STATUS) VALUES ('Matriz São Paulo', 'São Paulo', 'São Paulo', true);

-- FUNCIONARIO --
INSERT INTO funcionario (IDFILIAL, IDCARGO, NOME, LOGIN, SENHA, STATUS) 
VALUES (3, 10, 'davi', 'davi', '123456', TRUE);

INSERT INTO funcionario (IDFILIAL, IDCARGO, NOME, LOGIN, SENHA, STATUS) 
VALUES (2, 8, 'adm', 'adm', '123456', TRUE);

INSERT INTO funcionario (IDFILIAL, IDCARGO, NOME, LOGIN, SENHA, STATUS) 
VALUES (3, 10, 'nicolas', 'nicolas', '123456', TRUE);

INSERT INTO funcionario (IDFILIAL, IDCARGO, NOME, LOGIN, SENHA, STATUS) 
VALUES (3, 10, 'ezquiel', 'ezequiel', '123456', TRUE);

-- select * from funcionario
-- select * from cargo

-- PRODUTO --
INSERT INTO PRODUTO (NOME, FABRICANTE, TIPOPROD, QUANTIDADE, STATUS, VALOR, GARANTIA, DATAFAB)
VALUES ('Bioshock - Rapture','Novo Século','LIVRO', 10,TRUE,42.90,3,'2013-05-20');

INSERT INTO PRODUTO (NOME, FABRICANTE, TIPOPROD, QUANTIDADE, STATUS, VALOR, GARANTIA, DATAFAB)
VALUES ('Percy Jackson - O Mar de Monstros','Instrinseca','LIVRO', 5,TRUE,26.90,3,'2014-09-15');

INSERT INTO PRODUTO (NOME, FABRICANTE, TIPOPROD, QUANTIDADE, STATUS, VALOR, GARANTIA, DATAFAB)
VALUES ('Harry Potter e a Pedra Filosofal','Rocco ','LIVRO', 2,TRUE,29.90,12,'1997-07-26');

INSERT INTO PRODUTO (NOME, FABRICANTE, TIPOPROD, QUANTIDADE, STATUS, VALOR, GARANTIA, DATAFAB)
VALUES ('Vade Mecum Tradicional','Saraiva ','LIVRO', 50,TRUE,96.90,12,'2018-04-20');

INSERT INTO PRODUTO (NOME, FABRICANTE, TIPOPROD, QUANTIDADE, STATUS, VALOR, GARANTIA, DATAFAB)
VALUES ('Introdução À Programação Com Python','Novatec','LIVRO',102,TRUE,57.90,3,'2014-03-15');

INSERT INTO PRODUTO (NOME, FABRICANTE, TIPOPROD, QUANTIDADE, STATUS, VALOR, GARANTIA, DATAFAB)
VALUES ('Mouse Gamer BenQ Zowie Fk1','BenQ','INFORMÁTICA',30,TRUE,449.00,12,'2014-03-15');

INSERT INTO PRODUTO (NOME, FABRICANTE, TIPOPROD, QUANTIDADE, STATUS, VALOR, GARANTIA, DATAFAB)
VALUES ('Dunkirk','Warner Home Video','FILMES',50,TRUE,99.90,1,'2017-05-05');

INSERT INTO PRODUTO (NOME, FABRICANTE, TIPOPROD, QUANTIDADE, STATUS, VALOR, GARANTIA, DATAFAB)
VALUES ('Game Of Thrones - Temporadas Completas 1-7','','SERIE',15,TRUE,359.90,3,'2017-11-28');

INSERT INTO PRODUTO (NOME, FABRICANTE, TIPOPROD, QUANTIDADE, STATUS, VALOR, GARANTIA, DATAFAB)
VALUES ('Caderno Espiral Universitário','Tilibra','PAPELARIA',200,TRUE,34.90,3,'2016-08-30');

INSERT INTO PRODUTO (NOME, FABRICANTE, TIPOPROD, QUANTIDADE, STATUS, VALOR, GARANTIA, DATAFAB)
VALUES ('Iphone X 256Gb','Apple','CELULARES',10,TRUE,7799.00,12,'2017-10-27');

-- CLIENTE --
INSERT INTO CLIENTE (NOME, SEXO, STATUS, DATA, ESTADOCIVIL, CPF, TELEFONE, EMAIL, LOGRADOURO, NUMERO, CEP, BAIRRO, ESTADO, CIDADE)
VALUES ('Felipe Machado','MASCULINO',TRUE,'1980-02-15','SOLTEIRO(A)','12345678911','1133219885','FMACHADO@GMAIL.COM','Rua Menina Dengosa','112','04860280','Jardim Guanabara','SP','São Paulo');

INSERT INTO CLIENTE (NOME, SEXO, STATUS, DATA, ESTADOCIVIL, CPF, TELEFONE, EMAIL, LOGRADOURO, NUMERO, CEP, BAIRRO, ESTADO, CIDADE)
VALUES ('Clara Bóia','FEMININO',TRUE,'1990-08-02','CASADA(A)','12507852189','1152256332','CLARAB@GMAIL.COM','Rua Menina Dengosa','96 APT 31','04860280','Jardim Guanabara','SP','São Paulo');

INSERT INTO CLIENTE (NOME, SEXO, STATUS, DATA, ESTADOCIVIL, CPF, TELEFONE, EMAIL, LOGRADOURO, NUMERO, CEP, BAIRRO, ESTADO, CIDADE)
VALUES ('Karen Narino ','FEMININO',TRUE,'2000-01-07','SOLTEIRO(A)','12567855678','1152256332','KANARINO@GMAIL.COM','Rua Menina Dengosa','101 APT 50','04860280','Jardim Guanabara','SP','São Paulo');

INSERT INTO PEDIDO (IDCLI, IDFILIAL, DATACOMP, VALOR)
VALUES (1, 1, '2018-12-08', 70);

INSERT INTO PEDIDO (IDCLI, IDFILIAL, DATACOMP, VALOR)
VALUES (2, 2, '2018-12-08', 70);

INSERT INTO PEDIDO (IDCLI, IDFILIAL, DATACOMP, VALOR)
VALUES (3, 3, '2018-12-08', 70);

INSERT INTO ITENSPEDIDOS (IDPROD, IDPEDIDO, QUANTIDADE, SUBTOTAL)
VALUES (1, 1, 1, 20);

INSERT INTO ITENSPEDIDOS (IDPROD, IDPEDIDO, QUANTIDADE, SUBTOTAL)
VALUES (2, 1, 1, 50);

INSERT INTO ITENSPEDIDOS (IDPROD, IDPEDIDO, QUANTIDADE, SUBTOTAL)
VALUES (1, 2, 1, 20);

INSERT INTO ITENSPEDIDOS (IDPROD, IDPEDIDO, QUANTIDADE, SUBTOTAL)
VALUES (2, 2, 1, 50);

INSERT INTO ITENSPEDIDOS (IDPROD, IDPEDIDO, QUANTIDADE, SUBTOTAL)
VALUES (1, 3, 1, 20);

INSERT INTO ITENSPEDIDOS (IDPROD, IDPEDIDO, QUANTIDADE, SUBTOTAL)
VALUES (2, 3, 1, 50);