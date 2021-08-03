use bibloteca2;
/*COMANDO UPDATE*/
/*Se utiliza para actualizar registros una tabla*/
/* 1. Complementar datos que no se habian podido obtener.alter
   2. Corregir errores en los datos
   3. Actualizar datos que pueden cambiar
EL comando Update trabaja sobre un registro, dobre un grupo de registros o sobre toda una tabla
*/

/*
SINTAXIS GENERAL
UPDATE nombre_tabla SET 
       campo1=valor1, 
       campo2=valor2,
       campon=valorn
WHERE condicion(es)  --- OPCIONAL
SIN EMBARGO para utilizar un update sin la clausura where
debemos estar muy seguros de lo que se está haciendo.
*/

update generos set nombre= 'Informatica'
where codigo= 'G04'; /*<--- Hace referencia en que fila se va a colocar el dato por general se 
                            TOMA EN CUENTA LA LLAVE PRINCIPAL*/
                            
update generos set nombre= 'Contabilidad'
where nombre= ''; /*<--- Se hace referencia a que es universal, o sea todos los datos vacios se van a 
						 a llenar con lo que dice el nombre*/

update generos set nombre= 'Artes'
where nombre= '';

/*ACTUALIZAR VALORES NULOS*/
	/*DE ESTA FORMA NO VA A FUNCIONAR*/
	update generos set nombre= 'Quimica'
	where nombre= null;

	/*DE ESTA FORMA VA A FUNCIONAR*/
	update generos set nombre= 'Nulo'
	where nombre is null;

/*Alcance para toda la tabla*/
update generos set nombre='Medicina Y Enfermeria'
/*Si por desvistada no selecciono todo el codigo(sin el where/sin condicionado)
me lo va a tomar como universal y todos los espacios se va a cambiar
por Medicina Y Enfermeria */
where codigo= 'G02';

	/*En que escenario se puede utilizar un update sin where*/
	alter table generos add column estado char(1);
	update generos set estado= 'A'; /*<--- A= actividad
										   I= inactividad*/

/*Reescribir los VALORES*/
update generos set codigo = 'G50'
where  codigo = 'G10';

update generos set codigo = 'G51'
where  codigo = 'G01'; /*<--- AQUI NO SE PUEDE ACTUALIZAR YA QUE ES UNA LLAVE PRINCIPAL
							  Y TIENE UNA LLAVE FK Y ESTAN RELACIONADOS LO CUAL ES QUE EN EL
							  FK YA SE USO ESE CODIGO/ESTA REFRENCIADO*/
/*Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`biblioteca`.`libros`, 
CONSTRAINT `FK_genero_libros` FOREIGN KEY (`genero`) REFERENCES `generos` (`codigo`))	0.094 sec*/

update generos set codigo = 'G51'
where  codigo = 'G06'; /*<--- AQUI SI SE PODRIA HACER EL CAMBIO PORQUE EN LA FK TODAVIA NO ESTA REFERENCIADO*/


/*ACTUALIZACION EN CASCADA*/
/*SI LA LLAVE YA ESTA REFERENCIADA EN OTRAS ENTIDADES Y QUEREMOS HACER UN CAMBIO EN LA PK Y
QUE CAMBIE EL NOMBRE EN TODAS LAS ENTIDADES*/

/*1- Ir a la entidad donde esta la FK
  2- Darle en la opcion de Foreign Keys
  3- Seleccionar la FK y cambiar esta opcion ON UPDATE: CASCADE*/

update generos set codigo = 'G44'
where  codigo = 'G01'; 
/*AQUI SE ACTUALIZA Y YA ESTA EL CAMBIO DEL CODIGO*/

update pacientes set numero= '1015392045'
where numero = '1015392040'
/*Aqui le estamos diciendo que donde numero = '1015392040'(el que esta mal) 
  se actulice por el que este bien numero= '1015392045'*/


