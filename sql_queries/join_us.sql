create table emails(
	email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP default now()
);

alter table emails modify column email VARCHAR(255) NOT NULL PRIMARY KEY;
desc emails;
insert into emails(email) values('test@gmail.com');
select * from emails order by created_at;
select date_format(min(created_at), '%M %D %Y') as earliest_date from emails;
select * from emails where created_at=(select min(created_at) from emails);
select date_format(created_at, '%M') as Mounth, count(*) from emails group by Mounth ORDER BY 2 desc;
select count(*) as yahoo_users from emails where email like '%yahoo.com';
select case
	when email like '%gmail%' then 'gmail'
	when email like '%yahoo%' then 'yahoo'
	when email like '%hotmail%' then 'hotmail'
	else 'other'
    end as provider,
count(*) as total_users from emails group by provider;
