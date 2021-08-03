/*FUNCIONES NATIVOS SQL*/
/*FUNCION BETWEEN
NOS PERMITE EVALUAR UN CAMPO EN UN RANGO DE VALORES
*/
select ncargo, tipodoc,identifica,factura,contrato,fecha,hora,codigo,descripcion,cantidad,vunitario,vtotal,unidadf,estadocar
from detallesfac
where cantidad between 10 and 20;

select ncargo, tipodoc,identifica,factura,contrato,fecha,hora,codigo,descripcion,cantidad,vunitario,vtotal,unidadf,estadocar
from detallesfac
where fecha between '2021-02-05 00:00:00' and '2021-02-08 00:00:00';

/*La funcion between se puede implementar con tipos de datos CHAR. Hay que tener CUIDADO al evaluar
rangos donde el tipo de dato char almacene numeros*/

select * 
from pacientes
where numero between '1' and '4';

select * 
from pacientes
where nombre1 between 'A' and 'f';

/*FUNCION LIKE  ---> SE PARECE A 
es fincion se utiliza para buscar una cadena en un campo
es ideal para busquedas desde nuestras aplicaciones*/

select *
from detallesfac
where descripcion like 'CONSULTA%'; /*AQUI BUSCA UN ESPACIO DONDE EN LA CADENA TENGA LA PALABRA CONSULTA, EL % HACE ESTA FUNCION */
/*where descripcion like 'CONSULTA';  --> AQUI DICE UN ESPACIO DONDE LA DECRIPCION SOLO DIGA CONSULTA Y ENCONCES NO SALDRIA NADA*/

select *
from detallesfac
where descripcion like 'CONSULTA  %'; /*--> DESPUES DEL %  IGNORA LO QUE HAGA DESPUES, AHI TOMA LOS RESULTADOS QUE TIENEN DOS
ESPACIOS DESPUES DE CONSULTA */

select *
from detallesfac
where descripcion like '%CONTROL%';/*AQUI BUSCA LA PALABRA CONTROL SIN IMPORTAR EN QUE LADO ESTE(COMIEZO, MITAD, FINAL)
AHI DICE IGNORE LO QUE HAYA ATRAS DE LA PALABRA CONTROL Y ADELANTE DE LA PALABRA CONTROL
%= NO ME INTERESA LO QUE HAYA DEPUES O ANTES DE LA PALABRA EJ:
CONSULTA%MEDICINA = NO ME INTERESA LO QUE HAYA ENTRE LAS PALABRAS CONSULTA Y MEDICINA*/

select *
from detallesfac
where descripcion like '%CONTROL%ENFERMERIA%';


/*FUNCION SUBSTR*/
/*
esta función se utiliza para extraer una cantidad de 
caracteres de un campo, teniendo en cuenta 3 parámetros
parametro 1: es el campo o texto sobre el cual voy a
		     realizar la extracción
parametro 2: es la posición inicial donde se empieza
             a extraer la cadena
parametro 3: es la cantidad de caracteres a extraer
             desde la posición inicial, incluida esa
			posición
*/

select descripcion, substr(descripcion,1,10) 
from detallesfac;

/*
T  E  R  A  P  I  A     F  I  S  I  C  A  
1  2  3  4  5  6  7  8  9 10 11 12 13 14
Imprimiria terapia fi
*/

/*ALIAS DE CAMPO*/
/*substr(descripcion,1,10) EL NOMBRE DEL ATRIBUTO SE LLAMA ASI PERO LE PODEMOS CAMBIAR EL NOMBRE*/
/*es renombrar el nombre original del campo o darle
nombre a un campo generado al utilizar una o mas
funciones nativas o calculos */

select descripcion as nombre
from detallesfac;

select descripcion as nombre, substr(descripcion,1,10) as hola
from detallesfac;


/*---------------------------------------------------------------------*/
select * from detallesfac
where contrato= '061' or contrato= '081' or contrato= '070' or contrato= '069'; /*--> optimizar esto*/

/*clausura in*/
/* se utilica para hallar la pertenencia de un campo sobre un conjunto de valores especificios*/
select * from detallesfac
where contrato in('061','081','070','069');

select * from detallesfac
where cantidad in('1','5','10','12');

/*FUNCION COUNT*/
/*SIRVE PARA CONTAR REGISTROS,  devuelve 1 solo registro con la cantidad de registros que cumplen las condiciones.
Esta recibe un parametro de forma obligatoria*/

select count(*) from detallesfac;

select count(*) from detallesfac
where tipodoc = 'CC';


/*FUNCIONES PARA EXTRAER LOS COMPONENTES DE UNA FECHA
Cada funcion recibe la fecha como paremetro Y DEVUELVE UN VALOR NUMERICO*/
/*Nececesito el año*/
select fecha,year(fecha) as anio from detallesfac;
/*'2021-02-28 00:00:00', '2021' --> VALOR NUMERICO*/

select fecha,year(fecha) as anio, month(fecha) as mes, day(fecha) as dia, 
hour(fecha) as horas, minute(fecha) as minutos, second(fecha) as segundos
from detallesfac;

select now() as hoy;



