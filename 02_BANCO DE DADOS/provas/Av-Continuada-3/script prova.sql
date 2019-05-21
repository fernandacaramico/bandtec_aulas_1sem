CREATE TABLE Professor (
idProf INT PRIMARY KEY AUTO_INCREMENT,
nomeProf VARCHAR(45),
dataNasc DATE,
fkArea INT
) AUTO_INCREMENT = 1;

CREATE TABLE Faculdade (
idFac INT PRIMARY KEY AUTO_INCREMENT,
nomeFac VARCHAR(45),
bairro VARCHAR(45)
) AUTO_INCREMENT = 100;

CREATE TABLE Area (
idArea INT PRIMARY KEY AUTO_INCREMENT,
nomeArea VARCHAR(45)
) AUTO_INCREMENT = 1000;

CREATE TABLE ProfFac (
fkProf INT,
fkFac INT, 
horas INT,
FOREIGN KEY (fkProf) REFERENCES Professor(idProf),
FOREIGN KEY (fkFac) REFERENCES Faculdade(idFac),
PRIMARY KEY (fkProf, fkFac)
);

ALTER TABLE Professor ADD FOREIGN KEY (fkArea) REFERENCES Area (idArea);

-- 2. Insira dados nas tabelas, de forma que tenha uma área associada a mais de um professor, e tenha pelo menos um professor lecionando em mais de uma faculdade.

INSERT INTO Area VALUES
(null, 'Medicina'),
(null, 'Arquitetura'),
(null, 'Tecnologia da Informação');

INSERT INTO Professor VALUES
(null, 'Marcos', '1963-07-07', 1000),
(null, 'Vitória', '1987-10-10', 1000),
(null, 'Igor', '1989-09-20', 1001),
(null, 'Marcela', '1973-12-25', 1002),
(null, 'Gabriela', '1965-11-27', 1002);

INSERT INTO Faculdade VALUES
(null, 'Faculdade de Medicina da USP', 'Butantã'),
(null, 'Faculdade de Arq Urb do Mackenzie', 'Consolação'),
(null, 'Faculdade de Tecnologia BandTec', 'Bela Vista'),
(null, 'Faculdade de Arq Urb Belas Artes', 'República');

insert into faculdade values(103, 'Faculdade de Arq Urb Belas Artes', 'República');

DELETE FROM Faculdade where idFac = 103;
DELETE FROM Faculdade where idFac = 104;
DELETE FROM Faculdade where idFac = 105;
DELETE FROM Faculdade where idFac = 106;

INSERT INTO ProfFac VALUES
(3, 103, 12);



-- 3. Se for necessário, fazer os acertos da(s) chave(s) estrangeira(s).

-- 4. Exibir todos os dados de cada tabela criada, separadamente.

SELECT * FROM Area;

SELECT * FROM Professor;

SELECT * FROM Faculdade;

SELECT * FROM ProfFac;

-- 5. Exibir os dados das áreas e os dados dos seus professores.

SELECT * FROM Area JOIN Professor ON fkArea = idArea;

-- 6. Exibir os dados de uma determinada área e os dados dos seus professores.

SELECT * FROM Area JOIN Professor ON fkArea = idArea WHERE nomeArea = 'Medicina';


-- 7. Exibir a média e a soma das quantidades de horas, no geral.

SELECT ROUND(AVG(horas),1) AS 'Média das Horas', SUM(horas) AS 'Soma das Horas' FROM ProfFac;


-- 8. Exibir a menor e a maior quantidade de horas, no geral.

SELECT MIN(horas), MAX(horas) FROM ProfFac;

-- 9. Exibir os dados dos professores, os dados das faculdades correspondentes e as quantidades de horas de cada professor em cada faculdade.

SELECT * FROM Professor JOIN ProfFac on idProf = fkProf JOIN Faculdade ON idFac = fkFac;
SELECT idProf, nomeProf, dataNasc, fkArea, horas as 'Quantidade de Horas', nomeFac, bairro FROM Professor JOIN ProfFac on idProf = fkProf JOIN Faculdade ON idFac = fkFac;

-- 10.Exibir os dados de um determinado professor, os dados das faculdades correspondentes e suas quantidades de horas em cada faculdade.
SELECT * FROM Professor JOIN ProfFac on idProf = fkProf JOIN Faculdade ON idFac = fkFac WHERE nomeProf = 'Igor';

-- 11. Exibir os dados dos professores, os dados das áreas correspondentes, os dados das faculdades correspondentes e as quantidades de horas de cada professor em cada faculdade.

SELECT idProf, nomeProf, dataNasc, idArea, nomeArea, horas as 'Quantidade de Horas', idFac, nomeFac, bairro FROM Professor JOIN Area ON idArea = fkArea JOIN ProfFac ON idProf = fkProf JOIN Faculdade ON idFac = fkFac;

-- 12. Exibir a identificação do professor, a média e a soma das quantidades de horas, agrupadas por professor.
SELECT fkProf, AVG(horas), SUM(horas) FROM ProfFac GROUP BY fkProf;
SELECT fkProf, nomeProf, ROUND(AVG(horas), 1) AS 'Média de Horas', SUM(horas) AS 'Soma das horas' FROM ProfFac JOIN Professor ON idProf = fkProf GROUP BY fkProf;

-- 13. Exibir a identificação da faculdade, a média e a soma das quantidades de horas, agrupadas por faculdade.

SELECT fkFac, AVG(horas), SUM(horas) FROM ProfFac GROUP BY fkFac;
SELECT fkFac, nomeFac, ROUND(AVG(horas), 1) AS 'Média de Horas', SUM(horas) AS 'Soma das horas' FROM ProfFac JOIN Faculdade ON fkFac = idFac GROUP BY fkFac;

-- 14. Exibir a identificação do professor, a menor e a maior quantidade de horas, agrupado por professor.

SELECT fkProf, MIN(horas), MAX(horas) FROM ProfFac GROUP BY fkProf;
SELECT fkProf AS 'Identificação do Professor', nomeProf AS 'Nome do Professor', MIN(horas) AS 'Mínimo de Horas', MAX(horas) AS 'Máximo de Horas' FROM ProfFac JOIN Professor ON idProf = fkProf GROUP BY fkProf;

-- 15. Exibir a identificação da faculdade, a menor e a maior quantidade de horas, agrupado por faculdade.
SELECT fkFac, MIN(horas), MAX(horas) FROM ProfFac GROUP BY fkFac;
SELECT fkFac AS 'Identificação da Faculdade', nomeFac AS 'Nome da Faculdade', MIN(horas) AS 'Mínimo de Horas', MAX(horas) AS 'Máximo de Horas' FROM ProfFac JOIN Faculdade ON idFac = fkFac GROUP BY fkFac;