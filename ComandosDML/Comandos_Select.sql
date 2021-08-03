/*SENTENCIA SELECT*/
/*SINTAXIS GENERAL
SELECT lista de campos
FROM NOMBRE_TABLA(S)
WHERE condicion(es)  -->opcional
order by lista de campos  -->opcional
*/
select codigo,nombre,estado 
from contratos;
/*otra forma de hacerlo con el caracter * */
select * 
from contratos;
/*el caracter * nos ahorra trabajo de digitación
PEEEEROOOOO puede afectar notablemente el 
rendimiento de mi consulta*/
select * from detallesfac;

select * from pacientes;
/*pacientes genero femenino con datos básicos*/
select tipodoc,numero,apellido1,apellido2,nombre1,
nombre2,sexo,fecnac,direccion,celular
from pacientes
where sexo='F';

/*los tipos de datos char y los tipos de fecha se 
deben condicionar utilizando el valor buscado
ENTRE COMILLAS SIMPLES*/

/*OPERACIONES LOGICAS
AND (Y)    OR (O)   NOT (Negación)
​
en la operación lógica AND el resultado es verdadero
SI Y SOLO SI TODAS las condiciones son VERDADERAS
​
en la operación lógica OR el resultado es verdadero
SI POR LO MENOS UNA de las condiciones es VERDADERA.
*/
/*operaciones aritmeticas
suma, resta, mult. division, potenciación, etc*/

/*operadores relacionales
mayor que >  menor que <  mayor o igual >=
menor o igual <= igual=  diferente de !=  <>
*/  
select * from pacientes;
/*pacientes genero femenino con datos básicos
que tengan rh O+*/
select tipodoc,numero,apellido1,apellido2,nombre1,
nombre2,sexo,rh,fecnac,direccion,celular
from pacientes
where sexo='F' and rh='O+';

/*pacientes con datos básicos
que tengan rh O+ ó A+*/
select tipodoc,numero,apellido1,apellido2,nombre1,
nombre2,sexo,rh,fecnac,direccion,celular
from pacientes
where rh='O+' or rh='A+';

/*pacientes genero femenino con datos básicos
que tengan rh O+ ó A+*/

select tipodoc,numero,apellido1,apellido2,nombre1,
nombre2,sexo,rh,fecnac,direccion,celular
from pacientes
where sexo = 'F' and (rh= 'O+' or rh= 'A+'); 

/*5+3*2=16    INCORRECTO
5 + 6 =11   CORRECTO
(5+3)*2= 8*2=16  CORRECTO*/

SELECT tipodoc, numero, apellido1, apellido2, 
nombre1, nombre2, SEXO,RH,fecnac, direccion, celular 
FROM pacientes 
WHERE (rh = 'O+'OR rh='A+')
AND sexo ='F';

/*pacientes genero femenino con datos básicos
que tengan rh O+ ó A+ Y QUE SEAN casados o solteros*/

SELECT tipodoc, sexo, rh, estcivil, numero, apellido1, apellido2, 
nombre1, nombre2, fecnac, direccion, celular 
FROM pacientes 
WHERE (rh = 'O+'OR rh='A+')
AND sexo ='F'
AND (estcivil = '1' OR estcivil = '2');

/*consulta con muchos and*/
SELECT tipodoc, sexo, rh, estcivil, numero, apellido1, apellido2, 
nombre1, nombre2, fecnac, direccion, celular 
FROM pacientes 
WHERE (rh = 'O+'OR rh='A+')
AND sexo ='F'
AND (estcivil = '1' OR estcivil = '2')
and tipodoc='CC' and contrato='070' and zona='U'
and mpio='444' and depto='17';


/*consultas*/
/*
1. seleccionar los registros de la tabla detallesfac
   donde la cantidad sea mayor o igual a 10
   y menor o igual a 20.
2. seleccionar los registros de facturación (detallesfac)
   donde el valor total NO COINCIDA con la multiplicación
   de la cantidad por el valor unitario
3. seleccionar los registros de la tabla detallesfac
   donde la fecha sea mayor o igual a 5 de febrero de
   2021   y menor o igual a 8 de febrero de 2021.
   */
   
   
/*PRIMERO*/
select * from detallesfac;

select ncargo, tipodoc,identifica,factura,contrato,fecha,hora,codigo,descripcion,cantidad,vunitario,vtotal,unidadf,estadocar
from detallesfac
where cantidad >= 10 and cantidad <= 20;

/*SEGUNDO*/

select ncargo, tipodoc,identifica,factura,contrato,fecha,hora,codigo,descripcion,cantidad,vunitario,vtotal,unidadf,estadocar
from detallesfac
where vtotal != cantidad * vunitario;

/*TERCER*/

select ncargo, tipodoc,identifica,factura,contrato,fecha,hora,codigo,descripcion,cantidad,vunitario,vtotal,unidadf,estadocar
from detallesfac
where fecha >= '2021-02-05 00:00:00' and fecha <= '2021-02-08 00:00:00';