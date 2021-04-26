/*EJERCICIO1*/
use proyecto_spotify;
select IdTipoUsuario, count(*) 
from usuario
group by IdTipoUsuario ;

/*EJERCICIO2*/
select titulo
from album
where titulo like "%z%";

/*EJERCICIO3*/
select idusuario, count(cantcanciones) as cant_canciones, avg(cantcanciones), max(cantcanciones), min(cantcanciones)
from playlist
group by idusuario;

/*EJERCICIO4*/
select idPlaylist, titulo, max(cantcanciones)
from playlist;

/*EJERCICIO5*/
select fecha_nac, nombreusuario
from usuario
order by fecha_nac asc
limit 10;

/*EJERCICIO6*/
/*Listar los 10 usuarios más longevos.*/
select fecha_nac,nombreusuario
from usuario
order by fecha_nac asc
limit 10;

/*EJERCICIO7*/
/*Listar las 5 canciones con más likes, ordenadas descendentemente.*/
select titulo, cantlikes
from cancion
order by cantlikes desc
limit 5;

/*EJERCICIO8*/
/* Generar un reporte de todos los artistas ordenados alfabéticamente.*/
select *
from artista
order by nombre asc;

/*EJERCICIO9*/
/* Listar por país la cantidad de usuarios que posee.*/
select Pais_idPais,count(idUsuario)
from usuario
group by Pais_idPais;

/*EJERCICIO10*/
/*Listar la última fecha de creación de una playlist cuyo título incluya
una A.*/
select Fechacreacion,titulo
from playlist
where titulo like "%a%"
order by fechacreacion desc
limit 1;

/*- Ejercicio 15*/
/* Generar un listado de los países con la cantidad de discográficas
 que posee cada uno, utilizando el código de país.*/

select idPais, count(idPais) 
from discografica 
group by idPais;

-- Ejercicio 11
/* Listar de las passwords históricas, las 3 más utilizadas, cuántas
veces se utilizaron y la primera fecha que se utilizó y la última.*/

SELECT Password, count(Password) as Veces_Usada, min(Fecha) as Primera_Vez, max(fecha) as Ultima_Vez
FROM passwordxusuario
GROUP BY Password
ORDER BY count(Password) desc
limit 3;

/*
  Ej 12
  Insertar un usuario nuevo, con los siguientes datos, tener en cuenta las relaciones.
	• nombreusuario: miusuariodespotify@gmail.com
	• Nombre y apellido: Evangelina Gomez
	• password: S1234m
	• Fecha de nacimiento: 15/11/1995
	• Sexo: Femenino
	• Código Postal: B1429ATF
	• País: Argentina
	• Suscripción: Free
*/
SELECT idPais
FROM pais
WHERE Pais = 'Argentina';    	-- 1

SELECT idTipoUsuario
FROM tipousuario
WHERE TipoUsuario = 'free';  	-- 3

SELECT MAX(idUsuario)		 	-- 19 entonces el nuevo a insertar debe tener id >= 20
FROM usuario;

INSERT INTO usuario (idUsuario, nombreusuario, nyap, password, fecha_nac, sexo, CP, Pais_idPais, IdTipoUsuario)
VALUES (20, 'miusuariodespotify@gmail.com', 'Evangelina Gomez', 'S1234m', 15/11/1995, 'F', 'B1429ATF', 1, 3);

SELECT MAX(idPasswordxUsuario)  -- 56 entonces el nuevo a insertar debe tener id >= 56
FROM passwordxusuario;

INSERT INTO passwordxusuario (idPasswordxUsuario, idUsuario, Password)
VALUES (57, 20, 'S1234m');

-- Ejercicio 13
/*Insertar un nuevo método de pago, que sea QR y,
luego, modificar todos los usuarios que tienen como
método pago en efectivo por el nuevo método QR.*/

select * from tipoformapago;
insert into tipoformapago 
values (5, "QR");

-- Efectivo idTipoFormaPago = 1

update datospagoxusuario
set idTipoFormaPago = 5
where idTipoFormaPago = 1;

-- Ejercicio 14
/*Eliminar todas las canciones de género trap*/

select * from genero;
-- Trap idGenero = 12
select * from generoxcancion
where IdGenero = 12;

select * from generoxcancion
order by IdGenero asc;

