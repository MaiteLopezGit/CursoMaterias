use sakila;
/*Actividades*/
/*Ejercicio 1: Cuantos actores existen*/

select distinct first_name as Nombre, last_name as Apellido, actor_id
from actor;

/*Ejercicio 4*/
select count(amount), sum(amount)
from payment
inner join customer on customer.customer_id = payment.customer_id
where customer.customer_id = 10;


/*Ejercicio 5: mail con todas las peliculas de aacion*/
SELECT * , category.name as Genero
FROM sakila.film
JOIN film_category ON film.film_id = film_category.film_id
join category on category.category_id = film_category.category_id
having genero = "action" ;

/*Reportes*/
/*Reportes parte 1:*/
/*1. Obtener el nombre y apellido de los primeros 5 actores disponibles, utilizar
aliases para mostrar los nombres de las columnas en español.*/

select first_name as Nombre, last_name as Apellido
from actor
limit 5;

/*2. Obtener un listado que incluya nombre, apellido y correo electrónico de los
clientes (customers) inactivos, utilizar aliases para mostrar los nombres de
las columnas en español.*/

select first_name as Nombre, last_name as Apellido, email as Correo_Electronico
from customer
where active=0; 

/*3. Obtener un listado de films incluyendo título, año y descripción de los films
que tienen un rental_duration mayor a cinco. Ordenar por rental_duration de
mayor a menor y utilizar aliases para mostrar los nombres de las columnas
en español*/
select title as Titulo, release_year as Año, description as Descripcion
from film
where rental_duration >= 5
order by rental_duration desc;

/*4. Obtener un listado de alquileres (rentals) que se hicieron durante el mes de
mayo de 2005, incluir en el resultado todas las columnas disponibles.*/

SELECT *
FROM rental
WHERE EXTRACT(month FROM rental_date) = 5 AND EXTRACT(year FROM rental_date) = 2005;


/*Reportes parte 2: Sumemos complejidad*/
/*Si llegamos hasta acá tenemos en claro la estructura básica de un
SELECT. En los siguientes reportes vamos a sumar complejidad.
¿Probamos?*/

/*1. Obtener la cantidad TOTAL de alquileres (rentals), utilizar un alias para
mostrarlo en una columna llamada “cantidad”*/

/*2. Obtener la suma TOTAL de todos los pagos (payments), utilizar un alias para
mostrarlo en una columna llamada “total”, una columna con la cantidad de
alquileres con el alias “Cantidad”, y una columna que indique el “Importe
promedio” por alquiler.*/

/*3. Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes
que más dinero gastan y en cuantos alquileres lo hacen?*/
/*4. Generar un reporte que indique: id de cliente, cantidad de alquileres y monto
total para todos los clientes que hayan gastado más de 150 dólares en
alquileres.*/
/*5. Generar un reporte que muestre por mes de alquiler (rental_date de tabla
rental), la cantidad de alquileres y la suma total pagado (amount de tabla
payment) para el año de alquiler 2005 (rental_date de tabla rental).
Pista: Las tablas a utilizar son rental y payment.*/
/*6. Generar un reporte que responda a la pregunta: ¿cuáles son los 5 inventarios
más alquilados? (columna inventory_id en la tabla rental) para cada una de
ellas indicar la cantidad de alquileres.*/