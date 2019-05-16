CREATE TABLE makers (
	maker_id INT,
	maker_name VARCHAR(50) NOT NULL,
	maker_adress VARCHAR(200),
	CONSTRAINT pk_makers PRIMARY KEY(maker_id)
);

CREATE TABLE product (
	maker_id INT,
	model VARCHAR(50) NOT NULL,
	type VARCHAR(50) NOT NULL,
	CONSTRAINT pk_product PRIMARY KEY(model),
	CONSTRAINT fk_product_makers FOREIGN KEY(maker_id) REFERENCES makers(maker_id)
);

CREATE TABLE pc (
	id INT,
	model VARCHAR(50) NOT NULL,
	speed SMALLINT,
	ram SMALLINT,
	hd FLOAT,
	cd VARCHAR(10),
	price DOUBLE,
  	CONSTRAINT pk_pc PRIMARY KEY(id),
	CONSTRAINT fk_pc_product FOREIGN KEY(model) REFERENCES product(model)
);

CREATE TABLE laptop (
	id INT,
	model VARCHAR(50),
	speed SMALLINT,
	ram SMALLINT,
	hd FLOAT,
	screen SMALLINT,
	price DOUBLE,
 	CONSTRAINT pk_laptop PRIMARY KEY(id),
	CONSTRAINT fk_laptop_product FOREIGN KEY(model) REFERENCES product(model)
);

CREATE TABLE printer_type (
	type_id INT,
	type_name VARCHAR(50),
	CONSTRAINT pk_printer_type PRIMARY KEY(type_id)
);

CREATE TABLE printer (
	id INT,
	model VARCHAR(50) NOT NULL,
	color CHAR(1) NOT NULL DEFAULT 'y', 
	type_id INT NOT NULL,
	price DOUBLE,
	CONSTRAINT pk_printer PRIMARY KEY(id),
	CONSTRAINT fk_printer_product FOREIGN KEY(model) REFERENCES product(model),
    CONSTRAINT fk_printer_type FOREIGN KEY(type_id) REFERENCES printer_type(type_id)
);

INSERT INTO makers(maker_id, maker_name, maker_adress) VALUES (1, 'A', 'AdressA');
INSERT INTO makers(maker_id, maker_name, maker_adress) VALUES (2, 'B', 'AdressB');
INSERT INTO makers(maker_id, maker_name, maker_adress) VALUES (3, 'C', 'AdressC');
INSERT INTO makers(maker_id, maker_name, maker_adress) VALUES (4, 'D', 'AdressD');
INSERT INTO makers(maker_id, maker_name, maker_adress) VALUES (5, 'E', 'AdressE');

INSERT INTO printer_type(type_id, type_name) VALUES (1, 'Laser');
INSERT INTO printer_type(type_id, type_name) VALUES (2, 'Jet');
INSERT INTO printer_type(type_id, type_name) VALUES (3, 'Matrix');

INSERT INTO product(maker_id, model, type) VALUES (1, '1232', 'PC');
INSERT INTO product(maker_id, model, type) VALUES (1, '1233', 'PC');
INSERT INTO product(maker_id, model, type) VALUES (1, '1276', 'Printer');
INSERT INTO product(maker_id, model, type) VALUES (1, '1298', 'Laptop');
INSERT INTO product(maker_id, model, type) VALUES (1, '1401', 'Printer');
INSERT INTO product(maker_id, model, type) VALUES (1, '1408', 'Printer');
INSERT INTO product(maker_id, model, type) VALUES (1, '1752', 'Laptop');
INSERT INTO product(maker_id, model, type) VALUES (2, '1121', 'PC');
INSERT INTO product(maker_id, model, type) VALUES (2, '1750', 'Laptop');
INSERT INTO product(maker_id, model, type) VALUES (3, '1321', 'Laptop');
INSERT INTO product(maker_id, model, type) VALUES (4, '1288', 'Printer');
INSERT INTO product(maker_id, model, type) VALUES (4, '1433', 'Printer');
INSERT INTO product(maker_id, model, type) VALUES (5, '1260', 'PC');
INSERT INTO product(maker_id, model, type) VALUES (5, '1434', 'Printer');
INSERT INTO product(maker_id, model, type) VALUES (5, '2112', 'PC');
INSERT INTO product(maker_id, model, type) VALUES (5, '2113', 'PC');

