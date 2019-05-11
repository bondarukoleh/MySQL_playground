set sql_mode=(SELECT replace(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
show errors;

select min(created_at), id, username from users;
select * from users order by created_at limit 5;
select dayname(created_at), count(dayofweek(created_at)) as counted from users group by dayofweek(created_at) order by counted desc;
select users.username from users left join photos on users.id=photos.user_id where photos.user_id is NULL;
select users.username, photos.user_id from users left join photos on users.id=photos.user_id where photos.user_id is NULL;
select users.username, photos.image_url, count(likes.photo_id) from users join photos on users.id=photos.user_id
	join likes on photos.id=likes.photo_id group by photos.id order by 3 desc limit 1;
select (select count(*) from photos) / (select count(*) from users);
select count(tags.id), tags.tag_name from tags join photo_tags on tags.id=photo_tags.tag_id group by tags.id order by 1 desc limit 5;
select users.username, count(photos.image_url), count(likes.photo_id) from users join photos on users.id=photos.user_id
	join likes on photos.id=likes.photo_id group by users.username;
select count(*) from photos;
select likes.user_id from likes;
select users.username, count(user_id) as 'num_likes' from likes join users on likes.user_id=users.id
 GROUP BY user_id HAVING num_likes=(select count(*) from photos);