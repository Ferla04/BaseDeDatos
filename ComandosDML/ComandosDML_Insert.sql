use bibloteca2;
/*DML - DATA MANIPULATION LANGUAGE*/
/* CRUD - CREATE - READ - UPDATE - DELETE*/

/*COMANDO INSERT - INSERTAR REGISTROS*/
/*SINTAXIS GENERAL
INSERT INTO NOMBRE_TABLA(campo1,campo2,campo3,...campon)
VALUES(valor1,valor2,valor3,....,valorn);
consideraciones especiales
1. la cantidad de campos debe ser IGUAL a la cantidad
   de valores.
2. los valores son RELATIVOS al orden de la lista
   de campos
*/
/*INSERT - VARIANTE 1 - CON LISTA DE CAMPOS*/
insert into generos(codigo,nombre) 
values('G01','Matemáticas');

/*INSERT - VARIANTE 2 - SIN LISTA DE CAMPOS*/
/*si utilizo esta sintaxis estoy OBLIGADO
a enviar TODOS los valores de acuerdo a TODOS
los campos de la estructura de la tabla*/
insert into generos
values('G02','Medicina');
/*esta instrucción genera un error porque
ignoro la lista de campos y la tabla tiene
mas campos de los valores que le estamos enviando
se genera este error:
06:58:06	insert into generos values('G03')
Error Code: 1136. Column count doesn't 
match value count at row 1	0.297 sec
*/
insert into generos
values('G03');

/*insert - variante 3- campos en cualquier
orden y cualquier cantidad*/
insert into generos (nombre,codigo)
values('Educación Física','G03');

insert into generos (codigo)
values('G04');

insert into generos (codigo)
values('G05');
/*aqui me insertó un registro y dejó el campo
nombre nulo, porque no estaba la marca de not 
null*/
insert into generos (nombre)
values('Fisica');

/*ESTO da advertencia porque esa en una llave principal y ese dato futuramente se necesita en otra tabla*/

/*insert - variante 4 - tabla con campos
  autonuméricos.
  cuando la llave principal es tipo INT y es
  autoincremental debemos IGNORAR ese campo
  para realizar una inserción a la base 
  de datos y debo utilizar de forma OBLIGATORIA
  una lista de campos*/
  insert into paises(nombre)
  values('Colombia');
  insert into paises(nombre)
  values('Brasil');
  insert into paises(nombre)
  values('Argentina');
  
  insert into paises(idpais,nombre)
  values(7,'Paraguay');
  
  insert into paises(nombre)
  values('Uruguay');
  
  insert into paises(idpais,nombre)
  values(5000,'Chile');
  
  insert into paises(nombre)
  values('Venezuela');
  
  /*insert variante 5 - varios registros
    en una sola instrucción*/
    insert into paises(nombre) values
    ('Ecuador'),
    ('Francia'),
    ('España'),
    ('Portugal'),
    ('EEUU'),
    ('Grecia');
    
    insert into editoriales values
    ('E01','Editorial Norma'),
    ('E02','Grupo Planeta'),
    ('E03','Editorial Argentina'),
    ('E04','Editores unidos');


/*crear a GABRIEL GARCIA MARQUEZ como autor 
Y asociarlo a Colombia como pais de origen*/
 insert into autores(nombre, pais)
 values('Gabriel Garcia Marquez', 1);
 
 /*que pasa si no tengo el pais del autor?*/
 /*como hago la inserción del autor*/
 insert into autores (nombre,pais) 
 values ('Mario Vargas Llosa',null);
 
 /*insertar un libro de matematicas
de la editorial norma*/
insert into libros (titulo, genero, estado, 
paginas, editorial, precio)
 values ('Algebra de Baldor','G01', '1', 
 576, 'E01', 37000);
 
 insert into libros (titulo, genero, estado, 
paginas, editorial, precio)
 values ('Piense y Hagase Rico','G02', '1', 
 350, 'E01', 45500);
 
 /*relacionar un autor al libro algebra de
 baldor*/
 insert into libros_autores(idlibro,idautor)
 values(1,2);
 
 /*relacionar 2 autores para un mismo libro
   con 1 solo comando insert*/
insert into libros_autores (idlibro, idautor)
values (2, 1), (2, 3);

insert into libros_autores(idlibro,idautor)
 values(3,2);