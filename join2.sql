create table reviewers(
f_name varchar(100),
l_name varchar(100),
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

create table series(
title varchar(100),
released_year int(4),
ganre varchar(100),
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

create table reviews(
rating DECIMAL(10, 2),
series_id INT,
reviewer_id INT,
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
FOREIGN KEY(series_id) REFERENCES series(id) ON DELETE CASCADE,
FOREIGN KEY(reviewer_id) REFERENCES reviewers(id) ON DELETE CASCADE
);

insert into reviwers(f_name, l_name) values
('Blue', 'Steele'),
('Wyatt', 'Earp');

insert into series(rating, released_year, ganre) values
('Archer', 2009, 'Animation'),
('Fargo', 2014, 'Drama');

insert into reviews(series_id, reviewer_id, rating) values
(2, 1, 8.9),
(2, 2, 9.5);

show tables;
show errors;