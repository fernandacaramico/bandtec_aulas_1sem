create table pets (
	idPets int primary key auto_increment,
    tipoAnimal varchar(15),
    raca varchar(30),
    nome varchar(20),
    dataNasc date
) auto_increment = 101;

create table clientes (
	idCliente int primary key auto_increment,
    nome varchar(30),
    sexo enum('m', 'f'),
    bairro varchar(15),
    telefone char(10)
);

select * from pets;
select * from clientes;

alter table pets add column fkClientes int;
alter table pets add foreign key(fkClientes) references clientes(idCliente);

desc clientes;
desc pets;

insert into pets  values
(null, 'Gato', 'Siamês', 'Mia', '2005-04-19', 1),
(null, 'Hamster', 'Angorá', 'Tatá', '2016-12-10', 2),
(null, 'Cachorro', 'SRD', 'Chiara', '2008-03-12', 3),
(null, 'Gato', 'Persa', 'Téo', '2012-12-12', 5),
(null, 'Cachorro', 'Husky', 'Alan', '2009-09-09', 5);


insert into clientes values
(null, 'Ana Aliança', 'f', 'Tatuapé', '98181-8765'),
(null, 'Bárbara Bolha', 'f', 'Balneário Flor', '3345-7262'),
(null, 'Carlos Carvalho', 'm', 'Sé', '97463-9282'),
(null, 'Débora Dias', 'f', 'Concórdia', '3456-1119'),
(null, 'Eduardo Edin', 'm', 'Vila Maria', '98767-7676'),
(null, 'Fábio Figueira', 'm', 'Consolação', '4452-0808'),
(null, 'Gabriela Dias', 'f', 'Vila Mariana', '98765-8201');

select * from clientes as c, pets as p
where p.fkClientes = c.idCliente;

alter table clientes modify nome varchar(50);
desc clientes;

select * from pets;
select * from pets where tipoAnimal = 'cachorro';
select nome, dataNasc from pets;
select * from pets order by nome;
select * from clientes order by bairro desc;
select * from pets where nome like 't%';

select * from clientes where nome like '% dias';

update clientes set telefone = '3453-2076' where idCliente = 4;

select * from clientes as c, pets as p
where p.fkClientes = c.idCliente and sexo = 'f';

alter table clientes drop column sexo; 

delete from pets where idPets = 103;
select * from pets;
