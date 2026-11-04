USE gamers;
SELECT * FROM SYSTEM_USER;
SELECT first_name, last_name FROM SYSTEM_USER;
SELECT first_name, last_name, email FROM SYSTEM_USER;
SELECT id_system_user, first_name, last_name FROM SYSTEM_USER;
SELECT id_system_user, first_name FROM SYSTEM_USER;
SELECT DISTINCT id_system_user, first_name FROM SYSTEM_USER;
SELECT first_name FROM SYSTEM_USER;
SELECT DISTINCT first_name FROM SYSTEM_USER;
SELECT id_system_user, first_name, last_name
FROM SYSTEM_USER
WHERE id_system_user = 56;
SELECT * FROM SYSTEM_USER;
SELECT * FROM system_user WHERE first_name = ‘Gillie’;
SELECT first_name, last_name FROM system_user WHERE id_user_type = 334;
SELECT first_name, last_name FROM system_user WHERE id_system_user = 56;
SELECT * FROM system_user WHERE first_name = ‘Reinaldos’;

SELECT * FROM GAME;

SELECT id_game, name, description, id_level, id_class
FROM GAME WHERE id_level = 1
UNION
SELECT id_game, name, description, id_level, id_class
FROM GAME WHERE id_level = 2;

SELECT * FROM GAME WHERE name LIKE "FIFA%";
SELECT * FROM GAME WHERE name LIKE "F%";
SELECT * FROM GAME WHERE name LIKE "%a";
SELECT * FROM GAME WHERE name LIKE "%va";
SELECT * FROM GAME WHERE name LIKE "%VA";
SELECT * FROM GAME WHERE name LIKE "%Ultimate%";
SELECT * FROM GAME WHERE name LIKE "%ULTIMATE%";
SELECT * FROM GAME WHERE name LIKE "%of%";
SELECT * FROM GAME WHERE name LIKE "%z%";
SELECT * FROM GAME WHERE name LIKE "%a%";

SELECT * FROM GAME WHERE name LIKE "_IFA%";
SELECT * FROM GAME WHERE name LIKE "_A%";
SELECT * FROM GAME WHERE name LIKE "__A%";

# Caso de uso: Buscar nombres de usuarios o clientes que comiencen con una letra específica.
SELECT * FROM GAME WHERE name REGEXP '^A'; 
SELECT * FROM GAME WHERE name REGEXP '^a'; 
# Caso de uso: Filtrar archivos por su extensión o validar dominios web.
SELECT 'archivo.xyz' REGEXP 'xyz$'; 
SELECT 'archivo.jpg' REGEXP 'jpg$'; 
SELECT 'axb' REGEXP 'a.b', 'a3b' REGEXP 'a.b', 'aíb' REGEXP 'a.b';
-- Todos devuelven 1
-- Usando REGEXP_LIKE para habilitar 'dotall' (modo s)
SELECT REGEXP_LIKE("a\nb", "a.b", "s"); -- Devuelve 1
SELECT 'b' REGEXP 'a*b', 'ab' REGEXP 'a*b', 'aaab' REGEXP 'a*b';
-- Todos devuelven 1

SELECT 'a' REGEXP 'a+', 'aa' REGEXP 'a+'; -- Ambos devuelven 1
SELECT 'b' REGEXP 'a+';                    -- Devuelve 0 (se requiere al menos una 'a')
# Caso de uso: Validar secuencias donde la presencia del carácter es obligatoria (por ejemplo, asegurar que haya al menos un dígito continuo: [0-9]+).
SELECT 'color' REGEXP 'colou?r', 'colour' REGEXP 'colou?r'; -- Ambos devuelven 1
# Caso de uso: Tratar con variaciones ortográficas (como inglés británico vs. americano) o elementos opcionales (como el prefijo http o https).
SELECT 'casa' REGEXP '[aeiou]'; -- Devuelve 1 (contiene vocales)
# Nota para MySQL 8.4 (Unicode): Con el motor ICU, las clases de caracteres soportan directamente símbolos especiales o letras acentuadas si las incluyes explícitamente (ej: [aeiouáéíóú]). Además, puedes utilizar clases POSIX avanzadas como [[:alpha:]] o [[:alnum:]].
-- Busca cadenas que contengan al menos un dígito
SELECT 'usuario123' REGEXP '[0-9]'; -- Devuelve 1
-- Busca cadenas que contengan mayúsculas
SELECT 'MySQL' REGEXP '[A-Z]';       -- Devuelve 1
# Nota para MySQL 8.4 (Cotejamiento / Collation):
# En MySQL 8.4, la sensibilidad a mayúsculas/minúsculas en REGEXP depende del cotejamiento (collation) de la cadena o columna evaluada:
# Si la columna/cadena es de tipo case-insensitive (por ejemplo, la colación por defecto utf8mb4_0900_ai_ci), REGEXP '[A-Z]' coincidirá tanto con mayúsculas como con minúsculas.
# Si necesitas forzar que sea estrictamente sensible a mayúsculas/minúsculas en MySQL 8.4, puedes usar REGEXP_LIKE con la bandera 'c' (case-sensitive) o convertir la expresión a binaria:
-- Forzar sensibilidad a mayúsculas
SELECT REGEXP_LIKE('mysql', '[A-Z]', 'c'); -- Devuelve 0
SELECT REGEXP_LIKE('MySQL', '[A-Z]', 'c'); -- Devuelve 1
# | (Alternancia / Operador OR)
# Coincide con el patrón a la izquierda O con el patrón a la derecha.
SELECT 'gato' REGEXP 'perro|gato|pez'; -- Devuelve 1
-- Busca 'id_10', 'id_20' o 'id_30'
SELECT 'id_20' REGEXP 'id_(10|20|30)'; -- Devuelve 1