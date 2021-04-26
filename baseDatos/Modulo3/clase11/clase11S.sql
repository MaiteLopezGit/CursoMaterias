/*EJERCICIO 9*/
/*Listar todos los usuarios que pagaron con QR y la fecha de pago
sea del 2020.*/
/*QR = EFECTIVO*/
select usuario.nombreusuario as Nombre, pagos.fechaPago as Fecha, tipoformapago.TipoFormaPago
from usuario
inner join suscripcion on suscripcion.idusuario = usuario.idUsuario 
inner join pagos on pagos.idPagos = suscripcion.idPagos
inner join datospagoxusuario on datospagoxusuario.idusuario = usuario.idusuario
inner join tipoformapago on datospagoxusuario.idTipoFormaPago = tipoformapago.idTipoFormaPago
where EXTRACT(year FROM pagos.fechaPago) = 2020 and tipoformapago.TipoFormaPago = "efectivo";

/*EJERCICIO 10*/
/*10. Generar un reporte de todas las canciones cuyo álbum no posee
imagen de portada.*/

select cancion.titulo, coalesce(album.imagenportada, "Sin imagen")
from album
inner join cancion on cancion.IdAlbum = album.idAlbum
where album.imagenportada is null;

/*EJERCICIO 11*/
/*11. Generar un reporte por género e informar la cantidad de canciones
que posee. Si una canción tiene más de un género, debe ser incluida
en la cuenta de cada uno de esos géneros.*/

select genero.Genero, count(genero)
from genero
inner join generoxcancion on genero.idGenero = generoxcancion.IdGenero
inner join cancion on cancion.idCancion = generoxcancion.IdCancion
group by genero.genero;


/*EJERCICIO 12*/
/*12. Listar todas las playlists que no están en estado activo y a qué
usuario pertenecen, ordenado por la fecha de eliminación.*/

select playlist.titulo, usuario.nombreusuario as Usuario
from playlist
inner join estadoplaylist on playlist.idestado = estadoplaylist.idEstadoPlaylist
inner join usuario on usuario.idUsuario = playlist.idusuario
where estadoplaylist.descripcion = "eliminada"
order by playlist.Fechaeliminada desc;

select *
