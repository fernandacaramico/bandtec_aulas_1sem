use bandtec;
create table livro (
	id_codigo int,
	nome varchar(100),
	autor varchar(100),
	assunto varchar(100),         
	quantidade int,
    primary key (id_codigo)
);
insert into livro values (101, 'Java Como Programar', 'Paul Deitel', 'Programação', 10), (102, 'Banco de Dados', 'Sandra Puga', 'Banco de Dados', 20), (103, 'Sistemas Operacionais', 'Paul Deitel', 'Sistemas Operacionais', 5), (104, 'C++ Como Programar', 'Harvey Deitel', 'Programação', 15);
select * from livro;
select * from livro where autor like '% deitel';
select * from livro where autor like '%deitel';
insert into livro values (111, 'JS Como Programar', 'Paul Pandeitel', 'Programação', 50);