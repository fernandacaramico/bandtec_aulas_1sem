create database ExercicioAula12;
use ExercicioAula12;

create table departamento (
idDepto int primary key, 
nomeDepto varchar(45),
idGerente int,
dataInicioGer date
);

create table funcionario (
idFunc int primary key,
nomeFunc varchar(30),
salario decimal(6,2),
sexo enum('m', 'f'),
idSupervisor int,
dataNasc date,
fkDepto int
);

create table projeto (
idProj int primary key, 
nomeProj varchar(30),
localProj varchar(30),
fkDepto int
);

create table FuncProj (
fkFunc int,
fkProj int,
horas decimal(3,1),
foreign key (fkFunc) references funcionario(idFunc),
foreign key (fkProj) references projeto(idProj),
primary key (fkFunc, fkProj)
);

alter table departamento add foreign key (idGerente) references funcionario(idFunc);
alter table funcionario add foreign key (fkDepto) references departamento(idDepto);
alter table projeto add foreign key (fkDepto) references departamento(idDepto);

insert into departamento (idDepto, nomeDepto, dataInicioGer) values 
(105, 'Pesquisa', '2008-05-22'), 
(104, 'Administração', '2015-01-01'),
(101, 'Matriz', '2001-06-19');

insert into funcionario (idFunc, nomeFunc, salario, sexo, dataNasc, fkDepto) values
(1, 'Joao Silva', 3500, 'm', '1985-01-09', 105);


insert into funcionario (idFunc, nomeFunc, salario, sexo, dataNasc, fkDepto) values
(2, 'Fernando Wong', 4500, 'm', '1975-12-08', 105),
(3, 'Alice Sousa', 2500, 'f', '1988-01-19', 104),
(4, 'Janice Morais', 4300, 'f', '1970-06-20', 104),
(5, 'Ronaldo Lima', 3800, 'm', '1982-09-15', 105),
(6, 'Joice Leite', 2500, 'f', '1992-07-31', 105),
(7, 'Antonio Pereira', 2500, 'm', '1989-03-29', 104),
(8, 'Juliano Brito', 5500, 'm', '1957-11-10', 101);

update departamento set idGerente = 2 where idDepto = 105;
update departamento set idGerente = 7 where idDepto = 104;
update departamento set idGerente = 8 where idDepto = 101;

select * from departamento;
select * from departamento, funcionario where idgerente = idfunc;

alter table funcionario add foreign key (idSupervisor) references funcionario(idFunc);

update funcionario set idSupervisor = 2 where idFunc = 1;
update funcionario set idSupervisor = 8 where idFunc = 2;
update funcionario set idSupervisor = 7 where idFunc = 3;
update funcionario set idSupervisor = 8 where idFunc = 4;
update funcionario set idSupervisor = 1 where idFunc = 5;
update funcionario set idSupervisor = 1 where idFunc = 6;
update funcionario set idSupervisor = 4 where idFunc = 7;

select * from funcionario;

insert into projeto values 
(1, 'Produto X', 'Santo André', 105),
(2, 'Produto Y', 'Itu', 105),
(3, 'Produto Z', 'São Paulo', 105),
(10, 'Informatização', 'Mauá', 104),
(20, 'Reorganização', 'São Paulo', 101),
(30, 'Benefícios', 'Mauá', 104);

select * from projeto;

insert into funcproj values 
(1, 1, 32.5);
insert into funcproj values
(1, 2, 7.5),
(5, 3, 40),
(6, 1, 20),
(6, 2, 20),
(2, 2, 10),
(2, 3, 10),
(2, 10, 10),
(2, 20, 10),
(3, 30, 30),
(3, 10, 10),
(7, 10, 35),
(7, 30, 5),
(4, 30, 20),
(4, 20, 15),
(8, 20, null);

select * from funcproj;

-- selecionando todas as tabelas separadamente
select * from departamento;
select * from funcionario;
select * from funcproj;
select * from projeto;

