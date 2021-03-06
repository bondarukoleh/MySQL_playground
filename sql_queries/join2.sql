create table reviewers(
f_name varchar(100),
l_name varchar(100),
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

create table series(
title varchar(100),
released_year YEAR(4),
genre varchar(100),
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

create table reviews(
rating DECIMAL(2, 1),
series_id INT,
reviewer_id INT,
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
FOREIGN KEY(series_id) REFERENCES series(id) ON DELETE CASCADE,
FOREIGN KEY(reviewer_id) REFERENCES reviewers(id) ON DELETE CASCADE
);

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (f_name, l_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
 
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),(8,4,8.5),(8,2,7.8),(8,6,8.8),
    (8,5,9.3),(9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),
    (9,5,4.5),(10,5,9.9),(13,3,8.0),(13,4,7.2),(14,2,8.5),
    (14,3,8.9),(14,4,8.9);

set sql_mode=(SELECT replace(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
select @@sql_mode;
show tables;
show errors;
select * from reviews;
select series.title, reviews.rating from series join reviews on series.id=reviews.series_id;
select title, rating from series, reviews where series.id=reviews.series_id;
select substring(convert(avg(reviews.rating), Char), 1, 4) as 'Rating',
 series.title from reviews join series on series.id=reviews.series_id group by series.id order by reviews.rating desc;
 
select ROUND(avg(reviews.rating), 1) as 'Rating',
 series.title from reviews join series on series.id=reviews.series_id group by series.id order by reviews.rating desc; 
select reviewers.f_name, reviewers.l_name, substring(convert(avg(reviews.rating), char), 1, 4) from reviewers join reviews on reviewers.id=reviews.reviewer_id
group by reviewers.id order by reviews.rating desc;
select series.title as 'Unreviewed' from series left join reviews on series.id=reviews.series_id where reviews.rating is null;
select series.genre, round(avg(reviews.rating), 2) as 'AVG rating' from series join reviews on series.id=reviews.series_id group by series.genre;
select reviewers.f_name, reviewers.l_name, count(reviews.reviewer_id) as 'COUNT',
 ifnull(min(reviews.rating), 0) as MIN,
 ifnull(max(reviews.rating), 0) as MAX,
 ifnull(round(avg(reviews.rating), 2), 0) as AVG,
 if(avg(reviews.rating) > 0, 'ACTIVE', 'INACTIVE') as STATUS,
 -- SAME AS
 case 
	when avg(reviews.rating) > 0 then 'ACTIVE'
    else 'INACTIVE'
    end as 'STATUS'
 from reviewers left join reviews on reviewers.id=reviews.reviewer_id group by reviewers.id;
 
 select series.title, round(avg(reviews.rating), 2) as AVG_RATING, concat(reviewers.f_name, ' ', reviewers.l_name) as 'Reviewer' from
  series join reviews on series.id=reviews.series_id
  join reviewers on reviewers.id=reviews.series_id group by reviewers.id;