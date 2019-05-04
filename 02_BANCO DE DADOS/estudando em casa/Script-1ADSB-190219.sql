
-- Cria o banco de dados (schema) chamado adsb
create database adsb;
-- Seleciona o banco de dados adsb
use adsb;

-- Cria a tabela Aluno, com os campos ra, nome, bairro
-- O campo ra é a chave primária da tabela
-- ra vai conter dados numéricos inteiros
-- nome e bairro conterão dados caracteres
create table Aluno (
  ra int primary key,
  nome varchar(30),
  bairro varchar(20) 
);

-- Exibe todas as colunas (e todas as linhas) da tabela Aluno
select * from Aluno;
-- MySQL não distingue letra maiúscula de letra minúscula
select * from aluno;

-- Insere dados de um aluno na tabela Aluno
insert into Aluno 
  values (01191016,'Marcos Paulo','Vila Primavera');

-- Insere os dados de vários alunos
insert into Aluno values
   (01191026,'Gabriel Domingos','Jd Sta Edwiges'),
   (01191023,'Jennifer Januario','Interlagos'),
   (01191037,'Leonardo Melo','Jd Lenise'),
   (01191059,'Livia Monteiro','Sao Jose'),
   (01191004,'Luis Fernando','Imirim');

-- Seleciona todos as colunas da tabela Aluno
select * from Aluno;

-- Seleciona apenas a coluna nome da tabela Aluno
select nome from Aluno;

-- Seleciona as colunas ra e bairro da tabela Aluno
select ra,bairro from Aluno;

-- Selecionar os dados apenas do aluno de RA = 01191037
-- where é usado para dizer quais linhas quero selecionar
select * from Aluno where ra = 01191037;

-- Selecionar apenas o nome do aluno de RA = 01191037
select nome from Aluno where ra = 01191037; 

-- Selecionar todos os dados dos alunos cujo RA é maior do que 01191020
select * from Aluno where ra > 01191020;

-- Selecionar todos os dados dos alunos cujo RA é maior ou igual a 01191037
select * from Aluno where ra >= 01191037;

-- Selecionar todos os dados da tabela
select * from Aluno;

-- Exibir os dados em ordem alfabética do nome
select * from Aluno order by nome;

-- Exibir os dados em ordem alfabética do bairro
-- A palavra asc indica que é ordem ascendente, mas é opcional
select * from Aluno order by bairro asc; 

-- Exibir os dados em ordem alfabética inversa
select * from Aluno order by nome desc;

-- Exibir os dados dos alunos cujo nome começa com L
select * from Aluno where nome like 'L%';

-- Exibir os dados dos alunos cujo bairro começa com Jd
select * from Aluno where bairro like 'Jd%';

-- Exibir os dados dos alunos cujo nome termina com o
select * from Aluno where nome like '%o';

-- Exibir os dados dos alunos cujo nome termina com lo, 
-- em ordem alfabética do nome
select * from Aluno where nome like '%lo' order by nome;

-- Exibir todos os dados da tabela 
select * from Aluno;

-- Exibir os dados dos alunos cujo nome tenha a letra e
-- como segunda letra
select * from Aluno where nome like '_e%';

-- Exibir os dados dos alunos cujo nome tenha a letra n
-- como terceira letra
select * from Aluno where nome like '__n%';

-- Exibir os dados dos alunos cujo bairro tenha a letra o como a penúltima letra
select * from Aluno where bairro like '%o_';

-- Exibir os dados dos alunos cujo bairro tenha a letra g como a terceira letra de trás pra frente
select * from Aluno where bairro like '%g__';

-- Exibir os dados dos alunos cujo nome tenha a letra d
select * from Aluno where nome like '%d%';

-- Exibir os dados dos alunos cujo RA seja diferente de 01191026
-- O padrão SQL para sinal de diferente é <>
-- MySQL e SQL Server também aceitam != como sinal de diferente
select * from Aluno where ra <> 01191026;
select * from Aluno where ra != 01191026;

-- Alterar o bairro do aluno 01191004 de Imirim para Paraiso
-- Atenção: se executar apenas update Aluno set bairro = 'Paraiso', vai fazer para todas as linhas da tabela
update Aluno set bairro = 'Paraiso' where ra = 01191004;

-- Exibir todos os dados da tabela (para ver a alteração efetuada)
select * from Aluno;

-- Alterar o bairro do aluno 01191037 para Tatuape e o nome para Leonardo Mello
update Aluno set bairro = 'Tatuape',
                 nome = 'Leonardo Mello'
             where ra = 01191037;

-- Alterar o ra do Aluno 01191037 para 01191038
update Aluno set ra = 01191038 where ra = 01191037; 
            
-- Elimina a tabela Aluno
drop table Aluno;