CREATE DATABASE D1;
USE D1;
SHOW TABLES;
CREATE TABLE employee(
id INT,
first_name CHAR(20),
last_name CHAR(20),
salary INT,
dept_id INT ,
roles VARCHAR(20),
CONSTRAINT dept_emply FOREIGN KEY(dept_id)
REFERENCES  department(id)
);
DROP TABLE employee;
DROP TABLE department;
CREATE TABLE department(
id INT PRIMARY KEY,
dept_name CHAR(30)
);
DESC employee;
DESC department;

INSERT INTO department VALUES
(1,"IT"),
(2,"CS");

ALTER TABLE employee DROP PRIMARY KEY;
INSERT INTO employee VALUES
(1,"Rahul","Sharma",45000,1,"IT_PROG"),
(2,"Pratik","Gajne",67000,2,"ML_ENGG"),
(3,"Naresh","Bhatt",48000,1,"IT_PROG"),
(4,"Nisha","Shetty",65000,1,"IT_PROG"),
(5,"Vishal","Kumar",56000,2,"TESTER"),
(6,"Niranjan","Pandey",43000,1,"IT_PROG"),
(7,"Simran","Mehta",56000,1,"SUPPORT"),
(8,"Vipul","Shekhawat",67000,2,"SUPPORT"),
(9,"Binay","Gosh",32000,1,"IT_PROG"),
(10,"Nitin","Rao",54000,2,"TESTER");
SELECT * FROM employee;
SELECT * FROM department;

CREATE VIEW EmployeeView AS
SELECT id,first_name,last_name,roles
FROM employee
WHERE roles="IT_PROG";
SELECT * FROM EmployeeView;

INSERT INTO Employee VALUES
(11,"Piyush","Bansal",52000,2,"Data Analyst");

INSERT INTO EmployeeView VALUES 
(11,"Piyush","Bansal","Data Analyst");

SELECT * FROM employee;
