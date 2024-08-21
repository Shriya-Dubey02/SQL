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
ALTER TABLE student ADD COLUMN marks INT;

DESC student;
-- ALTER TABLE <table-name> ADD COLUMN <new column-name> <data-type> AFTER <existing col-name>
ALTER TABLE student ADD COLUMN teacher_name VARCHAR(60) AFTER student_name;
DESC student;

-- ALTER TABLE <table-name> ADD COLUMN <new column-name> <data-type> FIRST;

ALTER TABLE student ADD COLUMN email VARCHAR(70) FIRST;
DESC student;

-- ALTER TABLE<table-name> DROP COLUMN <column-name>
DROP TABLE student;
DROP DATABASE school;

-- 17 July

CREATE DATABASE school2;
USE school2;
SHOW DATABASES;

CREATE TABLE books(
student_enrollment INT,
library_id VARCHAR(10)
);

-- to change the column name or data type
-- ALTER TABLE <table-name> CHANGE <old-col-name> <new-col-name> <data-type>
ALTER TABLE books CHANGE student_enrollment student_enrollment_no CHAR(10);
DESC books;


-- to change the table name
-- ALTER TABLE <old_table_name> RENAME TO <new_table_name>;

ALTER TABLE books RENAME TO books_details;
DESC books_details;
SHOW TABLES;

CREATE DATABASE xyz_company;
USE xyz_company;

CREATE TABLE department(
department_id CHAR(4),
department_name VARCHAR(25)

);
DESC department;
-- To insert values in the table
-- INSERT INTO <table-name> VALUES (v1,v2,v3....)
INSERT INTO department VALUES ("D1","IT");
SELECT * FROM department;
-- To insert data into specified columns;
INSERT INTO department (department_id) VALUES ("D2");
SELECT * FROM department;
INSERT INTO department (department_name) VALUES ("IT2");
SELECT * FROM department;

INSERT INTO department (department_name,department_id)
VALUES("Marketing", "D3");
SELECT * FROM department;


CREATE TABLE employeee(
employee_id INT,
employee_name VARCHAR(200),
employee_age INT
);
DESC employeee;

INSERT INTO employeee VALUES ("e1","Manish","25");
SELECT * FROM employeee;

-- to insert multiple values
INSERT INTO employeee VALUES
(12,"Pooja",29),
(13,"Nikita",26),
(14,"Sanchi",25),
(15,"Shriya",28);
SELECT * FROM employeee;

INSERT INTO employeee (employee_id,employee_name)
VALUES
(16, "ghjhl"),
(17 ,"Shiv"),
(18 ,"Happy");
SELECT * FROM employeee;

CREATE TABLE shops(
shop_name CHAR(20),
shop_no INT,
owner_name CHAR(25)
);
DESC shops;

INSERT INTO shops VALUES
("abc",01,"Manish"),
("xyz",02, "Happy"),
("pqr",03,"Nikki");
SELECT * FROM shops;

INSERT INTO shops (shop_name,shop_no)
VALUES
("pqs",04),
("nqr",5);
SELECT * FROM shops;
SHOW TABLES;

DROP TABLE amazon;
-- 18 JULY CONSTRAINTS
DROP TABLE department;
CREATE TABLE department(
department_id INT UNIQUE NOT NULL,-- PRIMARY KEY
department_name VARCHAR(50) NOT NULL 
);

INSERT INTO department VALUES (101,"Nisha");
SELECT * FROM department;
INSERT INTO department VALUES (null,"Ankita");
DESC department;
DROP TABLE employee;
CREATE TABLE employee(
employee_id CHAR(2) PRIMARY KEY,
employee_name VARCHAR(60) NOT NULL,
employee_email VARCHAR(90) UNIQUE NOT NULL
);
DESC employee;

-- TO ADD NOT NULL CONSTRAINT BY ALTER METHOD
-- ALTER TABLE <TABLE-NAME> MODIFY <COL-NAME> <DATA-TYPE> NOT NULL;
-- TO REMOVE NOT NULL DON'T ADD NOT NULL

ALTER TABLE employee MODIFY employee_name VARCHAR(60);
DESC employee;
ALTER TABLE employee MODIFY employee_name VARCHAR(60) NOT NULL;
DESC employee;
-- UNIQUE CONSTRAINT WILL BE REMOVED
ALTER TABLE employee DROP INDEX employee_email;
DESC employee;
-- TO ADD UNIQUE CONSTRAINT
ALTER TABLE employee ADD UNIQUE (employee_email);
DESC employee;
-- TO DROP PRIMARY KEY 
ALTER TABLE employee DROP PRIMARY KEY;
DESC employee;
-- TO ADD PRIMARY KEY
ALTER TABLE employee ADD PRIMARY KEY (employee_id);
DESC employee;

ALTER TABLE employee ADD COLUMN employee_salary INT;
DESC employee;
-- TO ADD DEFAULT values
ALTER TABLE employee ALTER employee_salary SET DEFAULT 0;
DESC employee;

INSERT INTO employee (employee_id,employee_name,employee_email)
 VALUES
