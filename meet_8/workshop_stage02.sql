/*
1. Importar el archivo CSV con el nombre
CLIENTES_NEPTUNO (éste se encuentra
disponible en el área de descargas, del
presente módulo) a la base de datos con el
nombre LABORATORIO. Y tener en cuenta
las siguientes indicaciones:
	a. No cambiar el nombre de latabla.
	b. Eliminar la tabla en el caso de que ya exista dentro de la base de datos.
	c. Mantener los tipos de datos asignados al momento de la importación.
*/
USE laboratorio;
DESCRIBE Clientes_Neptuno;
/*
2. Llevar a cabo los siguientes cambios en
la tabla CLIENTES_NEPTUNO importada
anteriormente. Respetar las consignas
detalladas a continuación y utilizar el
comando ALTER TABLE:
*/
/*
a. Campo IDCliente: debe ser de
tipo VARCHAR, debe admitir hasta 5
caracteres como máximo y debe ser el
campo PRIMARY KEY de la tabla.
*/
ALTER TABLE Clientes_Neptuno
MODIFY IDCliente VARCHAR(5) PRIMARY KEY;
DESCRIBE Clientes_Neptuno;
/*
b. Campo NombreCompania:
debe ser de tipo VARCHAR, debe admitir
hasta 100 caracteres como máximo y no
puede quedar vacío.
*/
ALTER TABLE Clientes_Neptuno
MODIFY NombreCompania VARCHAR(100)NOT NULL;
DESCRIBE Clientes_Neptuno;
/*
c. Campo Pais: debe ser de tipo
VARCHAR, debe admitir hasta 15
caracteres como máximo y no puede
quedar vacío.
*/
ALTER TABLE Clientes_Neptuno
MODIFY Pais VARCHAR(15)NOT NULL;
DESCRIBE Clientes_Neptuno;
/*
/*
3. Cambiar el nombre de la tabla CLIENTES
por CONTACTOS.
*/
RENAME TABLE clientes TO contactos;
DESCRIBE clientes; 
DESCRIBE contactos;
/*
4. Importar el archivo CSV con el nombre
CLIENTES a la base de datos
LABORATORIO. Y tener en cuenta las
siguientes indicaciones:
	a. Este archivo lo encontrarás disponible en el área de descargas del
	presente módulo.
	b. No cambiar el nombre de la tabla.
	c. Mantener los tipos de datos asignados al momento de la importación.
*/
DESCRIBE Clientes;
/*
5. Llevar a cabo los siguientes cambios en
la tabla CLIENTES importada
anteriormente.
Respetar las consignas detalladas a
continuación y utiliza el comando ALTER TABLE:
*/
/*
a. Campo Cod_Cliente: debe ser de tipo VARCHAR, debe admitir hasta 7
caracteres como máximo y debe ser el campo PRIMARY KEY de la tabla.
*/
ALTER TABLE Clientes
MODIFY COD_CLIENTE VARCHAR(7) PRIMARY KEY;
DESCRIBE Clientes;
/*
b. Campo Empresa: debe ser de
tipo VARCHAR, debe admitir hasta 100
caracteres como máximo y no puede
quedar vacío.
*/
ALTER TABLE Clientes
MODIFY EMPRESA VARCHAR(100) NOT NULL;
DESCRIBE Clientes;
/*
c. Campo Ciudad: debe ser de
tipo VARCHAR, debe admitir hasta 25
caracteres como máximo y no puede
quedar vacío.
*/
ALTER TABLE Clientes
MODIFY CIUDAD VARCHAR(25) NOT NULL;
DESCRIBE Clientes;
/*
d. Campo Telefono: debe ser de tipo INT y no debe admitir valores
numéricos negativos.
*/
ALTER TABLE Clientes
MODIFY TELEFONO INT UNSIGNED;
DESCRIBE Clientes;
/*
e. Campo Responsable: debe
ser de tipo VARCHAR y debe admitir como
máximo hasta 30 caracteres
*/
ALTER TABLE Clientes
MODIFY RESPONSABLE VARCHAR(30);
DESCRIBE Clientes;

SELECT * FROM pedidos_neptuno;

/*
1. Mostrar todo el contenido de la tabla
CLIENTES_NEPTUNO importada en el
laboratorio anterior.*/
SELECT * FROM Clientes_Neptuno;
/*
2. Mostrar todos los registros de la tabla
CLIENTES_NEPTUNO. En el resultado de la
consulta sólo se deben observar las
columnas NOMBRECOMPANIA, CIUDAD y
PAIS.
*/
SELECT NombreCompania, Ciudad, Pais FROM Clientes_Neptuno;
/*
3. Mostrar todos los registros de la tabla
CLIENTES_NEPTUNO. En el resultado de la
consulta sólo se deben observar las
columnas NOMBRECOMPANIA, CIUDAD y
PAIS. Luego, ordenar alfabéticamente el
resultado de la consulta por los nombres de
los países.
*/
SELECT NombreCompania, Ciudad, Pais FROM Clientes_Neptuno ORDER BY Pais;
/*
4. Mostrar todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de la
consulta sólo se deben observar las columnas NOMBRECOMPANIA, CIUDAD y PAIS.
Ordenar el resultado de la consulta alfabéticamente por los nombres de los
países. Para aquellos países que se repiten, ordenar las ciudades alfabéticamente.
*/
SELECT NombreCompania, Ciudad, Pais FROM Clientes_Neptuno ORDER BY Pais, Ciudad;
