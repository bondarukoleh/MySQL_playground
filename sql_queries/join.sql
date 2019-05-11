create table customers(
	f_name VARCHAR(100),
	l_name VARCHAR(100),
	email VARCHAR(100),
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

create table orders(
    order_date DATETIME default now(),
    amount INT,
    price DECIMAL(8, 2) NOT NULL,
    good VARCHAR(100),
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customers(id)
);

insert into customers(f_name, l_name, email) values
('Roy', 'Jones', 'rg@gmail.com'),
('David', 'Bowie', 'db@gmail.com'),
('Angus', 'Young', 'ay@gmail.com'),
('Boy', 'Ramones', 'br@gmail.com');

insert into orders(amount, price, good, customer_id) values
(1, 10.55, 'carpet', 1),
(5, 20000, 'guitar', 3),
(10, 547.89, 'microphone', 3),
(2, 12.50, 'baskets', 3),
(2, 300.05, 'golf ball', 4);
insert into orders(amount, price, good, customer_id) values
(2, 21.10, 'carpet', 1);

select database();
show tables;
show errors;
set sql_mode=(SELECT replace(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
select @@sql_mode;

rename table cusomers to customers;
select * from customers;
select * from orders;
update orders set order_date=NOW() where id=4;
-- "join" queried without join 
select good from orders where customer_id=(select id from customers where l_name='Jones');
-- another "join" queried without join 
select f_name, good from orders, customers where orders.customer_id=customers.id;
-- same stuff but with join
select sum(orders.price) as 'Total price', sum(orders.amount) as 'Total ordered amount',
 orders.good, customers.l_name from orders join customers on orders.customer_id=customers.id
 group by customers.id order by sum(orders.amount) desc;
select good, sum(price) from orders group by good;

SELECT customers.f_name, IFNULL(SUM(amount), 0) FROM orders RIGHT JOIN customers ON orders.customer_id = customers.id
GROUP BY customers.id;


select customers.f_name as 'FIRST NAME',
 IFNULL(sum(orders.amount), 0) AS 'AMOUNT',
 ifnull(AVG(orders.amount), 0),
 case 
	when AVG(orders.amount) >= 3 then 'PASSING'
    else 'FAIL'
    end as 'STATUS'
 from customers left join orders on customers.id=orders.customer_id group by customers.f_name;


