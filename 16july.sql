CREATE DATABASE school;
USE school;
SHOW DATABASES;

-- Table 
CREATE TABLE student(
roll_no INT,
student_name VARCHAR(50),
age INT,
birth_date DATE
);

SHOW TABLES;
-- describe query
DESC student;

-- To add column to existing table
-- ALTER TABLE <table-name> ADD COLUMN <column-name> <data-type>


 