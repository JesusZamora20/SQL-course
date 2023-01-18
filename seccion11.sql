#subconsultas
CREATE DATABASE IF NOT EXISTS subconsultas;
USE subconsultas;

CREATE TABLE IF NOT EXISTS libros(
  codigo int auto_increment,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  primary key(codigo)
);

insert into libros(titulo,autor,editorial,precio) 
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',20.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Plaza',35.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Siglo XXI',40.00);
 insert into libros(titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',10.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Ilusiones','Richard Bach','Planeta',15.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Planeta',20.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',30.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Uno','Richard Bach','Planeta',10.00);
  
select * from libros;

#sintaxis basica
select campos from tabla where campo operador(subconsulta);
select campo operador(subconsulta) from tabla;

select titulo, precio, precio-(select max(precio) from libros) as diferencia from libros where titulo='Uno';
select titulo, precio, precio-(select max(precio) from libros) as diferencia from libros;

select titulo, autor, precio from libros where precio = (select max(precio) from libros);

#in y not in

drop table if exists editoriales;
drop table if exists libros;

 create table editoriales(
  codigo int auto_increment,
  nombre varchar(30),
  primary key (codigo)
 );
 
create table libros (
  codigo int auto_increment,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial smallint,
  precio decimal(5,2),
  primary key(codigo)
 );

 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Paidos');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial,precio) values('Uno','Richard Bach',1,15);
 insert into libros(titulo,autor,codigoeditorial,precio) values('Ilusiones','Richard Bach',4,18);
 insert into libros(titulo,autor,codigoeditorial,precio) values('Puente al infinito','Richard Bach',2,20);
 insert into libros(titulo,autor,codigoeditorial,precio) values('Aprenda PHP','Mario Molina',4,40);
 insert into libros(titulo,autor,codigoeditorial,precio) values('El aleph','Borges',2,10);
 insert into libros(titulo,autor,codigoeditorial,precio) values('Antología','Borges',1,20);
 insert into libros(titulo,autor,codigoeditorial,precio) values('Cervantes y el quijote','Borges',3,25);
 
select * from libros;
select * from editoriales;

select nombre from editoriales where codigo in (select codigoeditorial from libros where autor='Richard Bach');
select nombre from editoriales where codigo not in (select codigoeditorial from libros where autor='Richard Bach');

#subconsultas Any - Some- All
#ver si los libros de bordes coinciden con alguna editorial que haya publicado libros de richard bach
select titulo from libros where autor = 'Borges' 
and codigoeditorial = any (select e.codigo from editoriales as e 
join libros as lib 
on lib.codigoeditorial = e.codigo where lib.autor = 'Richard Bach');

#saber si todas las editoriales que publican a borges coinciden con todas las editoriales que publican a Richard Bach
select titulo from libros where autor = 'Borges' and codigoeditorial = all (
select e.codigo from editoriales as e
join libros as lib
on e.codigo = lib.codigoeditorial
where lib.autor = 'Richard Bach');

#saber si un libro de borges es mas caro que un libro de richard bach
select titulo, precio from libros where autor = 'Borges' and 
precio > any (select precio from libros as lib where autor = 'Richard bach');


#exists y nos exists
drop table if exists facturas;
drop table if exists detalles;
 
 create table facturas(
  numero int not null,
  fecha date,
  cliente varchar(30),
  primary key(numero)
 );

 create table detalles(
  numerofactura int not null,
  numeroitem int not null, 
  articulo varchar(30),
  precio decimal(5,2),
  cantidad int,
  primary key(numerofactura,numeroitem)
 );

 insert into facturas values(1200,'2019-01-15','Juan Lopez');
 insert into facturas values(1201,'2012-01-15','Luis Torres');
 insert into facturas values(1202,'2019-01-15','Ana Garcia');
 insert into facturas values(1300,'2019-01-20','Juan Lopez');

 insert into detalles values(1200,1,'lapiz',1,100);
 insert into detalles values(1200,2,'goma',0.5,150);
 insert into detalles values(1201,1,'regla',1.5,80);
 insert into detalles values(1201,2,'goma',0.5,200);
 insert into detalles values(1201,3,'cuaderno',4,90);
 insert into detalles values(1202,1,'lapiz',1,200);
 insert into detalles values(1202,2,'escuadra',2,100);
 insert into detalles values(1300,1,'lapiz',1,300);
 
select * from facturas;
select * from detalles;

#devuelve la lista de cliente y numero que han comprado lapices
select cliente, numero from facturas as fac where exists 
(select * from detalles as det where fac.numero = det.numerofactura and det.articulo = 'lapiz');

#devuelve la lista de cliente y numero que NO han comprado lapices
select cliente, numero from facturas as fac where not exists 
(select * from detalles as det where fac.numero = det.numerofactura and det.articulo = 'lapiz');

#subconsultas con update- delete
drop table if exists editoriales;
 drop table if exists libros;
 
 create table editoriales(
  codigo int auto_increment,
  nombre varchar(30),
  primary key (codigo)
 );
 
 create table libros (
  codigo int auto_increment,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial smallint,
  precio decimal(5,2),
  primary key(codigo)
 );

 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Paidos');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial,precio) 
   values('Uno','Richard Bach',1,15);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('Ilusiones','Richard Bach',2,20);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('El aleph','Borges',3,10);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('Aprenda PHP','Mario Molina',4,40);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('Poemas','Juan Perez',1,20);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('Cuentos','Juan Perez',3,25);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('Java en 10 minutos','Marcelo Perez',2,30);
   
update tabla set campo = nuevo_valor where campo = (subconsulta);

#actualizar el precio de los libros de la editorial emece
select lib.titulo, edi.nombre from libros as lib
join editoriales as edi
on lib.codigoeditorial = edi.codigo;

update libros set precio=(precio + precio*0.1) 
where codigoeditorial =(select codigo from editoriales where nombre = 'Emece');

#delete
delete from tabla where campo = (subconsulta);
delete from libros where codigoeditorial = (
select edi.codigo from editoriales as edi where nombre = 'Planeta');