-- inserindo a funcionaria Cecilia Ribeiro
-- idFunc: null / não será possível inserir a funcionaria com idFunc null, pois não estamos usando auto_increment
-- o idSuperv pode estar null, mas o idFunc não, pois é a chave primaria na tabela, e nao podemos inserir instãncias sem um atributo identificador
insert into funcionario values (null, 'Cecília Ribeiro', 2800, 'f', null, '1980-04-05', 104);
-- NÃO FUNCIONOU

-- inserindo a funcionaria Alice sousa com salario 2800 no sistema
-- essa funcionaria, com esse id não pode ser INSERIDO no banco, mas podemos alterar a funcionaria já existente, pois o id de número 3 já está tomado
insert into funcionario values (3, 'Alice Sousa', 2800, 'f', 4, '1980-04-05', 104);
-- NÃO FUNCIONOU

-- inserindo a funcionaria Cecilia Ribeiro com depto 107
-- não será possível pois o departamento que tentamos inserir como fk não existe no sistema, apenas 105, 104 e 101
insert into funcionario values (9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 107);
-- NÃO FUNCIONOU

-- inserindo funcionaria Cecília Ribeiro
-- como o número do departamento foi corrigido, foi possível
insert into funcionario values (9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 104);
-- FUNCIONOU

-- excluindo a tupla da tabela FuncProj
delete from funcproj where fkfunc = 3 and fkproj = 10;
-- funcionou, pois existia uma tupla com ambas colunas na tabela. as duas colunas (fkfunc e fkproj) compoem a primary key da tabela, que é preciso ser informada ao apagar-se uma tupla. como informamos a primary key completa, composta, o comando funcionou.

-- excluindo tupla da tabela funcionario que está referenciada na tabela funcionario (relacionamento recursivo / auto relacionamento)
delete from funcionario where idFunc = 4;
-- não funcionou pois esta ocorrência está sendo referenciada em outra ocorrencia, i.e. idfunc 4 é também idsupervisor na tabela funcionario, não podendo assim ser excluida. se quisermos excluir a ocorrencia idfunc 4 da tabela devemos remover toda referencia feira a essa ocorrencia em todas as tabelas que possa vir a referencia-la

-- excluindo tupla da tabela funcionario que está referenciada na tabela departamento
delete from funcionario where idFunc = 2;
-- pelo mesmo motivo que o comando anterior não funcionou (a ocorrencia que tentamos excluir estava sendo referenciada em um relacionamento), não conseguimos excluir a ocorrencia idfunc 2, pois esta está na tabela departamento populado a coluna 'idGerente'alter

-- alterando salario
update funcionario set salario = 2800 where idfunc = 3;
-- funcionou, pois estamos alterando uma ocorrencia referenciando a sua primary key para encontrá-la em nosso banco de dados.

-- alterando fk em uma ocorrencia
update funcionario set fkdepto = 101 where idfunc = 3;
-- assim como o comando anterior, funcionou, pois estamos alterando uma ocorrencia referenciando a sua primary key para encontrá-la em nosso banco de dados.

-- alterando fk em uma ocorrencia 
update funcionario set fkdepto = 107 where idfunc = 3;
-- nao funcionou, pois este valor que tentamos colocar como valor no campo um valor de fk que não referencia a nada, pois fkdepto 107 não existe

-- exibir a data de nasc e o salario do funcionario joao silva
select dataNasc, salario from funcionario where nomeFunc = 'joao silva';

-- exibir uma lista apenas dos salarios de todos os funcionarios
select salario from funcionario;

-- exibir uma lista apenas dos salarios distintos de todos os funcionarios
select distinct(salario) from funcionario;

-- exibir os dados dos funcionarios ordenados pelo nome
select * from funcionario order by nomefunc;

-- exibir os dados dos funcionarios ordenados pelo salario, de forma decrescente
select * from funcionario order by salario desc;

-- exibir os dados dos funcionarios que tenham o salario entre 2000 e 4000
select * from funcionario where salario between 2000 and 4000;