INSERT INTO pc(id, model, speed, ram, hd, cd, price) VALUES (1,  '1232', 500, 64,  5.00, '12x', 600.0);
INSERT INTO pc(id, model, speed, ram, hd, cd, price) VALUES (2,  '1121', 750, 128, 14.0, '40x', 850.0);
INSERT INTO pc(id, model, speed, ram, hd, cd, price) VALUES (3,  '1233', 500, 64,  5.00, '12x', 600.0);
INSERT INTO pc(id, model, speed, ram, hd, cd, price) VALUES (4,  '1121', 600, 128, 14.0, '40x', 850.0);
INSERT INTO pc(id, model, speed, ram, hd, cd, price) VALUES (5,  '1121', 600, 128, 8.00, '40x', 850.0);
INSERT INTO pc(id, model, speed, ram, hd, cd, price) VALUES (6,  '1233', 750, 128, 20.0, '50x', 950.0);
INSERT INTO pc(id, model, speed, ram, hd, cd, price) VALUES (7,  '1232', 500, 32,  10.0, '12x', 400.0);
INSERT INTO pc(id, model, speed, ram, hd, cd, price) VALUES (8,  '1232', 450, 64,  8.00, '24x', 350.0);
INSERT INTO pc(id, model, speed, ram, hd, cd, price) VALUES (9,  '1232', 450, 32,  10.0, '24x', 350.0);
INSERT INTO pc(id, model, speed, ram, hd, cd, price) VALUES (10, '1260', 500, 32,  10.0, '12x', 350.0);
INSERT INTO pc(id, model, speed, ram, hd, cd, price) VALUES (11, '1233', 900, 128, 40.0, '40x', 980.0);
INSERT INTO pc(id, model, speed, ram, hd, cd, price) VALUES (12, '1233', 800, 128, 20.0, '50x', 970.0);

INSERT INTO laptop(id, model, speed, ram, hd, screen, price) VALUES (1, '1298', 350, 32 , 4.00, 11, 700.00);
INSERT INTO laptop(id, model, speed, ram, hd, screen, price) VALUES (2, '1321', 500, 64 , 8.00, 12, 970.00);
INSERT INTO laptop(id, model, speed, ram, hd, screen, price) VALUES (3, '1750', 750, 128, 12.0, 14, 1200.0);
INSERT INTO laptop(id, model, speed, ram, hd, screen, price) VALUES (4, '1298', 600, 64 , 10.0, 15, 1050.0);
INSERT INTO laptop(id, model, speed, ram, hd, screen, price) VALUES (5, '1752', 750, 128, 10.0, 14, 1150.0);
INSERT INTO laptop(id, model, speed, ram, hd, screen, price) VALUES (6, '1298', 450, 64 , 10.0, 12, 950.00);

INSERT INTO printer(id, model, color, type_id, price) VALUES (1, '1276', 'n', 1, 400.0);
INSERT INTO printer(id, model, color, type_id, price) VALUES (2, '1433', 'y', 2, 270.0);
INSERT INTO printer(id, model, color, type_id, price) VALUES (3, '1434', 'y', 2, 290.0);
INSERT INTO printer(id, model, color, type_id, price) VALUES (4, '1401', 'n', 3, 150.0);
INSERT INTO printer(id, model, color, type_id, price) VALUES (5, '1408', 'n', 3, 270.0);
INSERT INTO printer(id, model, color, type_id, price) VALUES (6, '1288', 'n', 1, 400.0);

CREATE INDEX ind_pc_price ON pc(price);
CREATE INDEX ind_laptop_price ON laptop(price);
CREATE INDEX ind_printer_price ON printer(price);

-- Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
Select product.model, pc.speed, pc.hd from product inner join pc on product.model=pc.model where (pc.cd='12x' OR pc.cd='24x') AND pc.price<600;
-- Укажите производителя и скорость для тех ПК-блокнотов, которые имеют жесткий диск объемом не менее 10 Гбайт.
Select pc.speed, makers.maker_name from pc join product on pc.model=product.model join makers on product.maker_id = makers.maker_id where pc.hd > 10;
-- Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
select model, speed, hd from pc where price < 500;
-- Найти всех производителей принтеров. Вывести maker_name и отсортировать в порядке, обратном алфавитному.
select makers.maker_name from printer join product on printer.model=product.model join makers on product.maker_id=makers.maker_id ORDER by makers.maker_name desc;
-- Найдите номера моделей и цены всех продуктов (любого типа), выпущенных производителем 'B' (латинская буква).
select pc.model, pc.price from pc join product on pc.model=product.model join makers on makers.maker_id=product.maker_id where makers.maker_name='B'
union
select laptop.model, laptop.price from laptop join product on laptop.model=product.model join makers on makers.maker_id=product.maker_id where makers.maker_name='B'
union
select laptop.model, laptop.price from laptop join product on laptop.model=product.model join makers on makers.maker_id=product.maker_id where makers.maker_name='B';
-- Найдите производителей, выпускающих ПК, но не ПК-блокноты (вывести maker_name).
-- Найдите производителей ПК с процессором не менее 450 Мгц (вывести maker_name).
-- Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price.
-- Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
-- Найдите среднюю скорость ПК, выпущенных производителем 'A'.
-- Найти производителей, которые выпускают более одной модели, при этом все выпускаемые производителем модели являются продуктами одного типа. Вывести: maker_id, type
-- Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: hd. Отсортировать в порядке убывания значений.
-- Найдите модели ПК-блокнотов, скорость которых меньше скорости любого из ПК. Вывести: type, model, speed
-- Найдите производителей самых дешевых цветных принтеров. Вывести: maker_name, price
-- Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов. Вывести: maker_id, avg_size. Отсортировать по возрастанию значений среднего размера экрана.
-- Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: maker_id, mod_count.
-- Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: maker_id
-- Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
-- Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker_id, avg_hd
-- Найдите средний размер диска ПК (одно значение для всех) тех производителей, которые выпускают и принтеры. Вывести: avg_hd

Select * from makers;
Select * from product;

Select model, price from product
join makers on product.maker_id = makers.maker_id
join pc on pc.model = product.model
join printer on printer.model = product.model
where product.model = 1121 OR product.model = 1750;
-- where makers.maker_name='B' And product.model = 1121 OR product.model = 1750;
show tables;
show errors;
SELECT DISTINCT makers.maker_name FROM product
INNER JOIN makers ON product.maker_id = makers.maker_id
WHERE product.type = 'PC' AND makers.maker_name NOT IN
(SELECT makers.maker_name FROM product
INNER JOIN makers
ON product.maker_id = makers.maker_id
WHERE product.type = 'Laptop');

select distinct product.type from product;

select distinct makers.maker_name from product join makers on makers.maker_id=product.maker_id where product.type='PC'
and makers.maker_name not in(select makers.maker_name from makers join product on makers.maker_id=product.maker_id where product.type='Laptop');

select pc.model, pc.price from pc join product on pc.model=product.model join makers on makers.maker_id=product.maker_id where makers.maker_name='B'
union
select laptop.model, laptop.price from laptop join product on laptop.model=product.model join makers on makers.maker_id=product.maker_id where makers.maker_name='B'
union
select laptop.model, laptop.price from laptop join product on laptop.model=product.model join makers on makers.maker_id=product.maker_id where makers.maker_name='B';
Select  product.model, price from product
join makers on product.maker_id = makers.maker_id
join pc on pc.model = product.model
join printer on printer.model = product.model;
