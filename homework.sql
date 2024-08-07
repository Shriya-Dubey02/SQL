-- Table 1
CREATE DATABASE orders;
USE orders;
CREATE TABLE items(
Item_no INT,
Item_name VARCHAR(50),
cost FLOAT
);
DESC items;


INSERT INTO items VALUES (01,"pen",10);
SELECT * FROM items;

CREATE TABLE amazon(
orders INT,
order_id VARCHAR(10),
item_name CHAR(20)
);
DESC amazon;

INSERT INTO amazon VALUES 
(01,"a1","basketball"),
(02,"a2","baseball"),
(03,"a3","Mouse");

SELECT * FROM amazon;

CREATE TABLE courses(
course_name CHAR(20),
course_id VARCHAR(10),
trainer_name CHAR
);
DESC courses;

INSERT INTO courses (course_name,course_id)
VALUES
("FSD_JAVA",201),
("Python",401),
("Data Scientist", 202);

SELECT * FROM courses;

ALTER TABLE courses ADD COLUMN fees INT;
DESC courses;

ALTER TABLE courses MODIFY course_id INT;
ALTER TABLE courses MODIFY course_name VARCHAR(20);

DESC courses;

CREATE TABLE flipkart(
order_name CHAR,
order_id INT,
cost INT
);
DESC flipkart;
ALTER TABLE flipkart MODIFY order_name VARCHAR(50);

INSERT INTO flipkart VALUES
 ("iron",01,500),
 ("Mobile",02,20000),
 ("lipbam",03,100);
 SELECT * FROM flipkart;
 
 
 
 
 






