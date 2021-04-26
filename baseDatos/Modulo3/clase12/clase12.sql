use Musimundos;

/*Ejercicio 1: escribir una consulta que liste todos los titulo de queen*/
select artistas.nombre, albumes.titulo
from albumes 
inner join artistas on artistas.id = albumes.id_artista
where artistas.nombre = "QUEEN";

/*Ejercicio 2: Escribir una consulta que devuelva los álbumes del artista Simply Red. */
select artistas.nombre, count(albumes.titulo)
from albumes 
inner join artistas on artistas.id = albumes.id_artista
where artistas.nombre = "%Simply%";

/*Ejercicio 3: Consultar las canciones de AC/DC y sus ventas (Ayuda: las canciones vendidas están en la tabla items_de_facturas). */
/*Cuantas veces fue vendido overdose*/
select artistas.nombre, count(items_de_facturas.cantidad), canciones.nombre
from artistas
inner join albumes on albumes.id_artista = artistas.id
inner join canciones on canciones.id_album = albumes.id
inner join items_de_facturas on items_de_facturas.id_cancion = canciones.id
group by canciones.nombre
having artistas.nombre ="AC/DC" and canciones.nombre = "Overdose"
order by artistas.nombre;

/*Ejercicio 4:Listar las canciones de Caetano Veloso que tengan una duración de más de 4 minutos (240000 milisegundos). 
De las canciones en esta lista, 
¿Cuál es el nombre de la única que no se vendió?*/

select artistas.nombre, canciones.milisegundos as duracion, items_de_facturas.cantidad as vendidas, canciones.nombre
from artistas
inner join albumes on albumes.id_artista = artistas.id
inner join canciones on canciones.id_album = albumes.id
inner join items_de_facturas on items_de_facturas.id_cancion = canciones.id
where artistas.nombre = "Caetano Veloso" AND canciones.milisegundos>240000 
order by vendidas asc;


select artistas.nombre, canciones.milisegundos as duracion, items_de_facturas.cantidad as vendidas, canciones.nombre
from artistas
inner join albumes on albumes.id_artista = artistas.id
inner join canciones on canciones.id_album = albumes.id
left join items_de_facturas on items_de_facturas.id_cancion = canciones.id
where artistas.nombre = "Caetano Veloso" AND canciones.milisegundos>240000
order by vendidas asc;

SELECT *
FROM canciones
LEFT JOIN items_de_facturas ON items_de_facturas.id_cancion=canciones.id
WHERE canciones.compositor LIKE "Caetano Veloso"
AND canciones.milisegundos>240000;

/*Crear una vista llamada FACTURAS_NACIONALES. 
La vista debe tener las siguientes columnas: 
id de factura, 
fecha de factura, 
id del cliente, 
nombre del cliente, 
apellido del cliente,
total de la factura, 
y solamente debe incluir las facturas de Argentina. 
Luego ejecutar SELECT * FROM FACTURAS_NACIONALES. ¿Cuántos registros devuelve la consulta?
*/

