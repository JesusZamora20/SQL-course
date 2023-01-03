#alter table
use curso_sql;

#alter table add

drop table productos;

create table productos(
id int unsigned not null,
nombre varchar(50)
);

describe productos;
select * from productos;

# agregando campo con ADD
alter table productos add precio int;
alter table productos add cantidad smallint unsigned not null;

#3 eliminar un campo 
alter table productos drop precio;
alter table productos drop precio, drop cantidad;

# modificar un campo con modify
alter table productos modify tituloP varchar(300) not null;
alter table productos modify precio decimal(5,2) not null;

# cambiar el nombre de un campo con CHANGE
alter table productos change cantidad stock int;
alter table productos change nombre tituloP varchar(50) not null;

#agregando y eliminando clave primaria
alter table productos add primary key(id);
alter table productos modify id int unsigned auto_increment not null;

# para eliminar la primary key primero se necesita eliminar el auto increment y el not null
alter table productos modify id int unsigned;
alter table productos drop primary key;

# agregar y eliminar los indices de una tabla
alter table productos add index i_precio (precio);
show index from productos;
alter table productos drop index i_precio;




