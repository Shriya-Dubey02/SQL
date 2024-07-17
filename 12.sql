CREATE DATABASE facebook;
USE facebook;
SHOW DATABASES;

CREATE TABLE users(
user_name CHAR(100),
email VARCHAR(70)
);
SHOW TABLES;
DESC users;

ALTER TABLE users ADD COLUMN phone_no INT FIRST;
DESC users;