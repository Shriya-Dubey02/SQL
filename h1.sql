CREATE DATABASE ssb1 ;
USE ssb1;
SHOW DATABASES;

CREATE TABLE candidates(
student_name CHAR(25),
age INT,                         
hsc_percent INT
);
SHOW TABLES;
DESC candidates;

ALTER TABLE candidates ADD COLUMN email VARCHAR(50) FIRST;

DESC candidates;
DROP TABLE candidates;