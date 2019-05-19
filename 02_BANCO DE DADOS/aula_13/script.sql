create database aula13;

-- 1. Criar as tabelas no MySQL e executar as instrucoes relacionados a seguir
create table aluno (
ra int primary key, 
nome varchar(45),
email varchar(45),
fkGrupo int
);

create table grupo (
idGrupo int primary key auto_increment,
nome varchar(45),
descricao varchar(45)
) auto_increment = 1;

create table professor (
idProf int primary key auto_increment,
nome varchar(45),
disciplina varchar(45)
) auto_increment = 10000;

create table BancaGrupoProf (
fkGrupo int,
fkProf int,
foreign key (fkGrupo) references grupo (idGrupo),
foreign key (fkProf) references professor (idProf),
primary key (fkGrupo, fkProf),
data_e_hora datetime,
nota decimal(3,2)
);

-- 2. Insira dados nas tabelas, de forma que tenha pelo menos 2 grupos cadastrados. Após inserir dados nas tabelas:
insert into aluno (ra, nome, email) values
(1191000, 'Ana Beatriz', 'ana@beatriz.com'),
(1191062, 'Geovanna', 'geo@vanna.com'),
(1191765, 'Marcos', 'marcos@paulo.com'),
(1191754, 'Guilherme', 'gui@pardo.com'),
(1191622, 'Renan', 'renan@renan.com'),
(1191442, 'Fernanda', 'fernanda@nanda.com');

insert into professor values
(null, 'Yoshi', 'Algoritmos'),
(null, 'Célia', 'BD'),
(null, 'Brandão', 'PI'),
(null, 'Marise', 'Arq Comp'),
(null, 'Alex', 'TI');

insert into grupo values
(null, 'I loveIoTurism', 'Projeto de IoT para turismo'),
(null, 'SmartLibrary', 'Projeto de IoT para Biblioteca'),
(null, 'iFridge', 'Projeto de IoT para geladeiras');

select * from aluno;
update aluno set fkGrupo = 2 where ra in (1191442, 1191000);
update aluno set fkGrupo = 1 where ra in (1191062, 1191622);
update aluno set fkGrupo = 3 where ra in (1191754, 1191765);

alter table banca modify nota decimal (3,1);
rename table bancagrupoprof to banca;
insert into banca values
(1, 10001, '2019-06-04 12:00', 8);
insert into banca values
(1, 10002, '2019-06-04 12:10', 9),
(2, 10003, '2019-06-04 12:20', 7),
(2, 10000, '2019-06-04 12:20', 10),
(3, 10004, '2019-06-04 12:10', 8.5),
(3, 10002, '2019-06-04 12:30', 6.5),
(1, 10004, '2019-06-04 12:40', 8.5),
(2, 10001, '2019-06-04 12:45', 10),
(3, 10003, '2019-06-04 12:30', 7); 
-- 3. Exibir todos os dados de cada tabela criada, separadamente.
select * from aluno;
select * from professor;
select * from grupo;
select * from banca;

-- 4. Se for necessário, fazer os acertos das chaves estrangeiras
alter table aluno add foreign key (fkGrupo) references grupo (idGrupo);

-- 5. Exibir os dados dos grupos e os dados de seus respectivos alunos
select * from grupo join aluno on idgrupo = fkgrupo;

-- 6. Exibir os dados de um determinado grupo e os dados de seus respectivos alunos.
select * from aluno join grupo as g on idgrupo = fkgrupo where g.nome = 'ifridge';

-- 7. Exibir a média das notas atribuídas aos grupos, no geral.
select avg(nota) from banca;
select round(avg(nota), 1) from banca;

-- 8. Exibir a nota mínima e a nota máxima que foi atribuída aos grupos, no geral.
select min(nota) as 'Menor Nota', max(nota) as 'Maior nota' from banca;

-- 9. Exibir a soma das notas dadas aos grupos, no geral.
select sum(nota) from banca;

-- 10. Exibir os dados dos professores que avaliaram cada grupo, os dados dos grupos, a data e o horário da banca
select * from professor join banca on idprof = fkprof join grupo on fkgrupo = idgrupo;
select p.nome, disciplina, data_e_hora, nota, g.nome, descricao from professor as p join banca on idprof = fkprof join grupo as g on fkgrupo = idgrupo;

-- 11. Exibir os dados dos professores que avaliaram um determinado grupo, os dados do grupom a data e o horário da banca
select * from professor join banca on idprof = fkprof join grupo as g on fkgrupo = idgrupo where g.nome = 'smartLibrary';
select p.nome, disciplina, data_e_hora, nota, g.nome, descricao from professor as p join banca on idprof = fkprof join grupo as g on fkgrupo = idgrupo where g.nome = 'smartLibrary';

-- 12. Exibir os nomes dos grupos que foram avaliados por um determinado professor.
select p.nome, g.nome from professor as p join banca on fkprof = idprof join grupo as g on idgrupo = fkgrupo where p.nome = 'Célia';

-- 13. Exibir os nomes dos alunos que foram avaliados por um determinado professor
select p.nome, a.nome, g.nome from professor as p join banca as b on fkprof = idprof join grupo as g on idgrupo = b.fkgrupo join aluno as a on a.fkgrupo = idgrupo where p.nome = 'Célia';

-- 14. Exibir os nomes dos professores que avaliaram um determinado aluno
select p.nome, a.nome from professor as p join banca as b on fkprof = idprof join grupo as g on idgrupo = b.fkgrupo join aluno as a on a.fkgrupo = idgrupo where a.nome = 'Fernanda';

-- 15. Exibir os dados dos grupos, os dados dos alunos correspondentes, os dados dos professores que avaliaram, a data e o horário da banca
select g.nome, descricao, ra, a.nome, email, p.nome, disciplina, data_e_hora from professor as p join banca as b on fkprof = idprof join grupo as g on idgrupo = b.fkgrupo join aluno as a on a.fkgrupo = idgrupo;

-- 16. Exibir a quantidade de notas distintas
select count(distinct(nota)) from banca;

-- 17. Exibir a identificacao do professor, a media das notas e a soma das notas atribuídas, agrupadas por professor
select idprof, round(avg(nota),2) as 'Média de nota', sum(nota) as 'Soma das notas' from professor join banca on fkprof = idprof group by idprof;

-- 18 Exibir a identificação do grupo, a média das notas e a soma das notas atribuídas, agrupadas por grupo
select idgrupo, round(avg(nota),2) as 'Média', sum(nota) as 'Soma das notas' from grupo join banca on fkgrupo = idgrupo group by idgrupo;

-- 19. Exibir a identificacao do professor, a menor nota e a maior nota atribuída, agrupada por professor
select idprof, min(nota), max(nota) from banca join professor on idprof = fkprof group by idprof; 

-- 20. Exibir a identificacao do grupo, a menor nota e a maior nota atribuída, agrupada por grupo
select idgrupo, min(nota), max(nota) from banca join grupo on idgrupo = fkgrupo group by idgrupo;