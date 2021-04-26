CREATE SCHEMA spotify;
USE spotify;

CREATE TABLE TipoDeServicios (
  codigo INT NOT NULL AUTO_INCREMENT,
  detalle VARCHAR(100) NULL,
	PRIMARY KEY (codigo)
);

CREATE TABLE FormasDePago ( 
	codigo INT NOT NULL,
    detalle varchar(100),
	marca varchar(100),
	cbu int,
	alias varchar(100),
	digitos smallint unsigned NOT NULL,
	fecha_vencimiento date,
	PRIMARY KEY (codigo)
);

CREATE TABLE Playlists (
codigo INT NOT NULL,
titulo VARCHAR(200) NOT NULL,
nro_canciones INT NOT NULL,
fecha_creación DATE,
estado BOOL,
primary key (codigo)
);

CREATE TABLE Suscripciones (
  codigo INT NOT NULL AUTO_INCREMENT,
  fecha_inicio DATE NULL, 
  fecha_renovacion DATE NULL, 
  codigo_forma_de_pago INT,
  codigo_tipo_de_servicio INT,
  PRIMARY KEY (codigo),
  CONSTRAINT FKforma_de_pago 
	FOREIGN KEY (codigo_forma_de_pago)    
    REFERENCES FormasDePago(codigo),
  CONSTRAINT FKtipo_de_servico
	FOREIGN KEY (codigo_tipo_de_servicio)    
    REFERENCES TipoDeServicios(codigo)
);

CREATE TABLE Discograficas (
  codigo INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NULL, 
  pais VARCHAR(100) NULL, 
  PRIMARY KEY (codigo)
);

CREATE TABLE Artistas (
  codigo INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NULL, 
  url_imagen VARCHAR(100) NULL,
  PRIMARY KEY (codigo)
);

CREATE TABLE Albums (
  codigo INT NOT NULL AUTO_INCREMENT,
  codigo_artista INT NOT NULL,
  codigo_discografica INT NOT NULL,
  titulo VARCHAR(100) NULL, 
  anio_publicacion YEAR NULL,
  url_portada VARCHAR(100) NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT FKartista 
	FOREIGN KEY (codigo_artista) 
    REFERENCES Artistas(codigo),
  CONSTRAINT FKdiscografica 
	FOREIGN KEY (codigo_discografica) 
    REFERENCES Discograficas(codigo)
);

CREATE TABLE Generos (
  codigo INT NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(100) NULL,
  PRIMARY KEY (codigo)
);

CREATE TABLE Canciones (
	codigo INT NOT NULL,
	codigo_album INT NOT NULL,
	titulo VARCHAR(200),
	duracion_milisegundos INT,
	reproducciones INT,
	likes INT,
	PRIMARY KEY (codigo),
	CONSTRAINT FKalbum 
		FOREIGN KEY (codigo_album) 
        REFERENCES Albums(codigo)
);

CREATE TABLE Genero_Por_Cancion (
  codigo INT NOT NULL AUTO_INCREMENT,
  codigo_genero INT NULL,
  codigo_cancion INT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT FKgenero 
	FOREIGN KEY (codigo_genero) 
    REFERENCES Generos(codigo),
  CONSTRAINT FKcancion 
	FOREIGN KEY (codigo_cancion) 
    REFERENCES Canciones(codigo)
);

CREATE TABLE Usuarios (
  codigo INT NOT NULL,
  email VARCHAR(100) NULL,
  pasword VARCHAR(100) NULL,
  fecha_nacimiento DATE NULL,
  sexo VARCHAR(100) NULL,
  codigo_postal INT NULL,
  pais VARCHAR(100) NULL,
  codigo_suscripcion INT NOT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT FKsuscripcion
    FOREIGN KEY (codigo_suscripcion)
    REFERENCES Suscripciones (codigo)
);

CREATE TABLE Cancion_Por_Playlist (
  codigo INT NOT NULL AUTO_INCREMENT,
  codigo_playlist INT NULL,
  codigo_cancion INT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT FKplaylist 
	FOREIGN KEY (codigo_playlist) 
    REFERENCES Playlists(codigo),
  CONSTRAINT FK_cancion
	FOREIGN KEY (codigo_cancion) 
    REFERENCES Canciones(codigo)
);

INSERT INTO Discograficas
	(nombre, pais)
VALUES
	("Discografica 1", "Pais 1");

INSERT INTO Artistas
	(nombre, url_imagen)
VALUES
	("Pepe", "www.pepe.com/pepe.png"),
	("Pepe", "www.pepe.com/pepe.png");

INSERT INTO Albums 
	(codigo, codigo_artista, codigo_discografica, titulo, anio_publicacion, url_portada)
VALUES 
	(1,	1, 1,"tormentaElectrica",2015,"www.ratablanca.net/discos.html"),
	(2,	1,	1,"tormentaElectrica2",2016,"www.ratablanca.net/discos.html"),
	(3,	1,	1,"tormentaElectrica3",2017,"www.ratablanca.net/discos.html");


INSERT INTO Canciones 
	(codigo, codigo_album, titulo, duracion_milisegundos, reproducciones, likes)
VALUES
	(1, 1, "El sapo pepe", 4000, 5000, 1000),
	(2, 1, "El sapo pepe 2", 8000, 20000, 10000),
	(3, 2, "La sapa pepa", 4000, 100000, 50000);

INSERT INTO tipodeservicios 
	(codigo, detalle)
VALUES 
	(1,	"free"),
	(2,	"estandar"),
	(3, "premium");
    
INSERT INTO FormasDePago
	(codigo, detalle, marca, cbu, alias, digitos, fecha_vencimiento)
VALUES    
	(1, "tarjeta", "visa", 1234, "gato",1324,"2021-12-3");

INSERT INTO Suscripciones 
	(codigo, fecha_inicio, fecha_renovacion, codigo_forma_de_pago, codigo_tipo_de_servicio)
VALUES 
	(1,	"2000/12/03", "2021-12-3", 1, 1),
	(2,	"2010/10/03", "2015-12-3", 1, 1),
	(3,	"2012/10/03", "2020-12-3", 1, 1);
    
INSERT INTO Usuarios
values (1, "ctd@gmail.com", "gbfg541ghb", 1/1/1980, "Mujer", 110664, "Colombia", 1),
(2, "ctd@hotmail.com", "lñ674uj", 1/1/1985, "Hombre", 4025, "Argentina", 2),
(3, "ctd@outlook.com", "hjm4rfd", 1/1/1990, "Mujer", 3350, "Colombia", 3);
    
select * FROM ALBUMS

