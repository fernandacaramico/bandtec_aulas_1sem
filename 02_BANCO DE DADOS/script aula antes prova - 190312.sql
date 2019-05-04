create database pessoa;
use pessoa;
create table pessoa 
(
	idPessoa int primary key auto_increment,
    nome varchar(40),
    dataNasc date
);

select * from pessoa;

insert into pessoa values 
	(null, 'Claudia Silva', '2000-02-10'),
    (null, 'Jose Teixeira', '1999-10-05'),
    (null, 'Fulano Oliveira', '2001-05-15'),
    (null, 'Beltrano Oliveira', '2000-07-03');
    
insert into pessoa values 
	(null, 'Luciana Silveira', '20000207');
    
insert into pessoa (nome, dataNasc) values 
	('Ciclano Costa', '1998-05-12');

select * from pessoa order by nome;
select nome from pessoa order by nome;
select nome from pessoa order by nome desc;
select * from pessoa where nome like '% s%';
select * from pessoa where nome like '__c%';
select * from pessoa order by dataNasc;
insert into pessoa values (10, 'Catatau Mel', '1988-03-03');
insert into pessoa values (null, 'Melanie Mel', '1980-09-10');
insert into pessoa (nome, datanasc) values ('Mickey Mouse', '1960-07-07');

alter table pessoa auto_increment = 30;
insert into pessoa values (null, 'Donald Duck', '1954-12-30');

select * from pessoa;

create table teste 
(
	idTeste int primary key auto_increment, 
    nomeTeste varchar(30),
    horaTeste time
) auto_increment = 1000;

insert into teste values
(null, 'eu testo', '1:30'),
(null, 'tu testas', '2');

select * from teste;

update teste set horateste = '1:30' where idteste = 1000;

select idteste as Codigo, nometeste as Nome, horateste as 'Hora da Medição' from teste;

insert into teste values (null, 'ele testa', '4:00'), (null, 'nós testamos', '7:00'), (null, 'vós testais', '10:10');

select * from teste;