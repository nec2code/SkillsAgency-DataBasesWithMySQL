# Etapa 1: Creación de la base de datos y tablas

/* 1.1.1. Crear una base de datos con el nombre
LABORATORIO. En el caso de que la base
de datos exista previamente, eliminarla
antes de iniciar el laboratorio. */
CREATE DATABASE IF NOT EXISTS laboratorio;

/* 1.1.2. Poner en uso la base de datos generada
en el paso anterior.*/
USE laboratorio;

/* 1.1.3. Crear una tabla con el nombre
FACTURAS dentro de la base de datos con
la estructura que se muestra en la
diapositiva 18 y tener en cuenta las
siguientes consideraciones:
    a. PK significa PRIMARY KEY.
    b. Observar que se declara una
       clave primaria compuesta por los campos
       Letra y Número; cada campo por sí solo no
       es clave, ni tampoco identifica al registro,
       pero la combinación de ambos forman la
       clave.
*/
CREATE TABLE facturas(
	letra CHAR,		
	numero INT,
    cliente_id INT,
    articulo_id INT,
    fecha DATE,
    monto DOUBLE,
    PRIMARY KEY (letra, numero)
);

/* 1.1.4. Crear una tabla con el nombre
ARTÍCULOS dentro de la base de datos y
tomar en consideración la estructura
definida en la diapositiva 18.*/
CREATE TABLE articulos (
	articulo_id INT,
    nombre VARCHAR(50),
    precio DOUBLE,
    stock INT,
    PRIMARY KEY (articulo_id)
);

/* 1.1.5. Crear una tabla con el nombre CLIENTES
dentro de la base de datos y tomar en
consideración la estructura definida en la
diapositiva siguiente.*/
CREATE TABLE clientes (
    cliente_id INT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(100),
    PRIMARY KEY (cliente_id)
);

/* 1.1.6. Mostrar un listado de todas las bases de
datos alojadas en el servidor.*/
SHOW DATABASES;

/* 1.1.7. Mostrar un listado de todas las tablas
generadas anteriormente dentro de la base
de datos con el nombre LABORATORIO.*/
SHOW TABLES;

/* 1.1.8. Comentar la instrucción que lista las
tablas contenidas dentro de la base de
datos LABORATORIO.*/
-- SHOW TABLES;
# SHOW TABLES;
/*
	SHOW TABLES;
*/

/* 9. Describir la estructura de la tabla
CLIENTES.*/
DESCRIBE facturas;
DESCRIBE articulos;
DESCRIBE clientes;
DESC clientes;
SELECT * FROM articulos;

# Etapa 2: Modificación de la base de datos y tablas

/*1.2.1. Modifica la tabla FACTURAS tomando en
cuenta las siguientes consideraciones:
a. Cambia el nombre del campo
ClienteID por IDCliente, manteniendo su
tipo de dato y restricciones ya definidas.
b. Cambia el nombre del campo
ArticuloID por IDArticulo, manteniendo su
tipo de dato y restricciones ya definidas.
c. Asigna la restricción UNSIGNED al campo Monto, manteniendo
el tipo de dato ya definido para el campo.*/
ALTER TABLE facturas CHANGE cliente_id id_cliente INT;
ALTER TABLE facturas CHANGE articulo_id id_articulo INT;
ALTER TABLE facturas MODIFY monto DOUBLE UNSIGNED;  
DESCRIBE facturas;


# Etapa 3: Insertar registros en las tablas

/*1.3.1. Insertar 5 registros en la tabla FACTURAS, tal
como se detallan a continuanción.*/
INSERT INTO facturas (letra, numero, id_cliente, id_articulo, fecha, monto) VALUES
('A', 28, 14, 335, '2021-03-18', 1589.50),
('A', 39, 26, 157, '2021-04-12', 979.75),
/*
('B', 1, 3, 3, '2024-01-03', 300.00),
('B', 2, 4, 4, '2024-01-04', 400.00),
('C', 1, 5, 5, '2024-01-05', 500.00);*/
SELECT * FROM facturas;