DROP DATABASE IF EXISTS Event_Management;
CREATE DATABASE Event_Management;
USE Event_Management;

CREATE TABLE user(
	user_id int NOT NULL AUTO_INCREMENT, 
    user_name varchar(25) NOT NULL, 
    hashed_password varchar(255) NOT NULL,
    email varchar(30) UNIQUE,
    location varchar(50),
    active boolean DEFAULT 1,
    no_of_events_hosted int DEFAULT 0 ,
    no_of_registered_events int DEFAULT 0 ,
    PRIMARY KEY(user_id)
);

CREATE TABLE event(
	event_id int NOT NULL AUTO_INCREMENT UNIQUE, 
    title varchar(100) NOT NULL, 
    description varchar(200),
    date date,
    time time,
    location varchar(50),
    active boolean DEFAULT 1,
    user_id INT NOT NULL,
    last_modified timestamp DEFAULT CURRENT_TIMESTAMP,
    no_of_attendees int DEFAULT 0 ,
    PRIMARY KEY(event_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);


-- CREATE TABLE portal_registration(
-- 	portal_registration_id int NOT NULL AUTO_INCREMENT, 
--     user_id int NOT NULL, 
--     hashed_password varchar(30) NOT NULL,
--     PRIMARY KEY(portal_registration_id),
--     FOREIGN KEY (user_id) REFERENCES users(user_id)
-- );

CREATE TABLE event_registration(
	event_registration_id int NOT NULL AUTO_INCREMENT, 
    event_id int NOT NULL, 
    user_id int NOT NULL,
    time_stamp timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(event_registration_id),
    FOREIGN KEY (event_id) REFERENCES event(event_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    UNIQUE (user_id, event_id)
);

CREATE TABLE admin(
	admin_id int NOT NULL AUTO_INCREMENT, 
    admin_name varchar(25) NOT NULL, 
    hashed_password varchar(255) NOT NULL,
    email varchar(30) UNIQUE,
    location varchar(50),
    PRIMARY KEY(admin_id)
);

DELIMITER $$

CREATE TRIGGER update_event_last_modified
BEFORE UPDATE ON event
FOR EACH ROW
BEGIN
    SET NEW.last_modified = CURRENT_TIMESTAMP();
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER update_no_of_attendees
AFTER INSERT ON event_registration
FOR EACH ROW
BEGIN
    UPDATE event SET no_of_attendees = no_of_attendees + 1 WHERE event_id = NEW.event_id;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER update_no_of_registered_events
AFTER INSERT ON event_registration
FOR EACH ROW
BEGIN
    UPDATE user SET no_of_registered_events = no_of_registered_events + 1 WHERE user_id = NEW.user_id;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER update_no_of_events_hosted
AFTER INSERT ON event
FOR EACH ROW
BEGIN
    UPDATE user SET no_of_events_hosted = no_of_events_hosted + 1 WHERE user_id = NEW.user_id;
END$$

DELIMITER ;

INSERT into admin(admin_name,hashed_password,email,location) VALUES('Soundharavalli', SHA2('Hello_1', 256), 'adminsoundh@gmail.com', 'Madurai');
INSERT into admin(admin_name,hashed_password,email,location) VALUES('Kathiresan', SHA2('Jeyam', 256), 'adminkathiresan@gmail.com', 'Madurai');
INSERT into admin(admin_name,hashed_password,email,location) VALUES('Sevugan', SHA2('UNSW@1', 256), 'adminsevugan@gmail.com', 'Madurai');

SELECT * FROM event;
SELECT * FROM admin;
SELECT * FROM event_registration;
SELECT * FROM user;