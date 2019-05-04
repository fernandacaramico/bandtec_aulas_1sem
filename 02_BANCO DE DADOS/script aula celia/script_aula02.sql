create database Filme;
use Filme;
create table Filme (
 idFilme INT PRIMARY KEY,
 titulo VARCHAR(100),
 genero VARCHAR(100),
 diretor varchar(100)
);
select * from filme;
insert into filme values 
	(1, "Roma", 'Drama', 'Alfonso Cuarón');

insert into filme (idFilme, titulo) values (2, 'A Favorita');
insert into filme (idFilme, titulo) values (3, 'Star Wars');

create table Filme2 (
 idFilme INT PRIMARY KEY auto_increment,
 titulo VARCHAR(100),
 genero VARCHAR(100),
 diretor varchar(100)
);

insert into filme2 (idFilme, titulo) values (1, 'A Favorita');
insert into filme2 (idFilme, titulo) values (2, 'Star Wars');
insert into filme2 (titulo) values ('A Star is Born');

select * from filme2;

insert into filme2 (titulo) values
	 ('Star Wars: The Last Jedi');

update filme2 set genero='Drama', diretor='Yorgos' where idFilme = 1;
update filme2 set diretor='Yorgos Lanthimos' where idFilme=1;

insert into filme (idFilme, titulo) values
	(4, 'Fragmentado'),
    (5, 'Star Wars'),
    (6, 'Sexto Sentido'),
    (7, 'Titanic'),
    (8, 'Avatar');

select * from filme;

update filme set diretor = 'M. Night Shyamalan' where idFilme = 4 or idFilme = 6;
update filme set diretor = 'James Cameron' where idFilme in (7, 8);

update filme set genero='sci fi', diretor = 'George Lucas' where idFilme in (3, 4);