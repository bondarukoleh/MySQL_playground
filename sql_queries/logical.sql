select * from books;
select * from books where released_year != 2017;
select * from books where author_lname not like '%%';
select * from books where released_year >= '2000';
select 'a' = 'A';
select 'a' <= 'A';
select title, author_fname, released_year from books where author_lname like 'Egg%' && released_year > 2010;
select * from books where released_year not between 2000 AND 2010;
select cast('2017-01-05' AS TIME);
select title, author_lname from books where author_lname IN ('eggers', 'lahiri');
select title, author_lname, released_year from books where released_year % 2 = 0 AND released_year >= 2000;
alter table books add column ganre VARCHAR(50);
insert into books(ganre) values();
SELECT 
    title,
    released_year,
    CASE
        WHEN released_year >= 2000 THEN 'Modern'
        WHEN
            released_year < 2000
                AND released_year < 1950
        THEN
            'Middle'
        ELSE 'Ancient'
    END AS 'Time'
FROM
    books;
    select * from books where pages between 100 and 200;
select author_Lname from books where author_lname like 'C%' or author_Lname like 'S%';
select author_Lname from books where author_Lname in ('C%', 'S%');