-- exibir os nomes e os salarios dos funcionarios cujos nomes comecam com a letra j
select * from funcionario where nomeFunc like 'j%';

-- exibir os nomes e os salarios dos funcionarios cujos nomes terminam com a letra a
select nomefunc, salario from funcionario where nomefunc like '%a';

-- exibir os nomes dos funcionarios que tem a letra 'n' como terceira letra do nome
select nomefunc from funcionario where nomefunc like '__n%';

-- exibir os nomes e as datas de nascimento dos funcionarios cujos nomes tenham a letra s como a 5a letra de tras para frente
select nomefunc, datanasc from funcionario where nomefunc like '%s____';

-- exibir os dados dos funcionarios quw trabalham no depto pesquisa
select * from departamento;
select * from funcionario where fkdepto = 105;
select f.*, nomedepto from funcionario as f, departamento where fkdepto = iddepto and fkdepto = 105; -- checando se 105 é mesmo pesquisa

-- exibir os dados dos funcs que trabalham no depto pesquisa e tenham salario acima de 3500
select * from funcionario where fkdepto = 105 and salario > 3500;
select f.*, nomedepto from funcionario as f, departamento where fkdepto = iddepto and fkdepto = 105 and salario > 3500; -- checando se 105 é mesmo pesquisa

-- exibir os dados dos funcs que trabalham no depto pesquisa e tenham o nome com inicial j
select * from funcionario where fkdepto = 105 and nomefunc like 'j%';
select f.*, nomedepto from funcionario as f, departamento where fkdepto = iddepto and fkdepto = 105 and nomefunc like 'j%'; -- checando se 105 é mesmo pesquisa

-- exibir o idfunc e o nome de cada func, juntamente com o idfunc e o nome do supervisor. faça com que o titulo da coluna seja idfunc para uncionario e idsupervisor para o id do supervisor
select * from funcionario as a, funcionario as b where a.idsupervisor = b.idfunc;
select a.idfunc as idFuncionario, a.nomefunc, b.idfunc as idSupervisor, b.nomefunc from funcionario as a, funcionario as b where a.idsupervisor = b.idfunc; 
select a.idfunc as idFuncionario, a.nomefunc, a.idsupervisor, b.idfunc as idSupervisor, b.nomefunc, b.idsupervisor from funcionario as a, funcionario as b where a.idsupervisor = b.idfunc; -- checando se supervisor está correto

-- exibir para cada projeto localizado em sp o id, num do departamento que o controla, nome e data de nasc do gerente
select * from projeto as p, departamento as d, funcionario as f where p.fkdepto = d.iddepto and d.idgerente = f.idfunc and localproj = 'são paulo'; -- selecionando todas as colunas antes de filtrar quais queremos
select p.idproj, d.iddepto, f.nomefunc, f.datanasc from projeto as p, departamento as d, funcionario as f where p.fkdepto = d.iddepto and d.idgerente = f.idfunc and localproj = 'são paulo'; -- filtrando colunas desejadas

-- exibir o idfunc e o nome do funcionario, o projeto e o nome do projeto em que trabalha, a qtd de horas que trabalha nesse projeto
select f.idfunc, f.nomefunc, p.idproj, p.nomeproj, z.horas from funcionario as f, projeto as p, funcproj as z where f.idfunc = z.fkfunc and p.idproj = z.fkproj;

-- exibir os nomes dos funcs que nasceram antes de 1980
select nomefunc, datanasc from funcionario where datanasc < '1980'

-- aplique um reajuste de 10% nos salarios dos funcionarios que trabalham no dept pesquisa

-- exibir a qtd de salaruios diferentes q existem na empresa

-- exibir a qtd de locais deferentes de projeto

-- exibir o salario medio da empresa e a soma dos salarios

-- exibir o menor e o maior salario da empresa

-- exibir o iddepto, o salario merio e a soma do salario de cada departamento (agrupado por depto)

-- exibir o iddepto, o menor e o maior salario de cada departamento (agrupado por departamento)

