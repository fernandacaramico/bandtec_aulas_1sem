use adsb;
create table jogos (
	codigo int primary key,
    nome varchar(100),
    NumeroJogadores int,
    nivel varchar(100)
);
select * from jogos;
insert into jogos values (001, "quebra-cabecas", 4, "facil");
insert into jogos values (002, "banco imobiliario", 8, "medio");
insert into jogos values (003, "batalha naval", 2, "medio");
insert into jogos values (004, "senha", 2, "dificil");
insert into jogos values (006, "palavras cruzadas", 6, "facil");
insert into jogos values (005, "coup", 5, "dificil");
select * from jogos;
select * from jogos order by nivel;
select * from jogos order by NumeroJogadores;
