create table alumnos(
nombre varchar(50),
apellido varchar(50),
direccion varchar(100),
telefono varchar(15),
edad int(5)
);

-- insertando datos
insert into alumnos(nombre,apellido,direccion,telefono,edad)
values ('Jesus','Bermudez','Calle 69b','1203981',21);

insert into alumnos
values ('Loida','Zamora','Calle 28b','2837462',45);
insert into alumnos
values ('Carlos','Zamora','Calle 70a','29874356',33);
insert into alumnos
values ('Raul','Cortes','Calle 36','203948',40);

insert into alumnos(nombre,telefono,edad)
values ('Juana','09234865',34);

-- mostrar datos
select * from alumnos;
select nombre, direccion, edad from alumnos;

-- recuperar datos con where
select * from alumnos where nombre = 'Loida';

-- operadores relacionales
-- = igual    <> distinto  >  <   >=   <=

select * from alumnos where nombre = 'Carlos';
select * from alumnos where nombre <> 'Carlos';
select * from alumnos where edad > 30;
select nombre, apellido, edad from alumnos where edad < 30;

-- borrar registros
delete from alumnos;
delete from alumnos where nombre = 'Raul';

-- actualizar registros

update alumnos set edad = 34 where nombre = 'Loida';
update alumnos set apellido = 'Sanchez', telefono = 8723612
where nombre = 'Carlos';







