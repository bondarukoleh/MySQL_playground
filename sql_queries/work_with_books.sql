CREATE TABLE books (
    book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT
);

INSERT INTO books(title, author_fname, author_lname, released_year, stock_quantity, pages) VALUES 
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

select * from books;
SHOW tables;
SELECT * from unic_cats;
select name, age from unic_cats ORDER BY age asc;
select name, age, author_fname from unic_cats, books where unic_cats.cat_id=books.book_id;

select 
  unic_cats.name, age, books.author_fname
from
 unic_cats
inner JOIN
 books
on
unic_cats.cat_id=books.book_id
order by age asc; -- or where age<=5;

ALTER TABLE books CHANGE authir_name author_fname VARCHAR(100);

SELECT concat(author_fname, ' ', author_lname) AS 'Full author name', released_year from books; 

SELECT CONCAT(SUBSTRING(title, 1, 5), '...') AS 'Title' from books;

SELECT * FROM  books;
SELECT 
    CONCAT_WS(' ', title, author_fname, author_lname) AS 'book and author',
    released_year
FROM
    books;
SELECT SUBSTRING('MY Stuff', 1, 4);
SELECT SUBSTRING('MY Stuff', 1);
SELECT SUBSTRING('MY Stuff', -2);
SELECT REVERSE(REPLACE(CONCAT(SUBSTRING(title, 1, 5), '...'), '...', 'AUAUAUAUAU')) AS 'Title' from books;
SELECT CHAR_LENGTH(REVERSE(REPLACE(CONCAT(SUBSTRING(title, 1, 5), '...'), '...', 'AUAUAUAUAU'))) AS 'Title' from books;

SELECT CONCAT(author_fname, ' is ', CHAR_LENGTH(author_fname), ' charachters long') FROM books;
    
    
    
SELECT @@sql_mode;
SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY,','');
SET @@sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY,',''));

Select LOWER(author_fname) from books;
Select distinct author_lname from books;
Select distinct concat(author_lname, ' ', author_fname) from books;
Select distinct author_lname, author_fname from books;
select author_lname from books;
select distinct released_year, author_lname, title from books order by released_year, title;
select distinct released_year, author_lname, title from books order by title;
select author_fname from books order by 1 desc;
select title, author_fname, released_year from books order by 3 desc limit 3,10000000;
select title from books where title like '%\%%' or '%\_%';
select title from books where title like '%\_%';

select title from books order by CHAR_LENGTH(title) desc limit 1;
select distinct author_lname from books where author_lname like '% %';
select stock_quantity from books order by 1 limit 1,2;
select count(distinct author_lname, author_fname) from books;
select count(title) from books where title like '%The%';
select title, author_lname from books limit 5;
SELECT title, author_lname FROM books GROUP BY author_lname LIMIT 5;
select count(title) as 'Number of books', author_lname FROM books GROUP BY author_lname;
select count(title) from books where author_lname='Gaiman' or author_lname='Eggers';
select author_lname, author_fname,released_year, count(title) as 'Books were released' FROM books GROUP BY 3 order by 4 desc;
select CONCAT('In ', released_year,' ',count(*),' - book(s) were released') as 'Book releases' FROM books GROUP BY released_year order by count(title) desc;
