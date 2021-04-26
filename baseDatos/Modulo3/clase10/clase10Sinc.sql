use emarket;

/*Clientes*/
/*1) ¿Cuántos clientes existen?*/
select count(ClienteID)
from clientes;

/*2) ¿Cuántos clientes hay por ciudad*/
select count(Ciudad), ciudad
from clientes
group by ciudad; 

/*Facturas*/

/*1) ¿Cual es el total de transporte?*/
select sum(Transporte)
from facturas;

/*2) ¿Cual es el total de transporte por EnvioVia (empresa de envío)?*/
select sum(transporte),envioVia
from facturas
group by envioVia;

/*3) Calcular la cantidad de facturas por cliente. Ordenar descendentemente por
cantidad de facturas.*/
select count(FacturaID), ClienteID
from facturas
group by clienteID
order by count(FacturaID) desc;

/*4) Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.*/
select count(FacturaID), ClienteID
from facturas
group by clienteID
order by count(FacturaID) desc
limit 5;

/*5) ¿Cual es el país de envío menos frecuente de acuerdo a la cantidad de facturas? Mexico*/
select count(FacturaID) as Fact, PaisEnvio
from facturas
group by paisEnvio
order by Fact asc
limit 5;

/*6) Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado
realizó más operaciones de ventas? 9*/
select count(*),EmpleadoID
from facturas
group by EmpleadoID
/*having count(*)>100 100 mas ventas*/
order by count(*) desc
limit 1;

/*Factura detalle*/

/*1) ¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?*/
select count(*),ProductoID
from facturadetalle
group by ProductoID
order by count(*) desc;

/*2) ¿Cuál es el total facturado? Considerar que el total facturado es la suma de
cantidad por precio unitario.*/
select sum(PrecioUnitario*Cantidad)
from facturadetalle;


/*3) ¿Cuál es el total facturado para los productos ID entre 30 y 50?*/
select sum(PrecioUnitario*Cantidad)
from facturadetalle
where ProductoID between 30 and 50;

/*4) ¿Cuál es el precio unitario promedio de cada producto?*/
select avg(PrecioUnitario),ProductoID
from facturadetalle
group by ProductoID;

/*5) ¿Cuál es el precio unitario máximo?*/
select max(PrecioUnitario)
from facturadetalle;

/*SEGUNDA PARTE*/

/*1) Generar un listado de todas las facturas del empleado 'Buchanan'.*/
select facturas.facturaID,empleados.EmpleadoID,empleados.apellido,clienteID
from empleados
inner join facturas on empleados.EmpleadoID= facturas.EmpleadoID
having empleados.apellido = "buchanan";

/*2) Generar un listado con todos los campos de las facturas del correo 'Speedy
Express'   envioVia = idCorreo*/
select *
from correos
select
from facturas
inner join correos on correos.CorreoID = 