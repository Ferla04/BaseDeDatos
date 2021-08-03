use bibloteca2;
/*COMANDO DELATE*/
/*Se utiliza para eliminar registros de una tabla
  - EXISTEN DOS TIPOS de eliminaciones en las BD
	1. Eliminación Fisica: Los registros DESAPARECEN
       en la base de datos. Este tipo de eliminacion 
       implemente con una sentencia DELETE,
       NO SIEMPRE se pueden eliminar los resgistros de la table
       generalmente dependen de la INTEGRIDAD REFERENCIAL.
	2. Eliminacion Logica: Los resgistros se CONSERVAN guardando
       en el historial de estadoa uno de los campos de la tabla.
       Este tipo de eliminacion se implementa con una sentencia 
       UPDATE.*/
    

/*1. SINTAXIS GENERAL*/
/*DELETE FROM nombre_tabla
WHERE condicional
TENEMOS QUEE ESTAR SEGUROS QUE SI NO LO USAMOS CON WHERE */

delete from generos;

/*NO puedo borar por la FK, pero requiero restaurarlos mIs generos
POSIBLE SOLUCION:*/

/*PASO 1 ELIMINO LA RELACION*/
alter table libros drop foreign key FK_generos_libros;

/*PASO 2 ELIMINAR LOS REGISTROS DE LA TABLA
OJOOOO-- SABIENDO QUE ANTERIORMENTE SE HIZO UN BACKUP*/

delete from generos;

/*PASO 3 RESTAURAR LOS DATOS DESDE EL BACKUP
importar desde un archivo CVS COMMA SEPARATOR VALUE o en excel etc...*/

/*PASO 4 CONECTAR ENTIDADES/CREAR NUEVAMENTELA RELACION*/
alter table libros
add foreign key FK_generos_libros (genero) references genero (codigo);

delete from generos
where codigo = 'G01';

/*aqui no se va a eliminar ya que ya hay una relacion en otra entidad con ese numero*/

/*ALGO FUNDAMENTAL EN LAS BD ES CONSERVAR LA HISTORIA DE LOS DATOS*/