("E2","NITIYA","n@gmail.com");
SELECT * FROM employee;
INSERT INTO employee VALUES ("E3","NIKITA","ne@gmail.com",50000);
SELECT * FROM employee;
DESC employee;

-- 19 JULY 
-- TO DROP THE DEFAULT VALUE
ALTER TABLE employee ALTER employee_salary DROP DEFAULT;

-- CHECK CONSTRAINT 
-- CANNOT BE VIEWED BY DESC;
-- ALTER TABLE <table-name> ADD CONSTRAINT <constraint-name> CHECK (condition);
ALTER TABLE employee ADD CONSTRAINT check_salary CHECK (employee_salary>=0);
INSERT INTO employee VALUES ("E4","NISHA","NI@gmail.com",50000);

-- TO DROP THE CHECK CONSTRAINT
-- ALTER TABLE <table-name> DROP CONSTRAINT <constraint-name>;
ALTER TABLE employee DROP CONSTRAINT check_salary;


-- FOREIGN KEY CONSTRAINT
CREATE TABLE category(
c_id INT PRIMARY KEY,
category_name VARCHAR(50) NOT NULL
);

DROP TABLE product;

CREATE TABLE product(

p_id INT PRIMARY KEY,
product_name VARCHAR(60) NOT NULL,
product_price INT DEFAULT 0 CHECK (product_price>=0),
c_id INT,
CONSTRAINT category_product FOREIGN KEY (c_id)
REFERENCES category(c_id)
);
DESC product;
INSERT INTO category VALUES(1,"Electronics");
INSERT INTO product VALUES(2,"Laptop",50000,1);
SELECT * FROM category;
SELECT * FROM product;


-- 22 July
-- FOREIGN KEY
CREATE TABLE school(
s_id INT PRIMARY KEY,
s_name VARCHAR(100)
);

CREATE TABLE student(
roll_no INT PRIMARY KEY,
st_name VARCHAR(100) NOT NULL,
phone_no BIGINT,
s_id INT,
CONSTRAINT student_school FOREIGN KEY (s_id)
REFERENCES school(s_id)
);
DESC student;

CREATE TABLE courses(
course_id VARCHAR(20) PRIMARY KEY,
course_name CHAR(30) NOT NULL

);
CREATE TABLE teacher(
teacher_name CHAR(30),
teacher_no INT,
course_id VARCHAR(20),
CONSTRAINT course_teacher FOREIGN KEY (course_id)
REFERENCES courses(course_id)

);
DESC teacher;
-- TO DROP FOREIGN KEY
ALTER TABLE product DROP FOREIGN KEY category_product;

INSERT INTO product VALUES(120,"Tshirt",520,100);
DESC category;
INSERT INTO category VALUES(100,"clothes");
SELECT*FROM category;

-- 23 July
-- To add FOREIGN KEY BY ALTER METHOD
ALTER TABLE product ADD CONSTRAINT product_category
FOREIGN KEY(c_id) REFERENCES category(c_id);

-- Operators 
SELECT (100>=95);
SELECT(100<=99);
SELECT(5<100 and 100>=98 and 100!=1000);
SELECT(20<=16 or 30!=30);
SELECT not(20<=16 or 30!=30);
drop table employee;
CREATE TABLE employee(
e_id INT UNIQUE,
ename CHAR(20),
city CHAR(30),
salary INT,
department VARCHAR(5),
age INT,
CONSTRAINT emploe_department FOREIGN KEY (department)
REFERENCES department(d_id)

);
SELECT * FROM employee;
drop table department;
CREATE TABLE department(
d_id VARCHAR(5) PRIMARY KEY,
department CHAR(20)
);

DESC department;
INSERT INTO employee VALUES
(1111, "NIKITA","MUMBAI", 67000,"D1",25),
(1112, "PRAJAKTA","PUNE", 80000,"D1",26),
(1113, "MANISHA","BANGALORE", 20000,"D2",24),
(1114, "NILESH","MUMBAI", 35469,"D3",28),
(1115, "MONAL","PUNE", 34452,"D2",29);
DESC employee;
SELECT * FROM employee;
SELECT * FROM employee;
INSERT INTO department VALUES 
("D1","MARKETING"),
("D2","IT"),
("D3","HUMAN RESOURCE");
DESC department;
SELECT * FROM department;
SELECT e_id FROM employee AS EMPLOYMENT_ID;
SELECT ename,salary FROM employee;

-- 24 JULY
-- ALIAS IS TEMPORARY NAME GIVEN TO COLUMNS
SELECT (10>7) AS Answer;
-- WHERE CLAUSE
SELECT * FROM employee WHERE e_id= 1111;
SELECT ename,city FROM employee WHERE city= "MUMBAI";
SELECT * FROM employee WHERE salary<=20000;
SELECT * FROM employee WHERE city= "mumbai" AND salary<50000;
SELECT * FROM employee WHERE city= "mumbai" OR city="bangalore";
SELECT * FROM employee WHERE salary>30000 AND salary<=60000;
SELECT * FROM employee WHERE department="D1" AND salary<=90000;
SELECT * FROM employee WHERE department="D1" AND city= "pune";

