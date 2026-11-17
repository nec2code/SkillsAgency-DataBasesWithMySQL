USE gamers;
CREATE VIEW game_view AS SELECT * FROM GAME;
SELECT * FROM GAME;
SELECT * FROM game_view;
INSERT INTO GAME (id_game, name, description, id_level, id_class) 
VALUES (101, "GTA VI", "Triple A", 6, 121);
INSERT INTO game_view (id_game, name, description, id_level, id_class) 
VALUES (102, "GTA VII", "Triple A", 13, 115);

CREATE VIEW game_name_desc_view AS SELECT name, description FROM GAME;
SELECT * FROM game_name_desc_view;
SELECT * FROM GAME;

CREATE OR REPLACE VIEW game_cod_view 
AS SELECT name, description FROM GAME
WHERE name LIKE "%Call of duty%";
SELECT * FROM game_cod_view;

CREATE OR REPLACE VIEW game_view 
AS SELECT * FROM GAME ORDER BY name DESC;
SELECT * FROM game_view;

CREATE OR REPLACE VIEW game_you_view 
AS SELECT * FROM GAME WHERE name LIKE "%You%"
ORDER BY name DESC;
SELECT * FROM game_you_view;

CREATE OR REPLACE VIEW games_view AS
SELECT DISTINCT name, description FROM GAME g JOIN
PLAY p ON (g.id_game = p.id_game)
WHERE p.completed = "false";

SELECT * FROM games_view;

# esto es un comentario

