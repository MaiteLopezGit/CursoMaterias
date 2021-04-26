use emarket;

/*PARTE I*/
/*CATEGORIAS Y PRODUCTOS*/
/*EJERCICI1*/
SELECT CategoriaNombre,Descripcion
FROM categorias
order by CategoriaNombre;

/*EJERCICIO4*/
select Discontinuado,ProductoNombre
from productos
where Discontinuado=1
order by ProductoNombre;

/*EJERCICIO5*/
select ProductoNombre
from productos
where ProveedorID=8
order by ProductoNombre;

/*EJERCICIO 6*/
select ProductoNombre, PrecioUnitario
from productos
where PrecioUnitario between 10 and 22
order by precioUnitario, ProductoNombre asc;

/*EJERCICIO 7*/
select ProductoNombre, UnidadesStock,NivelReorden
from productos
where UnidadesStock<NivelReorden
order by ProductoNombre asc, NivelReorden asc;

/*EJERCICIO 8*/
select ProductoNombre, UnidadesStock,NivelReorden,UnidadesPedidas
from productos
where (UnidadesStock<NivelReorden)and (UnidadesPedidas=0)
order by ProductoNombre asc, NivelReorden asc;

/*CLIENTES*/
/*EJERCICIO1*/
select contacto, Compania,Titulo,Pais
from clientes
order by pais asc;

/*EJERCICIO2*/
select contacto, Compania,Titulo,Pais
from clientes
where titulo='owner'
order by pais asc;

select contacto, Compania,Titulo,Pais
from clientes
where contacto like 'c%'
order by pais asc;

/*FACTURA*/
/*EJERCICIO1*/
select facturaID, clienteID, FechaFactura 
from facturas
order by fechaFactura asc;

/*EJERCICIO2*/
select facturaID, clienteID, FechaFactura, EnvioVia,paisEnvio 
from facturas
WHERE PaisEnvio ='USA' and EnvioVia!=3
order by fechaFactura asc;

/*EJERCICIO3*/
select facturaID, clienteID, FechaFactura, EnvioVia,paisEnvio 
from facturas
WHERE clienteID like 'GOUrl'
order by fechaFactura asc;

/*EJERCICIO3*/
select facturaID, FechaFactura, empleadoID
from facturas
WHERE EmpleadoID  in (2,3,5,8,9)
order by fechaFactura asc;

/*PARTE II*/
/*PRODUCTOS*/
/*EJERCICIO1*/

select ProductoNombre,PrecioUnitario
from productos
order by PrecioUnitario desc;

/*EJERCICIO2*/
select ProductoNombre,PrecioUnitario
from productos
order by PrecioUnitario desc
limit 5;

/*EJERICICIO3*/
select ProductoNombre,UnidadesStock
from productos
order by UnidadesStock desc
limit 10;

/*FACTURA DETALLE*/
/**EJERCICIO1*/
SELECT FacturaID,ProductoID,Cantidad
FROM facturadetalle;

/*EJERCICIO2*/
SELECT FacturaID,ProductoID,Cantidad
FROM facturadetalle
order by  cantidad desc;

/*EJERCICIO2*/
SELECT FacturaID,ProductoID,Cantidad
FROM facturadetalle
ORDER BY cantidad desc;

SELECT FacturaID,ProductoID,Cantidad
FROM facturadetalle
order by cantidad desc
limit 50
offset 100;