-- IN OPERATOR IS SHORTCUT OF OR OPERATOR
SELECT * FROM employee WHERE e_id IN(1111,1112,1113);
SELECT * FROM employee WHERE city IN("MUMBAI","PUNE");

-- BETWEEN OPERATOR IS USED FOR RANGE
SELECT * FROM employee WHERE salary BETWEEN 20000 and 30000;
ALTER TABLE employee ADD COLUMN age INT;
DESC employee;

-- UPDATE QUERY
UPDATE employee SET age=0;
UPDATE employee SET age=25 WHERE e_id = 1111;
UPDATE employee SET age=24 WHERE e_id=1112;
UPDATE employee SET age=23 WHERE e_id=1113;
UPDATE employee SET age=26 WHERE e_id=1114;
UPDATE employee SET age=29 WHERE e_id=1115;

UPDATE employee SET city="PUNE" WHERE e_id=1111;
UPDATE employee SET city="MUMBAI" WHERE e_id=1112;
UPDATE employee SET salary=salary+5000 WHERE e_id=1115;
UPDATE employee SET salary=salary+5000 WHERE e_id=1114;
UPDATE employee SET age=age+2;
UPDATE employee SET salary=salary-2000 WHERE department="D1";
UPDATE employee SET city=null WHERE e_id IN (1111,1113);
-- FOR FETCHING "NULL" IS OPERATOR IS USED
SELECT * FROM employee WHERE city IS NULL;
SELECT * FROM employee WHERE city IS NOT NULL;
SELECT * FROM employee WHERE ename!="nikita";

SELECT * FROM employee;
CREATE DATABASE shriya;
USE shriya;
-- 25 JULY
-- LIKE OPERATOR
SELECT * FROM employee WHERE ename LIKE "n%"; -- START
SELECT * FROM employee WHERE ename LIKE "n%a"; -- START AND END TOGETHER
SELECT * FROM employee WHERE ename LIKE "m_n%";
SELECT * FROM employee WHERE ename NOT LIKE "m_n%";
SELECT * FROM employee WHERE ename LIKE "%n%";
SELECT * FROM employee WHERE ename NOT LIKE "m%";
SELECT * FROM employee WHERE ename LIKE "%ta";
SELECT * FROM employee WHERE ename LIKE "m%" AND city="pune";
SELECT * FROM employee WHERE ename LIKE "%t_";

-- DELETE FROM <TABLE-NAME> WHERE CONDITION;
DELETE FROM employee WHERE e_id= 1114;
SELECT * FROM employee;

DELETE FROM employee WHERE department= "D1" AND age<28;
DELETE FROM employee WHERE ename LIKE "%l"; 
DELETE FROM employee;

-- TRUNCATE TABLE table-name 

-- AGGREGATE FUNCTIONS
-- 
SELECT COUNT(*) AS number_of_employees FROM employee;
SELECT COUNT(*) AS no_of_department FROM department;

SELECT DISTINCT city FROM employee;
DESC employee;

INSERT INTO employee VALUES (1116,"NISHA",null,62300,"D1",24);
SELECT * FROM employee;
SELECT count(DISTINCT city) FROM employee;
SELECT count(DISTINCT department ) FROM employee;
SELECT MIN(salary) FROM employee;
SELECT MIN(age) FROM employee;
SELECT MAX(salary) FROM employee;
SELECT SUM(salary*12) FROM employee;
SELECT AVG(salary) FROM employee;
SELECT AVG(age) FROM employee;

SELECT * FROM employee;
SELECT * FROM employee ORDER BY salary DESC,age DESC;
 -- TO ARRANGE DATA 
SELECT * FROM employee ORDER BY age ;
SELECT * FROM employee ORDER BY ename;

UPDATE employee SET salary=80000 WHERE e_id=1111;


-- 26 JULY
SELECT * FROM employee ORDER BY salary LIMIT 3;
SELECT * FROM employee ORDER BY salary DESC,age DESC LIMIT 3;
SELECT * FROM employee ORDER BY age LIMIT 2;
SELECT * FROM employee;
SELECT * FROM employee ORDER BY age DESC LIMIT 1;
-- GROUP BY
SELECT department,count(e_id) FROM employee
GROUP BY department;

