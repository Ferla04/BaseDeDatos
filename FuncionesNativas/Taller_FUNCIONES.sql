/*Seleccione los registros de la tabla detallesfac donde 
el tipo de documento sea cedula de ciudadanía.*/

select * from detallesfac
where tipodoc = 'CC';
select count(*) as cedulas from detallesfac
where tipodoc = 'CC';

/*Seleccione los campos factura, contrato, fecha, hora y descripción 
de los detalles de facturación donde los minutos correspondan al 
minuto 30 de cada hora */

select factura, contrato,fecha,hora,descripcion from detallesfac
where minute(hora) = 30;
select count(*) as Horas from detallesfac
where minute(hora) = 30;

/*Seleccione todos los registros de detallesfac donde exista la palabra CONTROL en la descripción*/

select *
from detallesfac where descripcion like '%CONTROL%';

select count(*) as Control from detallesfac
where descripcion like '%CONTROL%';

/*Seleccione todos los registros de detallesfac donde exista la palabra 
CONTROL y además la palabra ENFERMERIA y también los registros donde 
exista la palabra CONTROL y además la palabra MEDICINA.*/

select * from detallesfac
where descripcion like '%CONTROL%ENFERMERIA%' or descripcion like '%CONTROL%MEDICINA%';

select count(*) as cantidad from detallesfac
where descripcion like '%CONTROL%ENFERMERIA%' or descripcion like '%CONTROL%MEDICINA%';

/*Seleccione de detallesfac los códigos(campo código) que terminen en las letras CP*/

select codigo from detallesfac
where codigo like '%CP';

select count(codigo) as Cantidad from detallesfac
where codigo like '%CP';

/*Seleccione los registros que tengan diferencia en el cálculo 
de la cantidad por el valor unitario comparado con el valor total(campo vtotal) 
de la tabla detallesfac. UTILICE PARA ELLO UNA OPERACIÓN LÓGICA NOT.*/

select * from detallesfac
where cantidad * vunitario != vtotal;

select count(*) as operacion  from detallesfac
where cantidad * vunitario != vtotal;

/*Seleccione los registros de la tabla detallesfac que estén entre 
el día 01 de febrero de 2021 hasta el 10 de febrero de 2021 y que 
estén entre los contratos con código desde 150 al 170 y que estén en 
las unidades funcionales con códigos 001, 006, 012, 011.*/

select * from detallesfac
where (fecha between '2021-02-01' and '2021-02-10') and (contrato between 150 and 170) 
and (unidadf in('001','006','012','011'));

select count(*) as afectadas from detallesfac
where (fecha between '2021-02-01' and '2021-02-10') and (contrato between 150 and 170) 
and (unidadf in('001','006','012','011'));

/*Seleccione los apellidos, nombres, teléfono de los pacientes cuyo 
celular comience por 313*/

select apellido1, apellido2, nombre1, nombre2, celular from pacientes
where celular like '313%';

select count(*) as celular from pacientes
where celular like '313%';

/*Seleccione los apellidos, nombres, teléfono, tipo de documento 
de los pacientes cuyo tipo de sangre sea O+ y que no estén casados 
y que vivan en el área Urbana.*/

select apellido1, apellido2, nombre1, nombre2, celular, tipodoc, rh from pacientes
where rh = 'O+' and estcivil != 2 and zona = 'U';

select count(*) as pacientes from pacientes
where rh = 'O+' and estcivil != 2 and zona = 'U';

/*Cuantos pacientes son de sexo femenino?*/
select count(*) from pacientes
where sexo = 'F';

/*¿Cuantos pacientes son de sexo masculino que se llamen DIEGO? 
El nombre puede estar en el primer nombre o en el segundo nombre.*/

select * from pacientes
where  sexo = 'M' and (nombre1 = 'DIEGO' or nombre2 = 'DIEGO' );

select count(*) as cantidad from pacientes
where  sexo = 'M' and (nombre1 = 'DIEGO' or nombre2 = 'DIEGO' );

/*Seleccione la fecha y la hora de la tabla detallesfac y agregue otro campo a la consulta que sea el resultado de 
concatenar esa fecha en formato dd/mm/yyyy y  la  hora.  
Ejemplo:  si la  fecha  es 2018-02-0100:00:00  y  la  hora es  15:45,  
el campo resultante debe tener el valor 01/02/2018 15:45*/

select fecha, hora, concat(year(fecha),'/', month(fecha),'/', day(fecha),' ', hora) as fechahora from detallesfac;

select concat(DATE_FORMAT(fecha,'%d/%m/%Y'),' ',hora) as fechahora FROM detallesfac;



