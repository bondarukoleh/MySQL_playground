alter table unic_cats add column date_column DATE;
alter table unic_cats add column time_column TIME;
alter table unic_cats add column datetime_column DATETIME;
alter table unic_cats add column created_at TIMESTAMP default NOW();
alter table unic_cats add column changed_at TIMESTAMP default NOW() on update current_timestamp;

insert into unic_cats(name, date_column, time_column, datetime_column) values('Time cat', '2010-05-12', '12:30:45', '2010-05-12 12:30:45');
insert into unic_cats(name, date_column, time_column, datetime_column) values('Time cat2', '2009-01-08', '12:00:05', '2009-01-08 12:00:05');
insert into unic_cats(name, date_column, time_column, datetime_column) values('Time cat3', '2001-10-10', '16:05:15', '2001-10-10 16:05:15');
select * from unic_cats order by datetime_column desc;

update unic_cats set name='New time cat' where time_column='12:30:45';
select DATE_FORMAT(NOW(), 'Time - %r, Day of week - %W, Day of mounth - %D, Mounth - %M, Year - %Y') as 'Date info';
select DAYNAME(NOW());