SELECT city, count(e_id) FROM employee GROUP BY city;
SELECT city, sum(salary),
avg(salary),
min(salary),
max(salary),
count(e_id)
 FROM employee GROUP BY city;
 
 SELECT department,
 sum(salary) AS SUM,
 avg(salary) AS AVERAGE,
 min(salary) AS MINIMUM_SALARY,
 max(salary) AS MAXIMUM_SALARY,
 count(e_id) AS TOTAL
 FROM employee GROUP BY department; 
 
 ALTER TABLE employee ADD COLUMN Gender CHAR(10);
 DESC employee;
 UPDATE employee SET gender= "F";
 UPDATE employee SET gender = "M" WHERE e_id= 1114;
 -- Having is used to filter out data
 SELECT gender, count(e_id) FROM employee GROUP BY gender HAVING gender ="F";
 -- BY GROUP METHOD
 SELECT gender,
 count(e_id) 
 FROM employee WHERE salary<50000
 GROUP BY gender 
 HAVING gender="F"; 
 -- BY WHERE
 SELECT count(*) FROM empolyee WHERE salary<50000 AND gender="F";
 
 SELECT department,
 avg(salary) 
 FROM employee
 GROUP BY department 
 HAVING avg(salary)<50000;
 
  SELECT department,
 avg(salary) AS average_salary
 FROM employee
 GROUP BY department 
 ORDER BY average_salary DESC LIMIT 1;
 
 USE shriya;
 
 SELECT department,
 count(e_id) AS NO_OF_EMPLOYEES
 FROM employee 
 GROUP BY department
 ORDER BY NO_OF_EMPLOYEES LIMIT 1;
 
 SELECT department,sum(salary)
 FROM employee
 GROUP BY department ORDER BY sum(salary) LIMIT 1;
 
 -- 29 JULY
 -- BUILT IN FUNCTIONS
 SELECT CONCAT("SHRIYA", " " ,"DUBEY");
 SELECT * FROM employee;
 SELECT e_id,ename,CONCAT(e_id,"-",ename) FROM employee;
 SELECT e_id,ename,CONCAT(e_id,".",ename,"@itvedant.com") AS Email FROM employee;
 
 SELECT UPPER("sql");
  SELECT LOWER("SHRIYA");
  INSERT INTO employee VALUES 
  (1117,"ANKITA",lower("MUMBAI"),25900,"D1",26,UPPER("f"));
SELECT LENGTH("HELLO");

SELECT LENGTH("NISHA")>20;
SELECT LENGTH("NISHA")>2;
SELECT ename,LENGTH(ename) FROM employee;
-- H E L L O
-- 1 2 3 4 5
SELECT substr("shriya",2,1);
SELECT substr("hello",2,2); 
SELECT substr("hello",5,1);
SELECT ename,substr(ename,LENGTH(ename),1) FROM EMPLOYEE;
SELECT ename,UPPER(substr(ename,LENGTH(ename),1)) FROM EMPLOYEE;

SELECT CONCAT(ename,"-",UPPER(substr(ename,LENGTH(ename),1))) FROM employee; 

SELECT CONCAT(LOWER(substr(ename,1,1)) , substr(ename,2,LENGTH(ename)-1)) FROM employee;
SELECT CONCAT((LOWER(substr(ename,1,1))), 
UPPER(substr(ename,2,LENGTH(ename)-2)),
LOWER(substr(ename,LENGTH(ename),1)) ) FROM employee;
SELECT UPPER(substr(ename,2,LENGTH(ename)-2)) FROM employee;
SELECT CONCAT(LOWER(substr(ename,LENGTH(ename),1))) FROM employee;

-- 30 JULY
-- NUMERIC FUNCTIONS
SELECT mod(71,3);
SELECT round(5.786,2);
-- CEIL SELECTS THE UPPER VALUE
SELECT CEIL(7.50);
-- FLOOR REMOVES THE DECIMAL values
SELECT FLOOR(45.98);
SELECT sqrt(9);
SELECT round(sqrt(17),4);
-- POSITIVE 1 FOR POSITIVE VALUES AND VICE VERSA
SELECT SIGN(-10);
-- GIVES THE NO. AS IT IS WITHOUT DOING ROUND OFF
SELECT TRUNCATE(5.67837698,4);
SELECT POW(5,2); 

SELECT CEIL(AVG(salary)) AS average_salary FROM employee;
-- DATE RELTAED FUNCTIONS
-- YYYY-MM-DD
SELECT CURDATE();
-- HH:MM::SS
SELECT CURTIME();
-- YYYY-MM-DD HH:MM:SS
SELECT NOW();
SELECT DATE("2024-10-07 07:55:23");
SELECT DATE(NOW());
SELECT DAY("2002-02-22");
SELECT MONTH(curdate());
SELECT YEAR(curdate());
DESC EMPLOYEE;
ALTER TABLE employee ADD COLUMN joining_date DATE;
SELECT * FROM employee;
UPDATE employee SET joining_date= "2024-02-22" WHERE e_id= 1111;
UPDATE employee SET joining_date= "2024-03-24" WHERE e_id= 1112;
UPDATE employee SET joining_date= "2023-02-19" WHERE e_id= 1113;
UPDATE employee SET joining_date= "2022-01-28" WHERE e_id= 1114;
UPDATE employee SET joining_date= "2022-02-12" WHERE e_id= 1115;
 UPDATE employee SET joining_date= "2022-02-16" WHERE e_id= 1116;
 SELECT e_id,ename,joining_date, YEAR(joining_date) FROM employee;
 SELECT * FROM employee WHERE YEAR(joining_date)=2022;
 SELECT * FROM employee WHERE YEAR(joining_date)= 2022 OR YEAR(joining_date)=2023;
 
 SELECT YEAR(joining_date) as joining_year ,count(e_id) FROM employee GROUP BY YEAR(joining_date) HAVING joining_year= 2022;
 SELECT date_format("2024-11-29" , "%D %M %Y");
 SELECT date_format("2024-11-29" , "%d/%m/%y");
 
 -- %w is a week no. 0- sunday, 1-monday and so on...
 SELECT date_format("2024-07-30" , "%D %M %Y %W");
 SELECT date_format("2024-07-30" , "%D %M %Y %w");
 SELECT date_format(now(),"%D %M %Y %H::%i::%s");
 SELECT date_format(now(),"%b");
