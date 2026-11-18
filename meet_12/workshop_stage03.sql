/*
3.1 Buckup
ACTIVIDAD EN CLASE

1. Generar un backup de la base de datos
LABORATORIO (completa) en un único
archivo llamado BACKUP LABORATORIO
BD. Este archivo de respaldo debe
generarse en el Escritorio de Windows.
Finalizado el proceso, verificar que el
archivo de respaldo se haya generado
antes de continuar con los siguientes
puntos.

2. Eliminar la base de datos
LABORATORIO.
3. Restaurar el archivo BACKUP
LABORATORIO BD. Verificar, después de
la restauración, que se haya generado la
base de datos.
*/

/*
3.2 Funciones para texto y fecha
ACTIVIDAD EN CLASE

1. Utilizar la tabla CLIENTES_NEPTUNO y
generar una consulta que muestre las
columnas IDCLIENTE y
NOMBRECOMPANIA.
En el resultado de la consulta, se debe
mostrar una nueva columna llamada
UBICACION que concatene las columnas
DIRECCION, CIUDAD y PAIS, separando
los valores de estos campos por un guión.
Para este primer ejercicio, utilizar la
función CONCAT.
*/
USE laboratorio;
SELECT IDCliente, NombreCompania, CONCAT(Direccion, '-', Ciudad, '-', Pais) AS Ubicacion
FROM Clientes_Neptuno;
/*
2. Repetir el ejercicio anterior, utilizando la
función CONCAT_WS.
*/
SELECT IDCliente, NombreCompania, CONCAT_WS( '-', Direccion, Ciudad, Pais) AS Ubicacion_ws
FROM Clientes_Neptuno;
/*
3. Modificar el ejercicio anterior para  mostrar en mayúsculas los valores
cargados en el campo NOMBRECOMPANIA. Esta columna debe mostrarse con el nombre EMPRESA.
*/
SELECT IDCliente, UPPER(NombreCompania) AS Empresa, CONCAT_WS( '-', Direccion, Ciudad, Pais) AS Ubicacion_ws
FROM Clientes_Neptuno;
/*
4. Modificar el ejercicio anterior para mostrar los valores cargados en el campo
IDCLIENTE en minúsculas. Esta columna debe mostrarse con el nombre CODIGO.
*/
SELECT LOWER(IDCliente) AS Codigo, UPPER(NombreCompania) AS Empresa, CONCAT_WS( '-', Direccion, Ciudad, Pais) AS Ubicacion_ws
FROM Clientes_Neptuno;
/*
5. Utilizar la tabla NACIMIENTOS y generar una consulta que muestre la columna
FECHA. En el resultado de la consulta, se debe mostrar una nueva columna con el
nombre SEXO que muestre la inicial de los datos cargados en el campo SEXO y otra
columna con el nombre TIPO que muestre la inicial de los datos cargados en el campo
TIPO_PARTO.
*/
SELECT FECHA, LEFT(SEXO, 1) AS SEXO, LEFT(TIPO_PARTO, 1) AS TIPO FROM nacimientos;
/*
6. Utilizar la tabla CLIENTES_NEPTUNO y generar una consulta que muestre todos los
campos de la tabla. Agregar una nueva columna a la consulta con el nombre
CODIGO. La misma, debe concatenar la primera letra del campo CIUDAD y la
primera y las 2 últimas letras del campo PAIS. Los datos de esta nueva columna se
deben mostrar en mayúsculas.
*/
SELECT *, UPPER(CONCAT(LEFT(CIUDAD, 1), LEFT(PAIS, 1), RIGHT(PAIS, 2))) AS CODIGO 
FROM Clientes_Neptuno;
/*
7. Utilizar la tabla NACIMIENTOS y generar una consulta que muestre las 5 primeras
columnas de la tabla. Agregar una nueva columna a la consulta
con el nombre MES que tome el mes de nacimiento de los bebés del campo FECHA.
Ordenar el resultado de menor a mayor por los valores de la columna MES.
*/
SELECT * FROM nacimientos;
DESCRIBE nacimientos;
SELECT SEXO, FECHA, TIPO_PARTO, ATENC_PART, LOCAL_PART, SUBSTRING(FECHA, 4, 2) AS MES FROM nacimientos 
ORDER BY MES ASC;

# Pasar el campo FECHA de text a DATE
-- 1. Desactiva el modo seguro en esta sesión
SET SQL_SAFE_UPDATES = 0;

-- 2. Convierte el texto al formato de fecha de MySQL
UPDATE nacimientos SET FECHA = STR_TO_DATE(FECHA, '%d/%m/%Y');

SELECT SEXO, FECHA, TIPO_PARTO, ATENC_PART, LOCAL_PART, MONTH(FECHA) AS MES FROM nacimientos 
ORDER BY MES ASC;
/*
8. Utilizar la tabla NACIMIENTOS y generar una consulta que muestre las siguientes
columnas: SEXO, FECHA y TIPO_PARTO. mostrar una nueva columna llamada
NACIONALIDAD donde se reemplazan los valores Chilena de la
columna NACIONALIDAD original por Ciudadana.
*/
SELECT SEXO, FECHA, TIPO_PARTO, REPLACE(NACIONALIDAD, 'Chilena', 'Ciudadana') 
AS NACIONALIDAD FROM nacimientos;

