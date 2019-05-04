create database Jornal;
use Jornal;
CREATE TABLE Jornalista (
	idJornalista int primary key auto_increment,
    nome varchar(30),
    dataNasc date,
    telefone char(10)
) auto_increment = 1;

CREATE TABLE Telejornal (
	idTelejornal int primary key auto_increment,
    nome varchar(30),
    horario time,
    regiao varchar(20)
) auto_increment = 100;

INSERT INTO Jornalista values
(null, 'Luciana Torres', '1985-05-10', '98745-0192'),
(null, 'Gabriela Gabbi', '1982-08-30', '97643-0102'),
(null, 'Lucas Limeira', '1973-10-10', '98222-0199'),
(null, 'Matheus Mattos', '1963-12-08', '97563-9921'),
(null, 'Nayara Neves', '1990-05-12', '97465-9872'),
(null, 'Zeiva Zulei', '1960-07-07', '97653-0011');

INSERT INTO Telejornal values 
(null, 'Tevê com você', '10:00', 'Região Nordeste'),
(null, 'Notícias Noticiadas', '19:00', 'Região Sudeste');

select * from Jornalista;
select * from Telejornal;
desc Jornalista;
desc Telejornal;

ALTER TABLE Jornalista ADD COLUMN orientador int;
ALTER TABLE Jornalista ADD COLUMN fkTelejornal int;

ALTER TABLE Jornalista ADD FOREIGN KEY (orientador) REFERENCES Jornalista(idJornalista);
ALTER TABLE Jornalista ADD FOREIGN KEY (fkTelejornal) REFERENCES Telejornal(idTelejornal);

UPDATE Jornalista SET orientador = 1 WHERE idJornalista IN (2, 3);
UPDATE Jornalista SET orientador = 4 WHERE idJornalista IN (5, 6);

UPDATE Jornalista SET fkTelejornal = 100 WHERE idJornalista IN (1, 2, 3);
UPDATE Jornalista SET fkTelejornal = 101 WHERE idJornalista IN (4, 5, 6);

SELECT * FROM telejornal AS t, jornalista AS j WHERE idTelejornal = fkTelejornal;
SELECT t.nome, horario, regiao, j.nome, dataNasc, telefone FROM telejornal AS t, jornalista AS j WHERE idTelejornal = fkTelejornal;


SELECT * FROM telejornal AS t, jornalista AS j WHERE idTelejornal = fkTelejornal AND t.nome = 'Tevê com você';
SELECT t.nome, horario, regiao, j.nome, dataNasc, telefone FROM telejornal AS t, jornalista AS j WHERE idTelejornal = fkTelejornal AND t.nome = 'Tevê com você';

SELECT * FROM jornalista AS a, jornalista AS b WHERE a.orientador = b.idJornalista;
SELECT a.nome, a.dataNasc, a.telefone, b.nome, b.dataNasc, b.telefone FROM jornalista AS a, jornalista AS b WHERE a.orientador = b.idJornalista;

SELECT * FROM jornalista AS a, jornalista AS b WHERE a.orientador = b.idJornalista AND b.nome = 'Luciana Torres';
SELECT a.nome, a.dataNasc, a.telefone, b.nome, b.dataNasc, b.telefone FROM jornalista AS a, jornalista AS b WHERE a.orientador = b.idJornalista AND b.nome = 'Luciana Torres';

SELECT * FROM telejornal as t, jornalista AS a, jornalista AS b WHERE a.orientador = b.idJornalista AND idTelejornal = a.fkTelejornal;
SELECT t.nome, horario, regiao, a.nome, a.dataNasc, a.telefone, b.nome, b.dataNasc, b.telefone FROM telejornal as t, jornalista AS a, jornalista AS b WHERE a.orientador = b.idJornalista AND idTelejornal = a.fkTelejornal;

SELECT * FROM telejornal as t, jornalista AS a, jornalista AS b WHERE a.orientador = b.idJornalista AND idTelejornal = a.fkTelejornal AND a.nome = 'Zeiva Zulei';
SELECT t.nome, horario, regiao, a.nome, a.dataNasc, a.telefone, b.nome, b.dataNasc, b.telefone FROM telejornal as t, jornalista AS a, jornalista AS b WHERE a.orientador = b.idJornalista AND idTelejornal = a.fkTelejornal AND a.nome = 'Zeiva Zulei';
