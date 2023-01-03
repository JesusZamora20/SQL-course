# eliminar la base de datos ya existente
# drop database if exists curso_sql;

#show databases;

drop table if exists usuario;

create table if not exists usuario (
	nombre varchar(50),
    apellido varchar(50),
    email varchar(50),
    primary key(email)
);

describe producto;
select * from producto;
create table if not exists producto(
	id int(11) auto_increment,
    nombre varchar(50),
    descripcion text,
    precio float(11,2),
    primary key(id)
);

insert into producto
values(null,'iPhone 11','Apple Iphone 11 de 256gb',126.65);

insert into producto
values(null,'iPad pro','Apple iPad pro de 10 pulgadas',345.65);

# borrar todos los registros en una tabla
truncate table producto;