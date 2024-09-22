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

INSERT INTO EmployeeView (id,first_name,last_name,roles) VALUES
(11,"Piyush","Bansal","Data Analyst");

SELECT * FROM employee;

DELETE FROM employee WHERE id=11 AND salary is NULL;
UPDATE EmployeeView SET roles="IT_PROGRAMMER"
WHERE roles="IT_PROG";
DELETE  FROM EmployeeView 
WHERE id=5 AND roles="TESTER";
DELETE  FROM employee WHERE id=5;
DELETE FROM employee WHERE ID=11;


CREATE VIEW EmployeeDetails AS
SELECT id,first_name,last_name, salary
FROM employee
WHERE salary>(SELECT AVG(salary) FROM employee);

SELECT * FROM EmployeeDetails;
SELECT * FROM department;

CREATE VIEW EmployeeDet AS 
SELECT e.id,e.first_name,e.last_name,e.salary,d.dept_name
FROM employee e,department d;

SELECT * FROM EmployeeDet;

SELECT * FROM employee;
DESC employee;

CREATE TABLE employee1(
emp_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50),
mobile VARCHAR(50),
hire_date DATE,
job_id INT,
salary FLOAT,
manager_id INT,
dept_id INT
);

DROP TABLE employee1;

CREATE TABLE department1(
dept_id INT,
dept_name VARCHAR(50),
manager_id INT,
location_id INT

);
SELECT * FROM employee1;

INSERT INTO employee1 VALUES
(101,"Manish","Kumar","mk@gmail.com",9876543,'2024-02-22',21,25000,99,65),
(102,"Nitin","Josh","nj@gmail.com",9876523,'2024-03-22',22,24000,100,66),
(103,"Shetal","Singh","ss@gmail.com",9126543,'2024-02-28',23,23000,101,67);

SELECT * FROM department1;
INSERT INTO department1 VALUES
(65,"HR",99,1),
(66,"IT",100,2);

DROP TABLE department1;


DELIMITER $$
CREATE PROCEDURE get_employee()
BEGIN
SELECT e.first_name,e.last_name,e.email,d.dept_name 
FROM 
employee1 e
JOIN 
department1 d
ON e.dept_id=d.dept_id;

END $$
DELIMITER ;


CALL get_employee();

DROP PROCEDURE get_employee;


DELIMITER $$

CREATE PROCEDURE GetLimitedEmployee(IN limit_count INT)
BEGIN
    SELECT 
        first_name, 
        last_name, 
        salary, 
        hire_date
    FROM 
        employee1
    LIMIT limit_count;
END$$

DELIMITER ;

CALL GetLimitedEmployee(3);


DELIMITER $$

CREATE PROCEDURE CountEmployee(OUT total_count INT)
BEGIN
    SELECT 
        count(*) INTO 
        total_count
    FROM 
        employee1;    
END$$
DELIMITER ;

CALL CountEmployee(@employee_count);
SELECT @employee_count;


DELIMITER $$

CREATE FUNCTION GetEmployeeGrade(salary DECIMAL(10, 2)) 
RETURNS CHAR(1)
BEGIN
    DECLARE grade CHAR(1);

    IF salary BETWEEN 0 AND 10000 THEN
        SET grade = 'D';
    ELSEIF salary BETWEEN 10001 AND 30000 THEN
        SET grade = 'C';
    ELSEIF salary BETWEEN 30001 AND 60000 THEN
        SET grade = 'B';
    ELSE
        SET grade = 'A';
    END IF;

    RETURN grade;
END$$

DELIMITER ;

SELECT first_name, salary, GetEmployeeGrade(salary) AS grade
FROM employee1;