/*
3.2 Funciones matemáticas
ACTIVIDAD EN CLASE

1. Calcular la cantidad de registros cargados en la tabla PEDIDOS_NEPTUNO.
*/
SELECT COUNT(*) FROM pedidos_neptuno;
SELECT COUNT(IdPedido) FROM pedidos_neptuno;
/*
2. Calcular la cantidad de pedidos cargados en la tabla PEDIDOS_NEPTUNO
que hayan sido entregados por el transportista con el nombre SPEEDY
EXPRESS. La columna en la que se obtiene el resultado debe mostrarse con el
nombre ENTREGAS SPEEDY EXPRESS.
*/
SELECT * FROM pedidos_neptuno;
SELECT COUNT(*) AS "Entregas Speedy Express" FROM pedidos_neptuno 
WHERE Transportista = 'Speedy Express';
/*
3. Calcular la cantidad de pedidos cargados en la tabla PEDIDOS_NEPTUNO
que hayan sido atendidos por empleados cuyo apellido comience con la letra C. 
La columna en la que se obtiene el resultado debe mostrarse con el nombre VENTAS.
*/
SELECT COUNT(*) AS "Ventas" FROM pedidos_neptuno
WHERE ApellidoEmpleado LIKE 'C%';
/*
4. Calcular el precio promedio de todos los productos cargados en la tabla llamada
PRODUCTOS_NEPTUNO. La columna del resultado, debe mostrarse con el nombre
PRECIO PROMEDIO. El resultado debe mostrar, como máximo, sólo 2 decimales.
*/
SELECT ROUND(AVG(PrecioUnidad), 2) AS "Precio Promedio" FROM productos_neptuno;
/*
5. Modificar la consulta anterior para obtener el precio más bajo de la tabla. La
columna en la que se obtiene el resultado debe mostrarse con el nombre PRECIO
INFERIOR.
*/
SELECT MIN(PrecioUnidad) AS "Precio Inferior" FROM productos_neptuno;
/*
6. Modificar la consulta anterior para obtener el precio más alto de la tabla. La nueva
columna debe mostrarse con el nombre PRECIO MAXIMO.
*/
SELECT MAX(PrecioUnidad) AS "Precio Maximo" FROM productos_neptuno;
/*
7. Generar una consulta en base a la tabla PRODUCTOS_NEPTUNO que muestre el
precio más alto correspondiente a cada categoría. La columna en la que se obtiene
dicho precio debe mostrarse con el nombre PRECIO MAXIMO. La columna que muestra
las categorías debe mostrarse con el nombre CATEGORIA.
*/
SELECT Categoria, MAX(PrecioUnidad) AS "Precio Maximo" FROM productos_neptuno
GROUP BY Categoria;
/*
8. Calcular la cantidad de entregas efectuadas por cada transportista,
utilizando la tabla PEDIDOS_NEPTUNO. La columna en la que se obtienen los
resultados debe mostrarse con el nombre ENTREGAS.
*/
SELECT Transportista, COUNT(*) AS "Entregas" FROM pedidos_neptuno
GROUP BY Transportista;
/*
9. Utilizar la tabla NACIMIENTOS y calcular la cantidad de nacimientos según el sexo
de los bebés. La columna en la que se obtienen los resultados debe mostrarse
con el nombre NACIMIENTOS.
*/
SELECT SEXO, COUNT(*) AS "Nacimientos" FROM nacimientos
GROUP BY SEXO;
/*
10. Utilizando la tabla PEDIDOS_NEPTUNO, calcular el total de gastos por cliente. La
columna en la que se obtienen los resultados debe mostrarse con el nombre
TOTAL GASTOS y debe mostrar como máximo 2 decimales. La columna en la que
figuran los nombres de los clientes debe tener el título CLIENTE.
*/
SELECT NombreCliente AS "Cliente", ROUND(SUM(PrecioUnidad * Cantidad), 2) 
AS "Total Gastos" FROM pedidos_neptuno GROUP BY NombreCliente;
/*
11. Utilizando la tabla PRODUCTOS, calcular la cantidad de productos
pertenecientes a cada sección. La columna
en la que se obtienen los resultados debe
mostrarse con el nombre CANTIDAD.
Ordenar la consulta de mayor a menor
según los valores de la columna
CANTIDAD.
*/
SELECT Seccion, COUNT(*) AS "Cantidad" FROM productos
GROUP BY Seccion
ORDER BY "Cantidad" DESC;
/*
12. Utilizar la tabla PEDIDOS_NEPTUNO y calcular la cantidad de ventas efectuadas
por mes y año. Las columnas deben mostrarse con los nombres AÑO, MES
y VENTAS respectivamente. Ordenar el resultado por año y mes, para obtener
un listado cronológico de las ventas.
*/
SELECT YEAR(FechaPedido) AS "Año", MONTH(FechaPedido) AS "Mes", COUNT(*) AS "Ventas"
FROM pedidos_neptuno
GROUP BY YEAR(FechaPedido), MONTH(FechaPedido)
ORDER BY "Año", "Mes" ASC;
/*
13. Utilizar la tabla PEDIDOS_NEPTUNO y
calcular las siguientes estadísticas:
a. El total facturado por

empleado.

b. El promedio de facturación

por empleado.
c. La mejor venta efectuada por

cada empleado.

d. La peor venta efectuada por

cada empleado.

e. La cantidad de ventas
efectuadas por cada empleado.

f. Tener en cuenta las siguientes
especificaciones: las columnas deben
recibir los nombres FACTURACION,
PROMEDIO, MEJOR VENTA, PEOR VENTA
y VENTAS. Las columnas llamadas
FACTURACION y PROMEDIO deben
mostrar, como máximo, 2 decimales.
*/