SELECT * FROM employee;


-- ------------------------------------5 august--------------------------------------
-- SUBQUERIES
SELECT MIN(salary) FROM employee;
SELECT * FROM employee WHERE salary= (SELECT MIN(salary) FROM employee);
SELECT MAX(salary) FROM employee;
SELECT * FROM employee WHERE salary= (SELECT MAX(salary) FROM employee);

SELECT avg(salary) FROM employee;
SELECT * FROM employee WHERE salary < (SELECT avg(salary) FROM employee);
SELECT * FROM employee WHERE salary < (SELECT MAX(salary) FROM employee)
ORDER BY salary DESC LIMIT 1;

SELECT d_id FROM department WHERE department="Marketing";
SELECT * FROM employee WHERE department=
(SELECT d_id FROM department WHERE department="Marketing");

ALTER TABLE department ADD COLUMN department_city VARCHAR(100);
DESC department;

UPDATE department SET department_city="Mumbai" WHERE d_id= "D1";
UPDATE department SET department_city="Pune" WHERE d_id= "D2";
UPDATE department SET department_city="Bangalore" WHERE d_id= "D3";


SELECT d_id FROM department WHERE department_city= "Mumbai";
SELECT * FROM employee WHERE department IN 
(SELECT d_id FROM department WHERE department_city= "Mumbai");

SELECT * FROM department;
SELECT * FROM employee;
DESC employee;
USE shriya;
--

SELECT ename,salary,
CASE
    WHEN salary<30000 THEN "very less"
    WHEN salary<60000 THEN "Average"
    WHEN salary<100000 THEN "VERY high"
    ELSE "-"
END AS salarydata,


CASE
     WHEN department="D1" THEN "Marketing"
	 WHEN department="D2" THEN "IT"
	 WHEN department="D3" THEN "HR"
     ELSE "CS"
END AS department_name
FROM employee;

-- -----------------------------------------------------------------

desc employee;


SELECT e_id,ename,department,
CASE
     WHEN department="D1" THEN "Marketing"
	 WHEN department="D2" THEN "IT"
	 WHEN department="D3" THEN "HR"
     ELSE "-"
END AS department_name
FROM employee;
--  b.ename_e_id@itvedant.com
--  D1 2000   D2 1000   D3 2500  

SELECT * FROM employee;


-- UPDATE employee SET salary= Case;

UPDATE employee SET salary=
CASE
   WHEN department="D1" THEN salary+2000
   WHEN department="D2" THEN salary+1000
   WHEN department="D3" THEN salary+2500
   ELSE salary
END;


ALTER TABLE employee ADD COLUMN email VARCHAR(90);
SELECT * FROM employee;

--  b.ename_e_id@itvedant.com

SELECT SUBSTR("city",2,3);



UPDATE employee SET email=CONCAT(SUBSTR(city,1,1),".",ename,"_",LOWER(e_id),"@itvedant.com");


-- COALESCE

SELECT COALESCE("shriya", null,null,null,12,45,78);
SELECt coalesce();
select coalesce("NULL",11,null,10);

ALTER TABLE employee ADD COLUMN phoneno BIGINT;
DESC employee;
SELECt * FROM employee;


UPDATE employee SET phoneno=7895425412,email=null WHERE e_id IN ("E1","E2","E3");

SELECT ename,email,phoneno,coalesce(email) FROM employee;

USE xyz_company;

SELECT ISNULL("joel");

SELECT datediff(curdate(),"2024-07-25");

SELECT ename,joining_date,datediff(curdate(),joining_date) as no_of_days 
FROM employee
WHERE datediff(curdate(),joining_date)>365;

-- date_add

SELECT date_add(curdate(),INTERVAL 10 day);
SELECT date_add(curdate(),INTERVAL 10 month);
SELECT date_add(curdate(),INTERVAL 10 YEAR);
-- ----------------------------------------------------------
SELECT *,
date_add(joining_date,INTERVAL 1 YEAR) as anniversary
FROM employee;

-- ----------------------------------------------
-- ---------------------------------------------

SELECT * FROM department;
SELECT * FROM employee;

UPDATE employee SET department=null WHERE e_id=1116;
INSERT INTO department VALUES("D4","Operations","Mumbai");


SELECT * FROM employee;
SELECT * FROM department;
select coalesce(null,"amit",null,null);

