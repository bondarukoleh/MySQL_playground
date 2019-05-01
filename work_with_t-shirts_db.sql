SET SQL_SAFE_UPDATES=0;
CREATE DATABASE tshirts_db;
USE tshirts_db;

CREATE TABLE shirts(
shirt_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
article VARCHAR(20) default 't-shirt',
color VARCHAR(20) default 'blue',
shirt_size CHAR default 'M',
last_worn INT default 10
);

INSERT INTO shirts(
    article,
    color,
    shirt_size,
    last_worn
) VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);
INSERT INTO shirts(
    article,
    color,
    shirt_size,
    last_worn)
VALUE ('polo shirt', 'purple', 'M', 50);

desc shirts;

ALTER TABLE shirts MODIFY shirt_size VARCHAR(3);
ALTER TABLE shirts ADD some_column VARCHAR(3);

SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size='M';
SELECT * FROM shirts WHERE shirt_size='L';
SELECT * FROM shirts WHERE last_worn=0;
SELECT * FROM shirts WHERE color='off white';
SELECT * FROM shirts WHERE last_worn>199;
SELECT * FROM shirts WHERE article='tank top';
SELECT * FROM shirts;

UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';
UPDATE shirts SET last_worn=0 WHERE last_worn=15;
UPDATE shirts SET shirt_size='XS', color='off white' WHERE color='white';

DELETE FROM shirts WHERE last_worn>199;
DELETE FROM shirts WHERE article='tank top';
DELETE FROM shirts;

DROP DATABASE shirt_db;

