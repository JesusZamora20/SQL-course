create database curso_sql;
show databases;
use curso_sql;

-- crear una tabla
create table usuario(
	nombre varchar(50),
    edad int(15)
);

-- mostrar tablas
show tables;

-- describir una tabla
describe usuario;
describe alumnos;

-- eliminar una tabla
drop table producto;