-- INNER JOIN
SELECT * FROM DEPARTMENT;

SELECT e.ename,d.d_id,d.department FROM employee  e
INNER JOIN department d
ON
e.department=d.d_id;
SELECT * FROM employee e;
SELECT e.ename,d.d_id,e.department FROM employee e
INNER JOIN department d
ON
e.department =d.d_id;

-- LEFT JOIN

SELECT * FROM employee e
LEFT JOIN department d
ON
e.department=d.d_id
ORDER BY e.salary DESC LIMIT 1;

SELECT * FROM employee;
INSERT INTO department VALUE
("D5","Sales","Pune");
INSERT  INTO employee (e_id,ename,city,salary,age) VALUE 
 (1128,"Ankita","pune",50000,25);
 
-- RIGHT JOIN
SELECT * FROM employee e
RIGHT JOIN department d 
ON e.department=d.d_id
GROUP BY d.d_id
;

-- For Checking if column is null or not use IS ,dont use =
SELECT d.* FROM employee e
RIGHT JOIN department d 
ON e.department=d.d_id
WHERE e.department IS null
;

-- Cross JOIN (basically multiplication)

SELECT * FROM employee,department;

SELECT * FROM employee e,department d 
WHERE e.department=d.d_id AND e.department="D1";


SELECT * FROM department;
DESC department;


CREATE TABLE department_2(
d_id CHAR(2) PRIMARY KEY,
department_name VARCHAR(100),
city VARCHAR(150)
);

DESC department_2;

INSERT INTO department_2 VALUES
("D1","Marketing","Mumbai"),
("D2","Training","Pune");

DELETE FROM department_2 WHERE d_id="D2";
SELECT * FROM department_2;
INSERT INTO department_2 VALUE("D6","Training","Pune");

-- UNION JOIN (SHOWS ONLY DISTINCT VALUE NOT DUPLICATES)
-- Number of columns should match

SELECT d_id,department FROM department
UNION 
SELECT d_id,department_name FROM department_2;

-- UNION ALL (will also show repeated values)
SELECT d_id,department FROM department
UNION ALL
SELECT d_id,department_name FROM department_2;
 

-- --------------6th august-----------------
-- ALL --
SELECT * FROM employee;
SELECT salary FROM employee WHERE ename="ANKITA" or ename="NILESH";
SELECT * FROM employee WHERE salary>ALL
(SELECT salary FROM employee WHERE ename="Ankita" or ename="nilesh");

SELECT * FROM employee WHERE salary<=ALL
(SELECT salary FROM employee WHERE ename="Ankita" or ename="nilesh");

-- ----ANY------
-- IN LESS THAN ANY GREATER VALUES ARE TAKEN
SELECT * FROM employee WHERE salary<ANY
(SELECT salary FROM employee WHERE ename="Ankita" or ename="nilesh");

SELECT * FROM employee WHERE salary>ANY
(SELECT salary FROM employee WHERE ename="Ankita" or ename="nilesh");

-- 3RD HIGHEST SALARY
(SELECT salary FROM employee WHERE salary < (SELECT max(salary) FROM employee) ORDER BY SALARY DESC LIMIT 1) ORDER BY SALARY DESC;

SELECT * FROM employee LIMIT 1,2;

SELECT * FROM employee;
(SELECT * FROM employee WHERE age<(SELECT max(age) FROM employee) ORDER BY age DESC LIMIT 1);
DESC department;
SELECT * FROM department WHERE d_id= (SELECT department FROM employee WHERE age=
(SELECT department FROM employee WHERE age<(SELECT max(age) FROM employee)ORDER BY AGE DESC LIMIT 1));


-- ----7 AUGUST-------------------
-- VIEW IS A VIRTUAL TABLE
USE shriya;
CREATE VIEW department_sal AS
SELECT department,sum(salary) FROM employee GROUP BY department;

SELECT * FROM department_sal;
SELECT * FROM employee;

CREATE VIEW emp AS
SELECT e_id,ename,city,department,age,email FROM employee;

 SELECT * FROM emp;
 
-- SIMPLE VIEW : QUERIES ONE TABLE
-- COMPLEX VIEW : QUERIES MORE THAN ONE TABLE

DROP VIEW department_sal;


-- 9 AUGUST--------------------

-- 09 08 2024
  -- stored procedure
  -- in out 
  -- whay DELIMITER IS USE
  -- TO CHANGE END
  use shriya;
  Delimiter $$
  select * from employee$$
  select * from department$$
  /*
  DELIMITER $$
CREATE PROCEDURE procedure_name()
  
  BEGIN
  

  
  END$$
  DELIMITER;
  */

DELIMITER $$
CREATE procedure getEmployee()
BEGIN

select * from employee;

END$$
DELIMITER ;

Call getEmployee();

DELIMITER $$
CREATE procedure getdepartment()
BEGIN

SELECT * FROM department;

END$$
DELIMITER ;
call getdepartment;      



DELIMITER $$
CREATE procedure get_by_city(IN city VARCHAR(100))
begin

