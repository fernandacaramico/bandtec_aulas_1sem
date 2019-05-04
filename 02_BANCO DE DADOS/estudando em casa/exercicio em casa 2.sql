use bandtec;
create table comedia (
idCom int primary key,
nome varchar(50),
sobrenome varchar(50),
marca_reg varchar(100),
trabalho varchar(50)
);
insert into comedia values
(1, 'Gilda', 'Carneiro', 'Falando Sério', 'Agente de Seguros'),
(2, 'Jardel', 'Palhares', 'Hora do almoço', 'Dono de Café'),
(3, 'Leandro', 'Saldanha', 'Toc Toc Toc', 'Vendedor'),
(4, 'Oscar', 'Vieira', 'Segura o telefone', 'Atendente de Telemarketing'),
(5, 'Tatiana', 'Valadares', 'Anote isso', 'Encanador'),
(6, 'Tawny', 'Hart', 'Dá uma olhada', 'Garçonete'),
(7, 'Josh', 'Gart', 'Você não vai acreditar nisso', 'Professor');

select * from comedia;

select nome, marca_reg from comedia;
select * from comedia where trabalho = 'professor';
select * from comedia where sobrenome = 'hart';
select * from comedia order by nome;
select * from comedia order by sobrenome desc;

select * from comedia where nome like 't%';
select * from comedia where sobrenome like '%rt';
select * from comedia where marca_reg like '_a%';
select * from comedia where trabalho like '%o_';

update comedia set nome = 'Sunny' where idCom = 6;
update comedia set marca_reg = 'Dá uma olhada!!' where idCom = 6;

alter table comedia modify marca_reg varchar(200);
desc comedia;
alter table comedia change trabalho trab_atual varchar(50);
desc comedia;
alter table comedia add comida_preferida varchar(100);
desc comedia;
alter table comedia drop column comida_preferida;
desc comedia;

delete from comedia where idCom = 5;
select * from comedia;