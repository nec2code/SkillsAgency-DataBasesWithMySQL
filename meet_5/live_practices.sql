/* Uso del operador LIKE
Implementemos el uso del operador LIKE sobre las tablas GAME y
SYSTEM_USER de nuestra base de datos GAMER*/

DESCRIBE SYSTEM_USER;
/*Buscaremos usuarios (SYSTEM_USER) utilizando el operador LIKE, y
combinando el mismo con las diferentes variantes vistas hasta aquí.*/
# ✓ Aquellos usuarios cuyo nombre comience con la letra ‘J’
SELECT * FROM SYSTEM_USER WHERE first_name LIKE "J%";
# ✓ Aquellos usuarios cuyo apellido contenga la letra ‘W’
# ✓ Aquellos usuarios cuyo nombre contenga la letra ‘i’ en segundo lugar
# ✓ Aquellos usuarios cuyo nombre finalice con la letra ‘k’
# ✓ Aquellos usuarios cuyo nombre no incluya las letras ‘ch’
# ✓ Aquellos usuarios cuyo nombre solo incluya las letras ‘ch’

