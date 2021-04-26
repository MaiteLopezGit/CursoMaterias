drop database universo_lector;
CREATE SCHEMA universo_lector; /*aca creo la base de datos*/
use universo_lector;

CREATE TABLE autor (
  codigo INT NOT NULL,
  apellido VARCHAR(100) NULL,
  nombre VARCHAR(100) NULL,
  PRIMARY KEY (codigo));

CREATE TABLE socio (
  codigo INT NOT NULL,
  DNi INT NOT NULL,
  apellido VARCHAR(100) NULL,
  nombre VARCHAR(100) NULL,
  direccion VARCHAR(200) NULL,
  localidad VARCHAR(100) NULL,
  PRIMARY KEY (codigo));

CREATE TABLE telefonoxsocio (
  codigo INT NOT NULL,
  nrotelefono VARCHAR(100) NULL,
  codigo_socio INT NOT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT FKsocio FOREIGN KEY (codigo_socio) REFERENCES socio (codigo));

CREATE TABLE editorial (
  codigo INT NOT NULL,
  razon_social VARCHAR(100) NULL,
  telefono VARCHAR(100) NULL,
  PRIMARY KEY (codigo));
  

CREATE TABLE libro(
  codigo INT NOT NULL,
  ISBN VARCHAR(13) NULL,
  titulo VARCHAR(200) NULL,
  anio_escritura varchar(4) NULL,
  codigo_autor int NOT NULL,
  anio_edicion varchar(4) NULL,
  codigo_editorial int NOT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT FKautor FOREIGN KEY (codigo_autor) REFERENCES autor (codigo),
  CONSTRAINT FKeditorial FOREIGN KEY (codigo_editorial) REFERENCES editorial (codigo));

CREATE TABLE volumen (
  codigo INT NOT NULL,
  codigo_libro INT NOT NULL,
  deteriorado boolean NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT FKlibro FOREIGN KEY (codigo_libro) REFERENCES libro (codigo));

CREATE TABLE prestamo (
  codigo INT NOT NULL,
  codigo_socio INT NOT NULL,
  fecha date NOT NULL,
  fecha_devolucion date NOT NULL,
  fecha_tope date NOT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT FKsocioprestamo FOREIGN KEY (codigo_socio) REFERENCES socio (codigo));

CREATE TABLE prestamoxvolumen (
  codigo INT NOT NULL,
  codigo_volumen INT NOT NULL,
  codigo_prestamo INT NOT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT FKvolumen FOREIGN KEY (codigo_volumen) REFERENCES prestamo (codigo),
  CONSTRAINT FKprestamo FOREIGN KEY (codigo_prestamo) REFERENCES volumen (codigo));

INSERT INTO socio (codigo, DNI, apellido, nombre, direccion, localidad)
VALUES 
(1,	3000000, 'PATRICIA', 'JOHNSON',	'28 MySQL Boulevard', 'QLD'),
(2,	2988800, 'LINDA',	'WILLIAMS', '23 Workhaven Lane','Alberta'),
(3,	2500000, 'BARBARA',	'JONES',	'1411 Lillydale Drive',	'QLD'),
(4,	32980002,	'LOIS',	'BUTLER',	'1688 Okara Way',	'Nothwest Border Prov'),
(5,	2313909,	'ROBIN',	'HAYES',	'262 A Corua (La Corua) Parkway',	'Dhaka');

INSERT INTO telefonoxsocio (codigo, nrotelefono, codigo_socio)
VALUES (1,	'54911-45636453',	1),
(2,	'54-11-47867654',	1),
(3,	'11498-2173',	2),
(4,	'11684736',	3),
(5,	'(54)-(911)-423-2434',	4);

INSERT INTO autor (codigo, apellido, nombre)
VALUES 
(1,	'Rowling', 'J. K. ');


INSERT INTO editorial (codigo, razon_social, telefono)
VALUES 
(1,	'Bloomsbury Publishing',	'54911564874'),
(2,	'Scholastic',	'223483646'),
(3,	'Pottermore Limited',	'5694839582'),
(4,	'Editorial Salamandra', 	'011-239-2343');


INSERT INTO libro (codigo, ISBN, titulo, anio_escritura, codigo_autor, anio_edicion, codigo_editorial)
VALUES 
(1,	'9781907545009',	'Harry Potter y la piedra filosofal',	1997,	1,	1997,	4),
(2,	'9789878000114',	'Harry Potter Y La Camara Secreta', 	2020,	1,	2020,	4);

INSERT INTO volumen (codigo, codigo_libro, deteriorado)
VALUES 
(1,	1,	0),
(2,	1,	0),
(3,	2,	0);

INSERT INTO prestamo (codigo, codigo_socio, fecha, fecha_devolucion, fecha_tope)
VALUES 
(1,	1,	1/1/2020,	7/1/2020,	7/1/2020),
(2,	1,	7/1/2020,	15/1/2020,	14/1/2020),
(3,	2,	4/3/2020,	8/3/2020,	11/3/2020);

INSERT INTO prestamoxvolumen (codigo, codigo_prestamo, codigo_volumen)
VALUES 
(1,	1,	1),
(2,	2,	2),
(3,	3,	1),
(4,	3,	3);

select * from socio
/* eliminación de un socio*/
DELETE FROM socio WHERE codigo = 5;

/* eliminación de un libro con volumen asociado*/

DELETE FROM `universo_lector`.`socio` WHERE (`codigo` = '3');