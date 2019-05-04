create database Jogador;
use Jogador;
create table Revista 
(
	idRevista int primary key auto_increment,
    titulo varchar(40),
    editora varchar(20),
    assunto varchar(30)
);

insert into Revista values
(null, 'Arquitetura e Manutenção', 'Fechou', 'Casa'),
(null, 'Vogue', 'Prime Editions', 'Moda'),
(null, 'Super Fascinante', 'Maio', 'Diversos'),
(null, 'DecoraSempre', 'Maio', 'Casa'),
(null, 'Claudinha', 'Abril', 'Moda'),
(null, 'Veja Só', 'EdiFutura', 'Notícias'),
(null, 'Isto não é', 'Prime Editions', 'Notícias');

select * from Revista;
select titulo, assunto from Revista;

select * from Revista where editora = 'Prime Editions';
select * from Revista where assunto = 'Moda';

select * from Revista order by editora;
select * from Revista order by titulo desc;

select * from Revista where titulo like '%e';
select * from Revista where assunto like 'm%';
select * from Revista where editora like '_a%';
select * from Revista where titulo like '%a_';

update Revista set editora = 'Abril' where idRevista = 1;
select * from Revista;

delete from Revista where idRevista = 5;
select * from Revista;

drop table Revista;