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
    cuit CHAR(16),
    direccion VARCHAR(50),
    comentarios VARCHAR(50),
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

/*1.2.2. Modifica la tabla ARTICULOS tomando en
cuenta las siguientes consideraciones:
a. Cambia el nombre del campo
ArticuloID por IDArticulo, manteniendo su   
tipo de dato y restricciones ya definidas.
b. Cambia el tipo de dato del
campo Nombre para que admita hasta 75
caracteres.
c. Asigna las restricciones
UNSIGNED y NOT NULL al campo Precio,
manteniendo el tipo de dato ya definido
para el campo.
d. Asigna las restricciones
UNSIGNED y NOT NULL al campo Stock,
manteniendo el tipo de dato ya definido
para el campo.*/
ALTER TABLE articulos CHANGE articulo_id id_articulo INT;
ALTER TABLE articulos MODIFY nombre VARCHAR(75);
ALTER TABLE articulos MODIFY precio DOUBLE UNSIGNED NOT NULL;
ALTER TABLE articulos MODIFY stock INT UNSIGNED NOT NULL;
DESCRIBE articulos;

/*1.2.3. 3. Modifica la tabla CLIENTES. Toma en
cuenta las siguientes consideraciones:
a. Cambia el nombre del campo
ClienteID por IDCliente, manteniendo su
tipo de dato y restricciones ya definidas.
b. Cambia el tipo de dato del
campo Nombre para que admita hasta 30
caracteres y asigne la restricción corres-
pondiente para que su carga sea
obligatoria.
c. Cambia el tipo de dato del
campo Apellido para que admita hasta 35
caracteres y asigne la restricción
correspondiente para que su carga sea
obligatoria.
d. Cambia el nombre del campo
Comentarios por Observaciones y su tipo
de dato para que admita hasta 255
caracteres.*/
ALTER TABLE clientes CHANGE cliente_id id_cliente INT;
ALTER TABLE clientes MODIFY nombre VARCHAR(30) NOT NULL;
ALTER TABLE clientes MODIFY apellido VARCHAR(35) NOT NULL;
ALTER TABLE clientes CHANGE comentarios observaciones VARCHAR(255);
DESCRIBE clientes;



# Etapa 3: Insertar registros en las tablas

/*1.3.1. Insertar 5 registros en la tabla FACTURAS, tal
como se detallan a continuanción.*/
INSERT INTO facturas (letra, numero, id_cliente, id_articulo, fecha, monto) VALUES
('A', 28, 14, 335, '2021-03-18', 1589.50),
('A', 39, 26, 157, '2021-04-12', 979.75),
('B', 8, 17, 95, '2021-04-25', 513.35),
('B', 12, 5, 411, '2021-05-03', 2385.70),
('B', 19, 50, 157, '2021-05-26', 979.75);
SELECT * FROM facturas;

INSERT INTO articulos (articulo_id, nombre, precio, stock) VALUES
(335, 'Monitor LED 24"', 1589.50, 10),
(157, 'Teclado Mecánico', 979.75, 25),
(95, 'Mouse Inalámbrico', 513.35, 30),
(411, 'Auriculares Gaming', 2385.70, 15),
(157, 'Teclado Mecánico', 979.75, 25);
SELECT * FROM articulos;

INSERT INTO clientes (cliente_id, nombre, apellido, email) VALUES
(14, 'Juan', 'Pérez', 'juan.perez@email.com'),
(26, 'María', 'Gómez', 'maria.gomez@email.com'),
(17, 'Carlos', 'Rodríguez', 'carlos.rodriguez@email.com'),
(5, 'Ana', 'Martínez', 'ana.martinez@email.com'),
(50, 'Luis', 'Sánchez', 'luis.sanchez@email.com');
SELECT * FROM clientes;

