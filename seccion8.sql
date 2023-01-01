#indices
use curso_sql;
# primary
# index -> indice comun
# unique -> indice unico

# indice primary
create table if not exists libro(
id int unsigned auto_increment not null,
titulo varchar(100),
autor varchar(50) not null,
descripcion text,
editorial varchar(15) not null,
primary key(id)
);

drop table libro;
select * from libros;
show index from libro;

# eliminar un indice
drop index i_autor on libro;
drop index uq_titulo on libro;

# agregar indice a tabla ya existente
create index i_editorial on libro(editorial);
create unique index uq_titulo on libro(titulo);

