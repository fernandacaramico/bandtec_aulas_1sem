create database Atleta;
use Atleta;
create table Atletas (
	idAtleta int PRIMARY KEY,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int
);
rename table Atletas to Atleta;
insert into Atleta values (001, "Michael Phelps", "Natação", 28);
insert into Atleta values (002, "Larissa Latynina", "Ginástica Artística", 18);
insert into Atleta values (003, "Paavo Nurmi", "Atletismo", 12);
insert into Atleta values (004, "Mark Spitz", "Natação", 11);
insert into Atleta values (005, "Carl Lewis", "Atletismo", 10);
select * from Atleta;
select nome, qtdMedalha from Atleta;
select * from Atleta where modalidade = "Atletismo";
select * from Atleta order by qtdMedalha desc;
select * from Atleta where nome like "%s%";
select * from Atleta where nome like "m%";
select * from Atleta where nome like "%o";
select * from Atleta where nome like "%r_";
update Atleta set qtdMedalha = 30 where idAtleta = 001;
select * from Atleta;
update Atleta set modalidade = "Natação" where idAtleta = 3;