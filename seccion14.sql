#triggers
CREATE DATABASE IF NOT EXISTS disparadores_triggers;
USE disparadores_triggers;

drop table if exists usuarios;
drop table if exists clavesanteriores;


create table usuarios(
 nombre varchar(30),
 clave varchar(30),
 primary key (nombre)
);

create table clavesanteriores(
 numero int auto_increment,
 nombre varchar(30),
 clave varchar(30),
 primary key (numero)
);

# creacion basica de un trigger
create trigger NOMBRETRIGGER
[before/ after] [insert / delete/ update]
on TABLA
for each now 
begin
end

drop trigger if exists nombretrigger;

delimiter //
create trigger be_usuariosupdate
before update
on usuarios
for each row
begin
	insert into clavesanteriores(nombre, clave) values (old.nombre, old.clave);
end //
delimiter ;

insert into usuarios value('Juan', '1234');
select * from usuarios;

select * from clavesanteriores;
 
update usuarios set clave = '5678' where nombre = 'Juan'; 

#triggers insert
drop table if exists ventas;
drop table if exists libros;

create table libros(
  codigo int auto_increment,
  titulo varchar(50),
  autor varchar(50),
  editorial varchar(30),
  precio float, 
  stock int,
  primary key (codigo)
 );

 create table ventas(
  numero int auto_increment,
  codigolibro int,
  precio float,
  cantidad int,
  primary key (numero)
 );


 insert into libros(titulo, autor, editorial, precio, stock)
  values('Uno','Richard Bach','Planeta',15,100);   
 insert into libros(titulo, autor, editorial, precio, stock)
  values('Ilusiones','Richard Bach','Planeta',18,50);
 insert into libros(titulo, autor, editorial, precio, stock)
  values('El aleph','Borges','Emece',25,200);
 insert into libros(titulo, autor, editorial, precio, stock)
  values('Aprenda PHP','Mario Molina','Emece',45,200);
  
delimiter //
create trigger be_ventasinsert
before insert
on ventas 
for each row
begin
	update libros set stock = libros.stock-new.cantidad
    where new.codigolibro = libros.codigo;
end //
delimiter ;

drop trigger be_ventasinsert;
select * from libros;
insert into ventas(codigolibro, precio, cantidad) value(3, 25, 2);


#triggers delete
delimiter //
create trigger be_ventasdelete
before delete
on ventas 
for each row
begin
	update libros set stock=libros.stock + old.cantidad 
    where old.codigolibro = libros.codigo;
end //
delimiter ;

delete from ventas where numero=1; 

select * from libros;



