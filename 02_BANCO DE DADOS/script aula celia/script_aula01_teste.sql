create table Empresas
(
  código int primary key,
  nome varchar(100),
  representante varchar(100)
);
insert into empresas values (001, 'easynvest', 'vitor'), (002, 'stefanini', 'flávia'), (003, 'totvs', 'ananda');
create table instituição
(
  código_esc int primary key,
  nome varchar(100),
  cidade varchar(100)
  );
insert into instituição values (100, 'Col NSDP', 'Peruíbe'), (101, 'Bandeirantes', 'São Paulo'), (102, 'Objetivo', 'Santos');
create table teste
(
  código_teste int primary key auto_increment,
  nome varchar(100),
  idade int,
  planeta varchar(100)
  );

insert into teste (nome, idade, planeta) values ('maria', 12, 'marte');
select * from teste;
insert into teste (nome, idade, planeta) values ('joao', 15, 'saturno'), ('carol', 11, 'plutão'), ('mariazinha', 9, 'marshmallow');
select * from teste;