SELECT COUNT(*) FROM EMPLOYEE WHERE EMPLOYEE.CITY=CITY;


END$$
DELIMITER ;
CALL GET_BY_CITY("PUNE");
-- drop procedure procedure_name;

DELIMITER $$
create procedure get_by_department (in dep_count int(10) )
begin 


 select count(*) from employee  where department=dep_count;
 
 end$$
 delimiter ;
 
 call get_by_department(1) ;
 
 DELIMITER $$
 CREATE PROCEDURE UPDATE_PHONENO(IN EM_ID INt(20), IN  phoneno bigint)
 
bEGIN
UPDATE employee set employee.phoneno=phoneno where employee.e_id=e_id;

END$$
delimiter ;
CALL UPDATE_PHONENO(1,90225525);
DROP procedure UPDATE_PHONENO;
SELECT * from EMPLOYEE;

-- ----------- 12 AUGUST -----------------------
USE shriya;
SELECT * FROM employee;
SET @age= 25;
SELECT * FROM employee WHERE age<@age;

DELIMITER $$
CREATE PROCEDURE getYear(IN e_id CHAR(4),OUT reg_year INT)
BEGIN 
SELECT YEAR(joining_date) INTO reg_year FROM employee WHERE employee.e_id= e_id;
END $$
DELIMITER ;


DROP PROCEDURE getYear;

DELIMITER $$
CREATE PROCEDURE getYear(IN e_id INT ,OUT reg_year INT)
BEGIN 
SELECT YEAR(joining_date) INTO reg_year FROM employee WHERE employee.e_id= e_id;
END $$
DELIMITER ;
CALL getYear(1115,@reg_year);
SELECT @reg_year;

SELECT * FROM employee;
-- ONLY VALID FOR MONTH,YEAR AND DATE
SELECT MONTH(joining_date) INTO reg_month FROM employee WHERE employee.e_id = e.id;
-- ---------------
DROP PROCEDURE get_month;
DELIMITER $$
CREATE PROCEDURE get_month(IN e_id INT, OUT reg_month INT)
BEGIN
SELECT MONTH(joining_date) INTO reg_month FROM employee WHERE employee.e_id = e_id;
END $$
DELIMITER ;
CALL get_month(1111,@reg_month);
SELECT @reg_month;
DROP PROCEDURE get_city;
DELIMITER $$ 
CREATE PROCEDURE get_city(IN e_id INT, OUT city_res CHAR(20))
BEGIN
SELECT city INTO city_res FROM employee WHERE employee.e_id= e_id;
END $$
 

DELIMITER ;
CALL get_city(1113,@city_res);
SELECT @city_res;
SELECT * FROM employee WHERE department='D2';

USE shriya;
DELIMITER $$
ALTER PROCEDURE mum_city(IN e_id INT,OUT mum_res CHAR(20))
BEGIN
-- SELECT count(city) INTO mum_res FROM employee WHERE city= "Bangalore" OR employee.e_id = e_id;
SELECT count(city) INTO mum_res FROM employee WHERE city=@mum_res OR employee.e_id =@e_id;
END $$
DELIMITER ;
DROP PROCEDURE mum_city;
CALL mum_city("Bangalore", @mum_res); -- @mum_res
SELECT @mum_res;
SELECT @e_id;
SELECT * FROM employee;

USE shriya;
SELECT * FROM employee;
SELECT * FROM department;
DELIMITER $$
alter PROCEDURE get_empl_det(IN e_id INT,OUT dep_emp VARCHAR(5),out namee varchar(10))
BEGIN 
SELECT department INTO dep_emp FROM employee WHERE employee.e_id= e_id;-- city,salary,
SELECT ename INTO namee FROM employee WHERE employee.e_id= e_id;-- city,salary,
END $$
DELIMITER ;
CALL get_empl_det(1111,@dep_emp,@namee);
SELECT @dep_emp,@namee


-- getcount("Mumbai",@countemp)
-- getempdetail("d2")
-- getemployee("a")
-- getemployeecount("a",@countemp)
-- ans
SELECT count(*) INTO countemp FROM employee WHERE ename LIKE CONCAT(ch,"a%");
 

SELECT * FROM city;


-- ---------14 AUGUST-------------------------
use shriya;
DELIMITER $$ 
CREATE PROCEDURE updateSalary(IN e_id INT ,INOUT salary INT)
BEGIN
DECLARE old_salary INT;
SELECT employee.salary INTO old_salary FROM employee WHERE employee.e_id=e_id;
UPDATE employee SET employee.salary=salary WHERE employee.e_id=e_id;
SET salary= old_salary;

END $$
DELIMITER ;
SET @salary= 85000;
CALL updateSalary(1111,@salary);
SELECT @salary;
SELECT * FROM employee;

-- SYNTAX FOR FUNCTION PROCEDURES

/* DELIMITER $$
CREATE FUNCTION fun_name(p1,p2,....,pn)
RETURNS datatype
BEGIN
// LOGIC

RETURN value;
END $$
DELIMITER ;
*/
DELIMITER $$
CREATE FUNCTION addition(a INT,b INT)
RETURNS INT
BEGIN
    RETURN a+b;
