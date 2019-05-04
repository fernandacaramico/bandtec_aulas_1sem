create database Aula11;
use Aula11;
create table engenheiro (
idEngenheiro int primary key auto_increment,
CREA int,
nome varchar(45),
sexo enum('m', 'f')
);
create table dependentes (
fkEngenheiro int,
idDepend int,
nome varchar(45),
dataNasc date,
parentesco varchar(45),
primary key (fkEngenheiro, idDepend),
foreign key (fkEngenheiro) references engenheiro (idEngenheiro)
);
create table obra (
idObra int primary key auto_increment,
nome varchar(45),
localObra varchar(45)
) auto_increment = 1000;
create table trabalha (
fkEngenheiro int,
foreign key (fkEngenheiro) references engenheiro(idEngenheiro),
fkObra int,
foreign key (fkObra) references obra(idObra),
horas int
);


insert into engenheiro values 
(null, 526353, 'Marcos Marcondes', 'm'),
(null, 764441, 'Anna Antunes', 'f'),
(null, 726542, 'Ricardo Richard', 'm'),
(null, 442514, 'Natália Neves', 'f');
select * from engenheiro;
insert into dependentes values
(2, 1, 'Maria Joaquina Antunes', '2003-10-10', 'filha'),
(2, 2, 'Giuliana Antunes', '1950-03-17', 'mãe'),
(3, 1, 'Pedro Henrique Richard', '2000-09-29', 'filho'),
(3, 2, 'Tiffany Richard', '1977-09-08', 'esposa'),
(3, 3, 'Reinaldo Richard', '1980-06-15', 'irmão'),
(4, 1, 'Juliana Neves', '1973-11-14', 'esposa');
select * from dependentes;
alter table engenheiro add column salario int;
update engenheiro set salario = '3500' where idEngenheiro in (2, 3);
update engenheiro set salario = '4000' where idEngenheiro in (1, 4);

insert into obra values 
(null, 'Hospital América', 'Jardins'),
(null, 'Shopping Alfa', 'Itaim'),
(null, 'Condomínio Profiteroles', 'Anália Franco');

select * from obra;

insert into trabalha values 
(1, 1001, 32),
(2, 1002, 40),
(3, 1001, 38),
(4, 1000, 38);

select * from engenheiro, dependentes where idEngenheiro = fkEngenheiro;
select e.nome, e.sexo, e.salario, d.nome, d.dataNasc, d.parentesco from engenheiro as e, dependentes as d where idEngenheiro = fkEngenheiro;

select * from engenheiro, trabalha, obra where idEngenheiro = trabalha.fkEngenheiro and fkobra = idobra;
select crea, e.nome as 'nome do engenheiro', sexo, salario, horas, o.nome as 'nome da obra', localObra as 'local da obra' from engenheiro as e, trabalha, obra as o where idEngenheiro = trabalha.fkEngenheiro and fkObra = idObra order by e.nome;

-- a Os dados de cada tabela separadamente
select * from dependentes;
select * from engenheiro;
select * from obra;
select * from trabalha;

-- b Os dados de cada engenheiro e de seus respectivos dependentes
select * from engenheiro, dependentes where idEngenheiro = fkEngenheiro;
select crea, e.nome as 'Nome do Engenheiro', sexo, salario, d.nome as 'Nome do dependente', dataNasc as 'Data de Nascimento do Dependente', parentesco as 'Parentesco  do dependente com o engenheiro' from engenheiro as e, dependentes as d where idEngenheiro = fkEngenheiro;

-- c Os dados somente de um engenheiro e dos seus dependentes
select * from engenheiro as e, dependentes where idEngenheiro = fkEngenheiro and e.nome = 'Ricardo Richard';
select crea, e.nome as 'Nome do Engenheiro', sexo, salario, d.nome as 'Nome do dependente', dataNasc as 'Data de Nascimento do Dependente', parentesco as 'Parentesco  do dependente com o engenheiro' from engenheiro as e, dependentes as d where idEngenheiro = fkEngenheiro and e.nome = 'Ricardo Richard';

