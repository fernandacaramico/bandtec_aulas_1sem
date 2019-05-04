create database bandtec;
use bandtec;
create table materias
(
	id int primary key,
    materia varchar(100),
    professor_a varchar(100),
    dia_da_semana varchar(100)
);

insert into materias values (001, 'Socioemocional', 'Vera', '1 Seg, Ter, Qua, Qui, Sex'), (002, 'Algoritmos', 'Yoshi', '2 Seg, Sex'), (003, 'Banco de Dados', 'Célia', '3 Ter'), (004, 'P.I.', 'Brandão', '4 Qua'), (005, 'Arq Comp', 'Marise', '5 Qui'), (006, 'T.I.', 'Alex', '6 Sex');

select * from materias;
select * from materias where materia like "%a%";
select * from materias where dia_da_semana like '%ter%';
select * from materias order by professor_a;
