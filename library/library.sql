create schema library;
use library;

create table libros(
 Isbn char(20) primary key not null,
 Titulo char(100),
 Autor char(5),
 Aprendiz char(20),
 Calificacion char(1),
 categoria tinyint,
 Estsdo tinyint
);

create table autores(
 Codigo char(5) primary key not null,
 Nombre char(60),
 Genero char(1)
);

create table aprendices(
 Documento char(20) primary key not null,
 Nombre char(60),
 Hobbies Varchar(250),
 Alias Char(50)
);

alter table libros
add foreign key FK_Autor_libros (Autor) references autores (codigo),
add foreign key FK_Aprendiz_libros (Aprendiz) references aprendices (documento);

/*--------------------------------------------------COMANDOS-INSERT----------------------------------------------------------------*/

insert into aprendices(Documento,Nombre,Hobbies,Alias) values 
('1004870915','Juan Reyes','Jugar LOL', 'Juanito'),
('1015392045','Fernanda Velásquez','Armar cubos Rubik','Fer');

insert into autores(Codigo,Nombre,Genero) values
('AU01','Suzanne Collins', 'F'),
('AUO2','Paula Hawkins', 'F');

insert into autores(Codigo,Nombre,Genero) values
('AU03','Becca Fitzpatrick', 'F'),
('AU04','Stephen King', 'M');

update autores set
codigo = 'AU02'
where codigo = 'AUO2';

insert into libros(Isbn,Titulo,Autor,Aprendiz,Calificacion,Categoria,Estsdo) values
('978-60-74-00190-7','Juegos del Hambre parte 1','AU01','1015392045','B', 3, 1),
('978-84-08-17218-5','La Chica del Tren','AU02', '1015392045', 'R', 3, 1),
('978-84-66-64417-4', 'Hush Hush', 'AU03', '1004870915', 'B', 3 , 1 ),
('978-84-97-59379-3', 'It', 'AU04', '1004870915', 'M', 3 , 1);

/*-------------------------------------------------------UPDATE------------------------------------------------------------------*/

update aprendices set
 Hobbies = 'Jugar LOL, Leer'
where Hobbies = 'Jugar LOL';

update aprendices set
 Hobbies = 'Armar cubos Rubik, Jugar baloncesto'
where Hobbies = 'Armar cubos Rubik';

/*Cambiar documento*/
update aprendices set
 Documento = '1004870916'
where Documento = '1004870915';

/*Cambiar Categoria y calificacion*/
update libros set
 Categoria = 8
where Isbn = '978-84-08-17218-5';

update libros set
 Categoria = 'E'   /*AQUI DA ERROR PORQUE CATEGORIA RECIBE TIPO DE DATOS TINYINT Y LE ESTAMOS COLOCANDO TIPO CARACTER*/
where Isbn = '978-84-08-17218-5';

update libros set Calificacion='E'
where Titulo='La Chica del Tren';

/*Cambiar el estado del libro*/
update libros set Estado=2
where Isbn='978-60-74-00190-7';

/*-------------------------------------------------------DELETE------------------------------------------------------------------*/

delete from aprendices;

/*Eliminar relacion*/
alter table libros
drop foreign key FK_Aprendiz_libros;

/*Volver a intentarlo*/
delete from aprendices;

/*1. Elimar la relación de autores con libros*/
alter table libros drop foreign key FK_autor_libros;

/*2. Borrar registro de autores*/
delete from Autores;

/*Borrar uno de los libros*/
delete from libros
where Isbn='978-84-97-59379-3';


/*Sin el comando comcat*/
update Aprendices set Hobbies=concat(Hobbies,', hacer ejercicio')
where Documento='1004870916';
