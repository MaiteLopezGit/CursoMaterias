Use musimundos;

 /*EJERCICIO 1*/
 SELECT COUNT(PAIS)
 FROM CLIENTES;
 
 /*EJERCICIO2*/
 /*Hacé una consulta a la base de datos que traiga el 
 id del género y la cantidad de canciones que posee.*/
 SELECT id_genero,count(nombre)
 FROM canciones
group by id_genero ;

/*EJERCICIO3*/
/*Hacé una consulta a nuestra base de datos que sume el total 
de todas las facturas que emitió la empresa.*/
SELECT SUM(total)
FROM FACTURAS;

/*EJERCICIO4*/
/*Obtene una lista de todos los álbumes y su duración (milisegundos) promedio.
Insertá el número del promedio que obtuviste para el álbum 4. */
SELECT ID_ALBUM,avg(milisegundos)
FROM CANCIONES
GROUP BY id_album;

/*EJERCICIO5*/
/*Hace una consulta a la base de datos para saber cuál es el archivo con menor peso en bytes.*/
SELECT MIN(bytes)
FROM canciones;

/*EJERCICIO6*/
/*Hacé una consulta a la base de datos que nos traiga por id_cliente la suma total de
 sus facturas.
Filtra aquellos que la suma del total sea >45.*/

select ID_CLIENTE, SUM(total)
FROM facturas
GROUP BY ID_CLIENTE