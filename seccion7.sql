create table if not exists producto(
id integer unsigned not null auto_increment,
nombre varchar(50),
proveedor varchar(50),
descripcion text,
precio decimal(5,2) unsigned,
cantidad smallint unsigned,
primary key(id)
);

insert into producto(nombre, proveedor, descripcion, precio, cantidad) values('Laptop HP','HP','Las mejores laptop',155.69,50);
insert into producto(nombre, proveedor, descripcion, precio, cantidad) values('Mouse','Logitech','Las mejores mouse',20.86,30);
insert into producto(nombre, proveedor, descripcion, precio, cantidad) values('Teclado','Logitech','Las mejores teclados',80.12,100);
insert into producto(nombre, proveedor, descripcion, precio, cantidad) values('Laptop DELL','Dell','Las mejores laptop',200.8,15);
insert into producto(nombre, proveedor, descripcion, precio, cantidad) values('Pantalla','HP','Las mejores Pantallas',155.69,50);
insert into producto(nombre, proveedor, descripcion, precio, cantidad) values('Impresora','HP','Las mejores Impresoras',155,70);
insert into producto(nombre, proveedor, descripcion, precio, cantidad) values('Camaras','logitech','Las mejores Camaras',500,20);
insert into producto(nombre, proveedor, descripcion, precio, cantidad) values('Xbox 360','Xbox Microsoft','Las mejores Consolas',103,10);
insert into producto(nombre, proveedor, descripcion, precio, cantidad) values('PlayStation 4','Sony','Las mejores play',15.69,50);
insert into producto(nombre, proveedor, descripcion, precio, cantidad) values('Lenovo 310','Lenovo','Las mejores laptop',155.69,50);

select * from producto;
drop table producto;

delete from producto where id=1;

-- columnas calculadas
select nombre, precio, cantidad, precio*cantidad from producto;
select nombre, precio, precio * 0.1,precio-(precio*0.1) from producto;

-- funciones de cadenas

select concat('Hola ', 'Como estas?');
select concat_ws('-','Juancho','arevalo');
select length('Hola a todos');
select left('Holi como estan',12);
select right('Buenas taldes mi gente', 5);
select ltrim('                hello');
select rtrim('       Hello          ');
select trim('        hELLO         ');
select replace('mmm.udemy.com','m','w');
select repeat('SQL',3);
select reverse('Hola que mas como estas bien o no');
select lower('HoLlJa COmo eStaN');
select lcase('HoLlJa COmo eStaN');
select upper('HoLa COmo eStaN');
select ucase('HoLa COmo eStaN');

select concat_ws('/ ', nombre, precio) from producto;
select left(nombre, 5) from producto;
select lower(nombre), upper(descripcion) from producto;

-- funciones matematicas
select ceiling(12.4);
select ceiling(precio) from producto;
select ceiling(precio), floor(precio) from producto;
select mod(10,3);
select power(2,3);
select round(20.4);

-- clausula order by

select nombre, descripcion, precio, cantidad from producto order by nombre;
select nombre, precio, cantidad from producto order by nombre desc;

-- operadores logicos
and 
or
xor
not

select * from producto where (proveedor = 'HP') and (precio <= 200);
select * from producto where not (proveedor = 'Logitech');

-- operadores relacionales between - in

select * from producto where precio >= 100 and precio <= 160;
select * from producto where precio between 100 and 160;

select * from producto where proveedor = 'HP' or descripcion = 'Las mejores laptop';
select * from producto where proveedor in('HP','Las mejores laptop');

-- patron de busqueda LIKE y NOT LIKE

select * from producto where descripcion like '%laptop%';
select * from producto where descripcion not like '%laptop%';

-- patron de busqueda regexp - not regexp
select * from producto where proveedor regexp 'logi';
select * from producto where proveedor regexp '[p]';
select * from producto where proveedor regexp '[a-d]';
select * from producto where proveedor regexp '^D';
select * from producto where proveedor regexp 'o.i';
select * from producto where nombre regexp 'a.*a';

-- funcion count
select * from producto;
select count(*) from producto;
select count(*) from producto where proveedor = 'HP';

-- funciones de agrupamiento
select sum(cantidad) from producto;
select sum(cantidad) from producto where proveedor = 'HP';
select max(precio) from producto;
select min(precio) from producto;
select min(precio) from producto where nombre regexp 'laptop';
select avg(precio) from producto where nombre regexp 'laptop';

-- funcion de agrupamiento group by
create table visitantes(
  nombre varchar(30),
  edad tinyint unsigned,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal (6,2) unsigned
 );

insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Susana Molina', 28,'f','Colon 123','Cordoba',null,45.50); 
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',0);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Teresa Garcia',33,'f','Gral. Paz 123','Alta Gracia','03547123456',0);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',25);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','03547121212',53.50);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Roxana Lopez',20,'f','Triunvirato 345','Alta Gracia',null,0);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba','4988778',15.30);
  
select * from visitantes;
select count(*) from visitantes where ciudad = 'Cordoba';

select ciudad, count(*) from visitantes group by ciudad;
select sexo, sum(montocompra) from visitantes group by sexo;
select sexo, max(montocompra), min(montocompra) from visitantes group by sexo;

select ciudad, sexo, count(*) from visitantes group by ciudad, sexo;
select ciudad, count(*) from visitantes where ciudad <> 'Cordoba' group by ciudad;
select ciudad, count(*) from visitantes group by ciudad order by ciudad desc;


