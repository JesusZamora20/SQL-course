# tipos de datos

# enteros
tinyint -127 128 unsigned;
smallint
mediumint 
int o integer
bigint

# decimales
precio float(6.25);
precio2 double(4.53);
decimal

# cadenas

char 255 caracteres max
varchar	longitud desconocida, max long de 65.535 caracteres
binary y varbinary, almacenan bytes
text
blob y tinyblob, mediumblob, longblob,  guarda informacion en campos binarios
enum, permite clasificar con valores de una lista definida
set, como un enum pero hasta 64 valores y permite elegir varias opciones


# fecha 

date en formato AAAA-MM-DD
datetime en formato AAAA-MM-DD HH-MM-SS
time en formato HH-MM-SS
timestamp en formatos AAAA-MM-DD AA-MM-DD
on update current_timestamp actualizar valores automaticamente
year


# atributo default

use curso_sql;

create table libros(
id int unsigned auto_increment,
titulo varchar(40) not null,
editorial varchar(15),
autor varchar(40) default "desconocido",
precio decimal(5,2) unsigned default 8.25,
cantidad mediumint unsigned not null, 
primary key(id)
);

insert into libros(titulo, editorial, autor, precio, cantidad)
values('c# en una hora','SLQ','Juancho', 15.2, 56);

insert into libros(titulo,editorial, autor,cantidad)
values('Javascript hell','KLK','Alberto', 40);

insert into libros(titulo,cantidad)
values('Javascript pa dummies', 440);

select * from libros;










