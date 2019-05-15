show tables;
select * from unic_cats;

DELIMITER $$
CREATE TRIGGER must_be_adult
     BEFORE INSERT ON unic_cats FOR EACH ROW
     BEGIN
          IF NEW.age > 20
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cat cannot be more then 20 years old.';
          END IF;
     END;
$$
DELIMITER ;

desc unic_cats;
insert into unic_cats(name, age) values('Old cat', 22);
show errors;
select non_existing_column from unic_cats;

DELIMITER $$
CREATE TRIGGER cannot_follow_yourself
     BEFORE INSERT ON follows FOR EACH ROW
     BEGIN
          IF NEW.follower_id = NEW.followee_id 
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'User cannot follow himself';
          END IF;
     END;
$$
DELIMITER ;

select * from follows;
insert into follows(followee_id, follower_id) VALUES(1000, 1000);

-- Logging trigger
create table logs(
	message VARCHAR(255),
    unic_value VARCHAR(255)
);
DELIMITER $$
CREATE TRIGGER log_actions
     AFTER DELETE ON follows FOR EACH ROW
     BEGIN
          INSERT INTO logs(unic_value, message)
			values(OLD.follower_id, 'User is unfollowed another one');	
     END;
$$
DELIMITER ;

drop TRIGGER log_actions;

delete from follows where follower_id=8;
select * from logs;
show triggers;
show errors;

