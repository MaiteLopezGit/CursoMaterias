/*BD UNIVERSOLECTOR*/
/*NO OLVIDARSE LAS COMAS*/
/*NO OLVIDARSE EL ATRIBUTO DE LA FK DENTRO DE LA TABLA*/

CREATE SCHEMA UNIVERSO_LECTOR;

CREATE TABLE SOCIO (
id_socio INT NOT NULL,
apellido VARCHAR (100),
nombres VARCHAR (100),
direccion VARCHAR (200),
localidad VARCHAR (100),
PRIMARY KEY (id_socio));

CREATE TABLE AUTOR (
id_autor INT NOT NULL,
apellido VARCHAR(100),
nombre VARCHAR(100),
PRIMARY KEY (id_autor));

CREATE TABLE EDITORIAL (
id_editorial INT NOT NULL,
razon_social VARCHAR (100),
telefono VARCHAR (100),
PRIMARY KEY (id_editorial));

CREATE TABLE TELEFONOXSOCIO (
id_telefonoxsocio INT NOT NULL,
nroTelefono VARCHAR(100),
socio INT NOT NULL,
PRIMARY KEY (id_telefonoxsocio),
CONSTRAINT FKsocio
	FOREIGN KEY (socio)
    REFERENCES UNIVERSO_LECTOR.socio (id_socio));
    
CREATE TABLE PRESTAMO (
id_prestamo INT NOT NULL,
fecha DATETIME,
fecha_devolucion DATE,
fecha_tope DATE,
socio INT NOT NULL,
PRIMARY KEY (id_prestamo),
CONSTRAINT socio
	FOREIGN KEY (socio)
    REFERENCES UNIVERSO_LECTOR.socio (id_socio));

CREATE TABLE LIBRO (
id_libro INT NOT NULL,
ISBN VARCHAR(200),
titulo VARCHAR (200),
anio_escritura DATE,
anio_edicion DATE,
autor INT NOT NULL,
editorial INT NOT NULL,
PRIMARY KEY (id_libro),
CONSTRAINT autor
	FOREIGN KEY (autor)
    REFERENCES universo_lector.autor (id_autor),
CONSTRAINT editorial
	FOREIGN KEY (editorial)
    REFERENCES universo_lector.editorial (id_editorial));

CREATE TABLE VOLUMEN (
id_volumen INT NOT NULL,
deteriorado BOOLEAN,
libro INT NOT NULL,
PRIMARY KEY (id_volumen),
CONSTRAINT libro
	FOREIGN KEY (libro)
    REFERENCES universo_lector.libro (id_libro));

CREATE TABLE PRESTAMOxVOLUMEN (
id_prestamoxvolumen INT NOT NULL,
prestamo INT NOT NULL,
volumen INT NOT NULL,
PRIMARY KEY (id_prestamoxvolumen),
CONSTRAINT prestamo
	FOREIGN KEY (prestamo)
    REFERENCES universo_lector.prestamo (id_prestamo),
CONSTRAINT volumen
	FOREIGN KEY (volumen)
    REFERENCES universo_lector.volumen (id_volumen));
    
INSERT INTO universo_lector.autor
(id_autor,apellido,nombre)
VALUES
(1,"MAITE","LOPEZ"),
(2,"iVAN","GARCIA");

select * FROM autor


