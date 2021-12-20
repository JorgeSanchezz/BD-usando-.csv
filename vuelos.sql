DROP DATABASE vuelos;
CREATE DATABASE vuelos;
use vuelos;

CREATE TABLE aeropuerto (
	idAeropuerto char (3),
	nombre varchar (15),
	ciudad varchar (30),
	pais varchar (30)
);
CREATE TABLE modelo (
	idModelo int primary key not null auto_increment,
	nombre varchar (30),
	capacida int
);
CREATE TABLE avion (
	idAvion int primary key not null auto_increment,
	idModelo int,
	FOREIGN KEY(idModelo) REFERENCES modelo(idModelo)
);
CREATE TABLE aerolinea (
	idAerolinea int primary key not null auto_increment,
	pais varchar (20),
	nombre varchar (30)
);
CREATE TABLE programa(
	idPrograma int primary key not null,
	dia varchar(30),
	hora varchar(30),
	origen varchar (30),
	destino  varchar (30),
	idAerolinea int,
	FOREIGN KEY(idAerolinea) REFERENCES aerolinea (idAerolinea)
);
CREATE TABLE vuelo (
	idVuelo int primary key not null,
	dia varchar(20),
	hora varchar(20),
	idPrograma int,
	FOREIGN KEY (idPrograma) REFERENCES programa (idPrograma),
	idAvion int,
	FOREIGN KEY (idAvion) REFERENCES avion (idAvion),
	plazasVacias int
);

load data local infile 'modelo.csv' into table modelo fields
terminated by ',' lines terminated by '\n';
SELECT * FROM modelo;

load data local infile 'aeropuerto.csv' into table aeropuerto fields
terminated by ',' lines terminated by '\n';
SELECT * FROM aeropuerto \G;

load data local infile 'avion.csv' into table avion fields
terminated by ',' lines terminated by '\n';
SELECT * FROM avion;

load data local infile 'aerolinea.csv' into table aerolinea fields
terminated by ',' lines terminated by '\n';
SELECT * FROM aerolinea \G;

load data local infile 'programa.csv' into table programa fields
terminated by ',' lines terminated by '\n';
SELECT * FROM programa;

load data local infile 'vuelo.csv' into table vuelo fields
terminated by ',' lines terminated by '\n';
SELECT * FROM vuelo;