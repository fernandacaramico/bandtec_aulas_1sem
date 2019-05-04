create database adsb;
use adsb;
create table aluno (
  ra int primary key,
  nome varchar(30),
  bairro varchar(30)
);
select * from aluno;
-- insere os dados de vários alunos
insert into aluno values (01191073, 'fernanda', 'pq jaçatuba');
insert into aluno (nome, bairro, ra) values ('mariana', 'stella maris', 01171268);
insert into aluno values (01191911, 'william', 'pq jacatuba');
select * from aluno;
insert into aluno values (01191066, 'marcos', 'peruibe'),
  (01188965, 'nonna', 'tatuapé');
select nome from aluno;
select ra, bairro from aluno;
-- selecionar apenas infos sobre ra 01191073
select * from aluno where ra = 01191073;
select nome from aluno where ra = 01191073;
select * from aluno where bairro = 'stella maris';
insert into aluno values (01119044, 'mica', 'stella maris');
select * from aluno where bairro = 'stella maris';
select * from aluno where ra > 01191001;
select * from aluno where nome = 'm%';
select * from aluno order by nome;
select * from aluno order by nome desc;
select * from aluno;
select * from aluno where nome like 'm%';
select * from aluno where bairro like 's%';
select * from aluno where nome like '%a';
select nome, bairro from aluno where nome like '%r%' order by nome;
-- exibir dados dos alunos onde letra e como segunda letra
select * from aluno where nome like '_e%';
select * from aluno where bairro like '%b_';
-- atualizar 
update aluno set nome = 'meu amor' where ra = 01191911;
select * from aluno;
select * from aluno where nome <> 'mica';
select * from aluno;
update aluno set bairro = 'stella maris', nome = 'maia' where ra = 1119044;
select * from aluno;
update aluno set ra = 1119045 where ra = 1119044;
select * from aluno;