END $$
DELIMITER ;
SELECT addition(150,100);
-- SUBSTRACTION
DELIMITER $$
CREATE FUNCTION substraction(a INT, b INT)
RETURNS int
BEGIN
  RETURN a-b;
END $$
DELIMITER ;
SELECT substraction(-200,100);

-- TO MAKE THE FIRST LETTER CAPTITAL
DELIMITER $$
CREATE FUNCTION formatName(word VARCHAR(100))
RETURNS VARCHAR(100)
BEGIN
  RETURN CONCAT(upper(substr(word,1,1)),lower(substr(word,2)));
END $$
DELIMITER ;
SELECT formatName("NISHA");
SELECT formatName(ename),formatName(city),addition(salary,10000) FROM employee;

-- BY CASE
DELIMITER $$
CREATE FUNCTION grade(marks INT)
RETURNS CHAR(20)
BEGIN
     DECLARE grade CHAR(20);
     SET grade=CASE
			   WHEN marks BETWEEN 0 AND 40 THEN "C"
               WHEN marks BETWEEN 41 AND 74 THEN "B"
               WHEN marks BETWEEN 75 AND 100 THEN "A"
               ELSE 
               "Invalid Marks"
               END;
       RETURN grade;
      END $$
      DELIMITER ;
      
      select grade(70);
      
      
-- --------------16 AUGUST-------------------
/*
Syntax:
IF condition THEN
  statements
END IF;

IF condition THEN
  statement1
ELSE
  statement2
END IF; 
*/

-- IF ELSE STATEMENTS
USE shriya;
DELIMITER $$
CREATE FUNCTION checkNumber(n INT)
RETURNS VARCHAR(4)
BEGIN
IF (n%2=0) THEN
    RETURN "Even";
  ELSE 
	RETURN "Odd";
   END IF; 

END $$
DELIMITER ;  
SELECT checkNumber(60);

DELIMITER $$
CREATE FUNCTION checkAge(n INT)
    RETURNS BOOL
 BEGIN
   IF (n>=18) THEN
      RETURN TRUE;
   ELSE 
      RETURN FALSE;
 END IF;
 END $$
DELIMITER ;
SELECT checkAge(18);
DROP FUNCTION checkAge;

/* ELSE IF STATEMENTS
IF condition THEN
  statement 1
ELSEIF condition THEN
  statement 2
ELSEIF condition THEN
  statement 3
  ELSE statement n
END IF;  
*/
DELIMITER $$
CREATE FUNCTION selectLanguage(choice INT)
RETURNS VARCHAR(8)
BEGIN
   IF (choice=1) THEN
     RETURN "English";
   ELSEIF (choice=2) THEN
     RETURN "Marathi";  
      ELSEIF (choice=3) THEN
     RETURN "Hindi";
     ELSE 
     RETURN "Invalid input";
     END IF;
END$$
DELIMITER ;
SELECT selectLanguage(2);

DELIMITER $$
CREATE FUNCTION selectDay(choice INT)
RETURNS VARCHAR(10)
BEGIN
   IF (choice=1) THEN
     RETURN "Monday";
   ELSEIF (choice=2) THEN
     RETURN "Tuesday";  
      ELSEIF (choice=3) THEN
     RETURN "Wednesday";
     ELSE 
     RETURN "not applicable";
     END IF;
END$$
DELIMITER ;
SELECT selectDay(2);

-- ----- CURSOR-----------------------
-- ----21 AUGUST----------------------
-- 1) Declare Cursor
--   DECLARE cursor_name CURSOR FOR select query
--   DECLARE s CURSOR FOR SELECT id FROM students;
-- 2) OPEN Cursor
--   OPEN cursor_name;
--   OPEN s;
-- 3) Fetch Cursor
--  FETCH cursor_name INTO variable_list;
--  FETCH s INTO student_id;
-- 4) CLOSE Cursor
--   CLOSE cursor_name;
--   CLOSE s;

use shriya;
DESC employee;
SELECT e_id,ename FROM employee;

DELIMITER $$
CREATE PROCEDURE cursor_eg()
BEGIN
   DECLARE em_id INT;
   DECLARE em_name VARCHAR(100);
   DECLARE n INT;
   
   DECLARE employee_cursor CURSOR FOR 
   SELECT e_id,ename FROM employee;
   
   DECLARE CONTINUE HANDLER FOR 1329
   BEGIN
     SET n=1;
   END;
   OPEN employee_cursor;
   
   cursorLoop:LOOP
   IF n=1 THEN 
     LEAVE cursorLoop;
     END IF;
   FETCH employee_cursor INTO em_id,em_name;
   SELECT em_id,em_name;
   END LOOP cursorLoop;
   SELECT "CODE after loop";
   
   SELECT "HELLO";
   
   SELECT em_id,em_name;
   
   CLOSE employee_cursor;
END $$

DELIMITER ;
CALL cursor_eg;
DROP PROCEDURE cursor_eg;



   

