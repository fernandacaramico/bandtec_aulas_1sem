/*CREATE DATABASE estudando;*/
/*USE estudando;*/
USE bandtec;
create table estudando_09_03 (
	id_livros int primary key,
	autor varchar(100),
    título varchar(100),
    ano int,
    nota varchar(20)
);
select * from estudando_09_03;
insert into estudando_09_03 values
(1, 'Bukowski', 'Mulheres', 1930, 'Muito Bom'),
(2, 'Jack Kerouac', 'On the Road', 1970, 'Ótimo'),
(3, 'J. K. Rowling', 'Harry Potter', 2002, 'Ótimo'),
(4, 'Murakami', 'Minha queria Sputnik', 1996, 'Muito Bom'),
(5, 'Murakami', 'Kafka à beira mar', 2008, 'Ótimo'),
(6, 'Stephanie Meyer', 'Crepúsculo', 2004, 'Razoável'),
(7, 'Milk and honey', 'Rupi Kaur', 2015, 'Ótimo');
select autor, título from estudando_09_03;
select * from estudando_09_03 where autor = 'Murakami';
select * from estudando_09_03 where nota = 'Ótimo';
select * from estudando_09_03 order by nota;
select * from estudando_09_03 order by autor desc;

/*
selecionando usando letras como critérios
*/

select * from estudando_09_03 where título like 'r%';
select * from estudando_09_03 where nota like '%o' order by ano;
select * from estudando_09_03 where autor like '_a%';
select * from estudando_09_03 where ano like '%7_';

update estudando_09_03 set autor = 'Rupi Kaur' where id_livros = 7;
update estudando_09_03 set título = 'Milk and honey', ano = 2017 where id_livros = 7;

alter table estudando_09_03 modify título varchar(50);
desc estudando_09_03;
alter table estudando_09_03 change título titulo varchar(120);
desc estudando_09_03;
alter table estudando_09_03 add tenhoounao varchar(20);
desc estudando_09_03;
alter table estudando_09_03 drop column tenhoounao;
desc estudando_09_03;

delete from estudando_09_03 where id_livros = 4;
select * from estudando_09_03;