-- criar um banco de dados chamado PraticaJogador
create database PraticaJogador;

-- selecionar esse banco de dados
use PraticaJogador;

-- criar as tabelas correspondentes à modelagem
create table Jogador (
	idJogador int primary key auto_increment,
    nome varchar(40),
    posicao varchar(15),
    telefone char(10),
    fkTime int,
    conselheiro int
) auto_increment = 101;

create table timeJogador (
	idTime int primary key auto_increment,
    nome varchar(20),
    nomeTecnico varchar(30),
    dataFormacao date
);

-- inserir dados nas tabelas, de forma que exista mais de uma posição de atuação diferente, e que exista algum time com mais de um jogador cadastrado
insert into jogador (idJogador, nome, posicao, telefone) values
(null, 'Falcão', 'prim volante', '99875-6543'),
(null, 'Roberto Carlos', 'lat esquerdo', '3648-9765'),
(null, 'Cafu', 'lat direito', '69876-0201'),
(null, 'Sérgio Ramos', 'zagueiro', '97534-9787'),
(null, 'Canavarro', 'quarto zag', '6524-0987'),
(null, 'Ceni', 'goleiro', '7365-9191'),
(null, 'Romário', 'centro-avante', '91762-9197'),
(null, 'Modric', 'seg volante', '97465-9181'),
(null, 'Zidane', 'meia', '84756-9272'),
(null, 'Beckham', 'meia esq', '97533-9876'),
(null, 'Cristiano Ronaldo', 'atacante', '98644-8117'),

(null, 'Buffon', 'goleiro', '98765-8171'),
(null, 'Daniel Alves', 'lat direito', '99876-9228'),
(null, 'Pepe', 'zagueiro cent', '96132-9603'),
(null, 'Materazzi', 'quarto zag', '98711-0544'),
(null, 'Marcelo', 'lat esquerdo', '98755-0101'),
(null, 'Dunga', 'prim volante', '98764-0000'),
(null, 'Pogiba', 'seg volante', '98241-7552'),
(null, 'Roberto Baggio', 'meia esq', '98744-3323'),
(null, 'Garrincha', 'ponta dir', '98766-0111'), 
(null, 'Pelé', 'centro avante', '98766-0011'),
(null, 'Robben', 'ponta esq', '98651-1651');

update jogador set conselheiro = 109 where idJogador in (101, 102, 103, 104, 105, 106, 107, 108, 110, 111);
update jogador set conselheiro = 106 where idJogador = 109;
update jogador set fkTime = 1 where idJogador in (101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111);

update jogador set conselheiro = 112 where idJogador in (113, 114, 115, 116, 117, 118, 119, 120, 121, 122);
update jogador set conselheiro = 119 where idJogador = 112;
update jogador set fkTime = 2 where idJogador in (112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122);

insert into timeJogador values 
(null, 'Real Masters', 'Cruyff', '1896-04-21'),
(null, 'The Devil Horses', 'Mourinho', '1936-06-06');

-- exibir todos os dados de cada tabela criada, separadamente
select * from jogador;
select * from timeJogador;

-- fazer os acertos da chave estrangeira, caso não tenha feito no moemento da criação
alter table jogador add foreign key(fkTime) references timeJogador(idTime);
alter table jogador add foreign key(conselheiro) references jogador(idJogador);

-- exibir apenas os nomes dos times e dos tecnicos de todos os times cujo nome comeca com uma determinada letra
select nome, nomeTecnico from timeJogador where nome like 'r%';

-- exibir todos os dados dos jogadores em ordem decrescente pela posicao
select * from jogador order by posicao desc;

-- exibir os dados dos jogadores que jogam em uma determinada posicao
select * from jogador where posicao = 'goleiro';

-- exibir os dados dos times em que o tecnico tenha a 2a letra de tras para frente igual a determinada letra
select * from timeJogador where nomeTecnico like '%f_';

-- exibir os dados dos times em ordem crescente pelo nome do tecnico
select * from timeJogador order by nomeTecnico;

-- alterar a posicao de algum jogador
update jogador set posicao = 'meia' where idJogador = 101;
select * from jogador;

-- exibir os dados dos times e de seus respectivos jogadores
select * from jogador as j, timeJogador as t where fktime = idtime;

-- exibir os dados de um determinado time (informar o nome do time na consulta) e dos seus respectivos jogadores
select * from jogador as j, timejogador as t where fktime = idtime and t.nome = 'Real Masters';

-- exibir os dados dos jogadores e dados dos seus respectivos conselheiros
select * from jogador as j, jogador as k where j.conselheiro = k.idjogador;

select j.nome, j.posicao, k.nome, k.posicao 
from jogador as j, jogador as k 
where j.conselheiro = k.idjogador;

-- exibir os dados dos jogadores, dados dos respectivos conselheiros e os dados de seus times
select * from jogador as j, jogador as k, timejogador as t where j.conselheiro = k.idjogador and j.fktime = t.idtime;

select j.nome, j.posicao, k.nome, k.posicao, t.nome, t.nometecnico 
from jogador as j, jogador as k, timejogador as t 
where j.conselheiro = k.idjogador and j.fktime = t.idtime;

-- exibir os dados de um jogador (informar o nome do jogador), os dados do seu conselheiro e do seu time
select j.nome, j.posicao, k.nome, k.posicao, t.nome, t.nometecnico 
from jogador as j, jogador as k, timejogador as t 
where j.conselheiro = k.idjogador and j.fktime = t.idtime and j.nome = 'Cafu';

-- excluir algum jogador
-- //delete from jogador where idjogador = 111;
-- //excluir as tabelas
-- drop table jogador;
-- //drop table timejogador;