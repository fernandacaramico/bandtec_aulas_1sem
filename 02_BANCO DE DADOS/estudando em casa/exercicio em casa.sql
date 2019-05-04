use bandtec;
create database Musica;
use Musica;
create table Musica (
	idMusica int primary key,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);
insert into Musica values 
(1, 'Mother Tongue', 'Bring me the horizon', 'Rock'), 
(2, 'Imagine', 'John Lennon', 'Rock'),
(3, 'Blue Jeans', 'Lana Del Rey', 'Indie Pop'),
(4, 'Primadonna', 'Marina and the Diamonds', 'Pop'),
(5, 'Let it be', 'The Beatles', 'Rock'),
(6, 'Joanne', 'Lady Gaga', 'Pop'),
(7, 'Thnks fr th mmrs', 'Fall Out Boy', 'Pop Rock'),
(8, 'I Write Sins not Tragedies', 'Panic! At The Disco', 'Pop rock');

select * from Musica;
select titulo, artista from Musica;
select * from Musica where genero = 'rock';
select * from Musica where artista = 'The Beatles';
select * from Musica order by artista desc;
select * from Musica where titulo like 'p%';
select * from Musica where artista like '%n';
select * from Musica where genero like '_o%';
select * from Musica where titulo like '%n_';
update Musica set genero = 'Post Punk' where idMusica = 7;
select * from Musica;
alter table musica modify titulo varchar(50);
desc musica;
delete from musica where idMusica = 8;
select * from Musica;

