use musimundos;

/*Hagamos una consulta en la base de datos donde muestre todos los registros que contengan canciones con sus géneros, 
Y que el compositor sea Willie Dixon,
Y que tengan el género Blues.*/
select generos.nombre, generos.id, canciones.nombre, canciones.compositor, canciones.id_genero
from canciones, generos
where canciones.id_genero = generos.id
and canciones.compositor = "willie Dixon"
and generos.nombre = "Blues";


/*Hacé una consulta a nuestra base de datos que nos devuelva los nombres de las canciones que tengan género rock.*/
select canciones.id_genero, canciones.nombre, generos.id 
from canciones
inner join generos on canciones.id_genero = generos.id
and generos.nombre = "Rock";

/* este quiere comprar todos los álbumes que tengan como artista a Deep Purple.
Hacé una consulta a nuestra base de datos que nos traiga el título del álbum y el autor, para saber si lo que le estamos vendiendo es correcto.*/

select albumes.titulo,albumes.id_artista,artistas.id,artistas.nombre
from artistas
inner join albumes on albumes.id_artista = artistas.id
and artistas.nombre ="Deep purple";

/*Para evitar posibles problemas de compatibilidad, 
los desarrolladores decidieron que sólo van a subir canciones que tengan el tipo de medio "MPEG audio file".
Ayuda al equipo y obtengamos una lista en las cuales tengas el nombre de las canciones que tengan ese tipo de medio.*/

select canciones.nombre, tipos_de_medio.nombre, tipos_de_medio.id,canciones.id_tipo_de_medio
from canciones
inner join tipos_de_medio on tipos_de_medio.id = canciones.id_tipo_de_medio
and tipos_de_medio.nombre="MPEG audio file";

/* hacé una consulta a nuestra base de datos que nos brinde el título de los cargos que tengan todos los empleados sin repetirse.*/
select distinct empleados.titulo 
from empleados;

/*Para ello, te piden que le pasemos el nombre de todas las canciones que están en una playlist, y el nombre de la playlist a la que pertenecen.
Ojo! Tengamos cuidado de no repetir el nombre de las canciones. 
Para esta consulta vamos a tener que usar información de las tablas canciones, canciones_de_playlists y playlists.*/
select distinct canciones.nombre
from canciones_de_playlists
inner join playlists on playlists.id = canciones_de_playlists.id_playlist
inner join canciones on canciones.id = canciones_de_playlists.id_cancion;

/*"La canción " (nombre del tema) " fue compuesta por " (compositor del tema).
Hacé una consulta a nuestra base de datos que nos traiga el nombre y el compositor de cada tema, 
sin repeticiones y agregando el texto que el equipo de desarrollo nos mencionaba.
Ojo! Tené en cuenta los espacios dentro de los textos que nos pidieron añadir.*/

select distinct concat("La canción ", nombre, " fue compuesta por ", compositor) 
from canciones;

/*Hacé una consulta a la base de datos que nos traiga la primer columna no nula que encuentre entre las columnas
 estado_o_provincia_de_facturacion, pais_de_facturacion y codigo_postal_de_facturacion.*/
select coalesce(estado_o_provincia_de_facturacion,pais_de_facturacion,codigo_postal_de_facturacion)
from facturas; 

/*Hacé una consulta la base de datos que traiga la diferencia entre su fecha de nacimiento y la fecha de contratación.
TIP: Recordá que DATEDIFF() retorna la diferencia entre las fechas expresada en DÍAS. 
Teniendo esto en cuenta y sabiendo que un año pretende tener 365, cómo realizarías la consulta?
Para darte una ayuda, te presentamos la función FLOOR(), que redondea cualquier número con decimales hacia abajo.*/

select floor(datediff(fecha_de_contratacion,fecha_nacimiento)/365) 
from empleados;

/*Hacé una consulta a la base de datos que traiga todas las facturas del cliente número 2 ordenadas por su fecha y extrae el mes de la misma.*/

select facturas.id_cliente, clientes.id, extract(month from facturas.fecha_factura) 
from facturas
inner join clientes on clientes.id = facturas.id_cliente
where clientes.id = 2