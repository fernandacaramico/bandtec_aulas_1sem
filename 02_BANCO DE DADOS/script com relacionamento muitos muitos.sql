create database AlunoDisciplina;
use AlunoDisciplina;

create table Aluno (
	ra int primary key auto_increment,
    nomeAluno varchar(45),
    bairro varchar(45)
) auto_increment = 54000;

create table Disciplina (
	idDisc int primary key auto_increment,
    nomeDisc varchar(45)
) auto_increment = 100;

create table Aluno_Cursa_Disciplina (
	fkRa int,
    fkDisc int,
    notas decimal(4,2),
    presenca int,
    foreign key (fkRa) references aluno(ra),
    foreign key (fkDisc) references disciplina(idDisc),
    primary key (fkRa, fkDisc)
);
alter table aluno_cursa_disciplina change presenca faltas int;
desc aluno_cursa_disciplina;
alter table aluno_cursa_disciplina rename cursa;
desc cursa;

insert into aluno values 
(null, 'Maria Teixeira', 'Vila Mariana'),
(null, 'José Oliveira', 'Vila Prudente'),
(null, 'Kátia da Silva', 'Cambuci'),
(null, 'Mário Souza', 'Pinheiros');

insert into disciplina values 
(null, 'Banco de Dados'),
(null, 'Algoritmos'),
(null, 'Arquitetura Computacional'),
(null, 'Projeto e Inovação');

select * from aluno;
select * from disciplina;

insert into cursa values 
(54000, 100, 8.5, 0),
(54000, 101, 9, 2),
(54000, 102, 7.5, 4),
(54000, 103, 8, 4),
(54001, 100, 8.5, 0),
(54001, 101, 10, 2),
(54001, 102, 9, 1),
(54001, 103, 8, 2),
(54002, 100, 6, 1),
(54002, 101, 10, 1),
(54002, 102, 7, 3),
(54002, 103, 9, 5),
(54003, 100, 8, 1),
(54003, 101, 10, 3),
(54003, 102, 6, 2),
(54003, 103, 9, 2);

select * from cursa;

select * from cursa as c, aluno as a, disciplina as d where ra = fkra and fkdisc = iddisc;
select ra, nomealuno, notas, faltas, nomedisc from cursa, aluno, disciplina where ra = fkra and fkdisc = iddisc;
select ra, nomealuno, notas, faltas, nomedisc from cursa, aluno, disciplina where ra = fkra and fkdisc = iddisc and nomealuno like 'm%';
select ra, nomealuno, notas, faltas, nomedisc from cursa, aluno, disciplina where ra = fkra and fkdisc = iddisc and nomedisc = 'banco de dados';

select * from cursa;
select sum(notas), sum(faltas) from cursa;
select avg(notas) as 'Média das notas', avg(faltas) as 'Média das Faltas' from cursa;
select min(notas) as 'Menor nota', max(faltas) as 'Maior falta' from cursa;
select min(notas) as 'Menor nota', nomealuno as 'Pior Aluno', max(notas) as 'Maior nota', nomealuno as 'Melhor Aluno' from cursa, aluno where fkra = ra;
select max(notas) as 'Maior nota', nomealuno as 'Melhor Aluno' from cursa, aluno  where fkra = ra;
select min(notas) as 'Menor nota', max(notas) as 'Maior nota', fkdisc, nomedisc as 'Nome da Disciplina' from cursa, disciplina where fkdisc = iddisc group by fkDisc;