-- d Os dados dos engenheiros e os dados dos respectivos filhos
select * from engenheiro, dependentes where idEngenheiro = fkEngenheiro and parentesco like 'filh%';
select crea, e.nome as 'Nome do Engenheiro', sexo, salario, d.nome as 'Nome do dependente', dataNasc as 'Data de Nascimento do Dependente', parentesco as 'Parentesco  do dependente com o engenheiro' from engenheiro as e, dependentes as d where idEngenheiro = fkEngenheiro and parentesco like 'filh_';

-- e os dados de cada engenheiro e de cada obra em que estão alocados, assim como a quantidade de horas que cada engenheiro está alocado em cada obra
select * from engenheiro, trabalha, obra where idEngenheiro = fkEngenheiro and idObra = fkObra;
select crea, e.nome, sexo, salario, horas, o.nome, localobra from engenheiro as e, trabalha, obra as o where idEngenheiro = fkEngenheiro and idObra = fkObra;

-- f os dados de uma determinada obra e os dados dos engenheiros que estão alocados nessa obra, e a quantidade de horas que ccada engenheiro está alocado nessa obra
select * from engenheiro, trabalha, obra as o where idEngenheiro = fkEngenheiro and idObra = fkObra and o.nome = 'Shopping Alfa';
select crea, e.nome, sexo, salario, horas, o.nome, localobra from engenheiro as e, trabalha, obra as o where idEngenheiro = fkEngenheiro and idObra = fkObra and o.nome = 'Shopping Alfa';

-- g os dados dos engenheiros, dos respectivos dependentes, e das obras em que trabalham, e a quantidade de horas que trabalham em cada obra
select * from engenheiro, dependentes as d, trabalha as t, obra where idEngenheiro = d.fkEngenheiro and t.fkEngenheiro = idEngenheiro and t.fkobra = idObra;
select d.nome, dataNasc as 'data de nascimento', parentesco, crea, e.nome, sexo, e.salario, horas, o.nome, localObra as 'local da obra' from engenheiro as e, dependentes as d, trabalha as t, obra as o where idEngenheiro = d.fkEngenheiro and t.fkEngenheiro = e.idengenheiro and fkobra = idobra;


-- h os dados e um determinado engenheiro, seus dependentes e das obras em que trabalha e a quantidade de horas que trabalha em cada obra
select * from engenheiro as e, dependentes as d, trabalha as t, obra where idEngenheiro = d.fkEngenheiro and t.fkEngenheiro = idEngenheiro and t.fkobra = idObra and e.nome = 'Anna Antunes';
select d.nome, dataNasc as 'data de nascimento', parentesco, crea, e.nome, sexo, e.salario, horas, o.nome, localObra as 'local da obra' from engenheiro as e, dependentes as d, trabalha as t, obra as o where idEngenheiro = d.fkEngenheiro and t.fkEngenheiro = e.idengenheiro and fkobra = idobra and e.nome = 'Anna Antunes';

-- i os dados de uma determinada obra, dos engenheiros que trabalham nessa obra, a quantidd de horas que eles trabalham nessa obras e seus respectivos dependentes
select * from engenheiro as e, dependentes as d, trabalha as t, obra as o where idEngenheiro = d.fkEngenheiro and t.fkEngenheiro = idEngenheiro and t.fkobra = idObra and o.nome like 'shopping %';
select d.nome, dataNasc as 'data de nascimento', parentesco, crea, e.nome, sexo, e.salario, horas, o.nome, localObra as 'local da obra' from engenheiro as e, dependentes as d, trabalha as t, obra as o where idEngenheiro = d.fkEngenheiro and t.fkEngenheiro = e.idengenheiro and fkobra = idobra and o.nome like 'shopping %';

-- j a soma dos salários dos engenheiros
select sum(salario) from engenheiro;

-- k a média dos salários dos engenheiros
select avg(salario) from engenheiro;

-- l o menor salário e o maior salário
select min(salario) as 'Menor Salário', max(salario) as 'Maior Salário' from engenheiro;

-- m semente os salário distintos dos engenheiros
select distinct(salario) from engenheiro;

-- n a quantidade de salarios distintos dos engenheiros
select count(distinct salario) from engenheiro;

 Os dados de cada engenheiro e de cada obra em que estão alocados, assim como a quantidade de horas que cada engenheiro está alocado em cada obra
-- f os