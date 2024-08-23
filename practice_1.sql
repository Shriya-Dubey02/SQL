CREATE DATABASE Dannydineer;
USE Dannydinner;
drop database Dannydinner;
CREATE DATABASE dannydiner;
use dannydiner;
CREATE TABLE sales(
customer_id VARCHAR(10),
order_date DATE,
product_id INTEGER,
CONSTRAINT sales_memb FOREIGN KEY (customer_id)
REFERENCES members(customer_id),

CONSTRAINT menu_sales FOREIGN KEY (product_id)
REFERENCES menu(product_id) 
);
drop table sales;

DESC sales;
CREATE TABLE members(
customer_id VARCHAR(10) PRIMARY KEY,
Join_date TIMESTAMP
);
DESC members;
CREATE TABLE menu(
product_id INTEGER PRIMARY KEY,
product_name VARCHAR(10),
price INTEGER
);
DESC menu;
DESC sales;

INSERT INTO menu VALUES
(1,"Sushi",10),
(2,"Curry",15),
(3,"Ramen",12);
SELECT * FROM menu;
SELECT * FROM members;
INSERT INTO members VALUES
("A",2021-01-07),
("B",2021-01-09);
INSERT INTO members VALUES
("C",2021-01-10);
DELETE FROM members WHERE customer_id="A";
DELETE FROM members WHERE customer_id="B";
DELETE FROM members WHERE customer_id="C";


DELETE FROM menu WHERE product_id=1 OR product_id=2 OR product_id=3 ;
INSERT INTO members VALUES
("A","2021-01-07 10:20:22");
INSERT INTO members VALUES
("B","2021-01-09 11:20:22");
INSERT INTO members VALUES
("C","2021-01-10 12:20:22");
DESC menu;
SELECT * FROM menu;
SELECT * FROM members;

INSERT INTO menu VALUES
(1,"Sushi",10),
(2,"Curry",15),
(3,"Ramen",12);
SELECT * FROM sales;

DESC sales;
INSERT INTO sales VALUES
("A","2021-01-01",1);
INSERT INTO sales VALUES
("A","2021-01-01",2);
INSERT INTO sales VALUES
("A","2021-01-07",2),
("A","2021-01-10",3),
("A","2021-01-11",3);
INSERT INTO sales VALUES
("A","2021-01-11",3),
("B","2021-01-01",2),
("B","2021-01-02",2),
("B","2021-01-04",1);
INSERT INTO sales VALUES
("B","2021-01-11",1),
("B","2021-01-16",3),
("B","2021-02-01",3);
INSERT INTO sales VALUES
("C","2021-01-01",3),
("C","2021-01-01",3),
("C","2021-02-07",3);

-- https://8weeksqlchallenge.com/case-study-1/

-- ----- 22 AUGUST--------------------
SHOW TABLES;
desc members;
SELECT * FROM sales;
desc menu;
desc sales;
SELECT m.product_name,s.customer_id  FROM menu m
JOIN sales s
USING(product_id);
CREATE TABLE menu_sales_table(
p_name VARCHAR(100),
c_id VARCHAR(10)

);
-- 1
DELIMITER $$
CREATE PROCEDURE insert_values_with_cursor()
BEGIN 
-- 2
   DECLARE pname VARCHAR(100);
   DECLARE cname VARCHAR(20);
   DECLARE n INT; 
   -- 6
   -- 3
   DECLARE product_customer CURSOR FOR
      SELECT m.product_name,s.customer_id  FROM menu m
       JOIN sales s
	   USING(product_id);
     
     DECLARE CONTINUE HANDLER FOR 1329
     BEGIN 
       SET n=1;
      END; 
     OPEN product_customer; -- 4
     
     product_customer_loop: LOOP
       FETCH product_customer INTO pname,cname;
       IF n=1 THEN -- 7
        LEAVE product_customer_loop;
       END IF;
       INSERT INTO
       dannydiner.menu_sales_table
       VALUES(pname,cname);
       END LOOP product_customer_loop;
       
     CLOSE product_customer; -- 5
   


END $$

DELIMITER ;
DROP PROCEDURE insert_values_with_cursor;
CALL insert_values_with_cursor();
SELECT * FROM menu_sales_table;



CREATE TABLE sales_copy as SELECT * FROM sales;
DESC sales_copy;
SELECT * FROM sales_copy;

-- -----------23 AUGUST---------------
-- ----------TRIGGER-----------------

-- INSERT     NEW
-- UPDATE     OLD     NEW
-- DELETE     OLD

-- Syntax for trigger
-- CREATE TRIGGER trigger_name
-- (BEFORE|AFTER) (INSERT | UPDATE | DELETE)
-- ON table_name FOR EACH ROW 
/*BEGIN

END*/

use dannydiner;
CREATE TABLE employee(
name VARCHAR(100),
working_hours INT,
pay_per_hour INT,
salary INT
);

DELIMITER $$
CREATE TRIGGER before_insert_employee
BEFORE INSERT
ON employee FOR EACH ROW
BEGIN
  SET NEW.salary= NEW.working_hours*NEW.pay_per_hour;
END $$
DELIMITER ;
SELECT * FROM employee;
INSERT INTO employee (name,working_hours,pay_per_hour)
VALUES
("Manish",10,800);

DELIMITER $$
CREATE TRIGGER before_update_employee
BEFORE UPDATE
ON employee FOR EACH ROW
BEGIN
  SET NEW.salary= NEW.working_hours * NEW.pay_per_hour;
END $$
DELIMITER ;
INSERT INTO employee (name,working_hours,pay_per_hour)
VALUES
("Nisha",8,1000);
UPDATE employee SET working_hours=15 WHERE name= "Manish";
SELECT * FROM employee;
DELETE FROM employee WHERE name= "Manish";

ALTER TABLE employee ADD COLUMN previous_pay INT;

DELIMITER $$
CREATE TRIGGER before_update_employee_pay_per_hour
BEFORE UPDATE 
ON employee FOR EACH ROW
BEGIN 
 SET NEW.previous_pay= OLD.pay_per_hour;
END $$
DELIMITER ;
UPDATE employee SET pay_per_hour= 700 WHERE name= "Manish";
SELECT * FROM employee;
UPDATE employee SET pay_per_hour= 800 WHERE name= "Nisha";

ALTER TABLE employee ADD COLUMN d_id VARCHAR(5);
CREATE TABLE department(
d_id VARCHAR(5),
d_name VARCHAR(10)
);
DESC department;
INSERT INTO department VALUES ("D1","IT"),("D2","Marketing");
SELECT * FROM department;
UPDATE employee SET d_id="D2" WHERE name="Nisha";
SELECT * FROM employee;


DELIMITER $$
CREATE TRIGGER delete_department
BEFORE DELETE
ON department FOR EACH ROW
BEGIN
   UPDATE employee SET d_id= NULL WHERE d_id =OLD.d_id;  -- d_id is employee ka d_id column
END $$
DELIMITER ;
DELETE FROM department where d_id="D2";
