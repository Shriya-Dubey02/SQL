CREATE DATABASE movie;
use movie;


CREATE TABLE actor(
act_id INTEGER PRIMARY KEY,
act_fname char(20),
act_lname char(20),
act_gender char(1)
);

CREATE TABLE genres(
gen_id INTEGER PRIMARY KEY,
gen_title char(20)
);

CREATE TABLE director(
dir_id INTEGER PRIMARY KEY,
dir_fname char(20),
dir_lname char(20)
);

CREATE TABLE movie(
mov_id INTEGER PRIMARY KEY,
mov_title char(50),
mov_year INTEGER,
mov_time INTEGER,
mov_lang CHAR(50),
mov_dt_rel DATE,
mov_rel_country char(5)
);

CREATE TABLE movie_genres(
mov_id INTEGER,
gen_id INTEGER,
CONSTRAINT mg_movie FOREIGN KEY (mov_id)
REFERENCES movie(mov_id),
CONSTRAINT gen_movie FOREIGN KEY(gen_id)
REFERENCES genres(gen_id)
);

CREATE TABLE movie_direction(
dir_id INTEGER,
mov_id INTEGER,
CONSTRAINT md_director FOREIGN KEY (dir_id)
REFERENCES director(dir_id),
CONSTRAINT md_movie FOREIGN KEY(mov_id)
REFERENCES movie(mov_id)
);

CREATE TABLE reviewer(
rev_id INTEGER PRIMARY KEY,
rev_name char(30)
);

CREATE TABLE rating(
mov_id INTEGER,
rev_id INTEGER,
rev_stars INTEGER,
num_o_rating INTEGER,
CONSTRAINT r_movie FOREIGN KEY(mov_id)
REFERENCES movie(mov_id),
CONSTRAINT rev_rat FOREIGN KEY (rev_id)
REFERENCES reviewer(rev_id)

);

CREATE TABLE movie_cast(
act_id INTEGER,
mov_id INTEGER,
role CHAR(30),
CONSTRAINT mc_actor FOREIGN KEY(act_id)
references actor(act_id),
CONSTRAINT mc_movie FOREIGN KEY(mov_id)
REFERENCES movie(mov_id)
);

INSERT INTO movie VALUES
(901,"Vertigo",1958,128,"English",'1958-01-02',"UK");

INSERT INTO movie VALUES
(902,"The Innocents",1961,100,"English",'1962-02-19',"SW"),
(903,"Lawrence of Arabia",1962,216,"English",'1962-12-11',"UK"),
(904,"The Deer Hunter",1978,183,"English",'1979-03-08',"UK"),
(905,"Eyes wide shut",1999,201,"English",'1999-02-02',"UK");

INSERT INTO reviewer VALUES
(9001,"Rigthy Sock"),
(9002,"Jack Malvern"),
(9003,"Flagrant Barocena"),
(9004,"Alec Shawn"),
(9005,"Simon Wright"),
(9006,"Paul Mocks");

INSERT INTO rating VALUES
(901,9001,8.40,263575),
(902,9002,7.90,20207),
(903,9003,8.30,202778),
(904,9004,8.20,20678),
(905,9005,9.10,45678);

INSERT INTO actor VALUES
(101,"James","Starwet","M"),
(102,"Debborah","Kerr","M"),
(103,"Peter","Otoole","M"),
(104,"Nicole","Madman","F"),
(105,"Harrison","Ford","F"),
(106,"Stephen","Baldwin","M");

INSERT INTO movie_cast VALUES
(101,901,"John Scottie Frogon"),
(102,902,"Miss Giddens"),
(103,903,"T.E Lawrence"),
(104,904,"Michael");

INSERT INTO director VALUES
(201,"Alfred","lean"),
(202,"Jack","Forman"),
(203,"David","Scott");

DESC movie_direction;
SELECT * FROM movie_direction;
INSERT INTO movie_direction VALUES
(201,901),
(202,902),
(203,903);




UPDATE rating SET rev_stars=null WHERE mov_id=904;
SELECT * FROM rating;
USE movie;
SELECT * FROM movie;
SELECT mov_title,mov_year FROM movie;

SELECT mov_year FROM movie WHERE mov_title="The Deer Hunter";

SELECT mov_title FROM movie WHERE mov_year=1999;

SELECT mov_title FROM movie WHERE mov_year<1998;

SELECT reviewer.rev_name 
FROM reviewer
UNION
SELECT movie.mov_title
FROM movie;

SELECT r.rev_name FROM reviewer r,rating a
WHERE
r.rev_id=a.rev_id
AND a.rev_stars>=9;

SELECT m.mov_title FROM movie m,rating r
WHERE m.mov_id=r.mov_id
AND rev_stars is null;

SELECT mov_title FROM movie WHERE mov_id IN (901,902,903);

SELECT mov_id,mov_title,mov_year FROM movie WHERE mov_title LIKE 'The%'  
ORDER BY mov_year ASC;

SELECT * FROM actor;

SELECT act_id FROM actor WHERE act_fname='Peter'
AND act_lname= 'Otoole';

-- SubQueries
USE movie;
SELECT * FROM movie_cast;
SELECT * FROM movie;

SELECT * 
FROM actor 
WHERE act_id IN(
  -- Selecting 'act_id' from 'movie_cast' where 'mov_id' is in the subquery result
  SELECT act_id 
  FROM movie_cast 
  WHERE mov_id IN (
    -- Selecting 'mov_id' from 'movie' where 'mov_title' is 'Annie Hall'
    SELECT mov_id 
    FROM movie 
    WHERE mov_title='The Deer Hunter'
  )
);

-- Alternative solution
SELECT a.*
FROM actor a, movie_cast mc, movie m
WHERE a.act_id = mc.act_id
AND mc.mov_id = m.mov_id
AND m.mov_title = 'The Deer Hunter';

USE movie;

SELECT * from movie WHERE mov_rel_country NOT IN ('UK');

SELECT * FROM director;
SELECT mov_title FROM movie WHERE mov_id =
(SELECT mov_id FROM movie_direction WHERE dir_id =
(SELECT dir_id FROM director WHERE dir_fname="Jack" AND dir_lname="Forman"));

SELECT mov_title, MAX(rev_stars)
FROM movie, rating 
WHERE movie.mov_id = rating.mov_id 
  AND rating.rev_stars IS NOT NULL
-- Grouping the result set by mov_title
GROUP BY mov_title
-- Sorting the result set by mov_title
ORDER BY mov_title;

-- JOINS

SELECT * FROM movie;
SELECT a.act_fname,a.act_lname,mc.role FROM actor a
JOIN movie_cast mc ON a.act_id=mc.act_id
JOIN movie m ON mc.mov_id=m.mov_id AND m.mov_title="Vertigo";

SELECT DISTINCT mov_year
FROM movie
INNER JOIN rating 
ON movie.mov_id = rating.mov_id
WHERE rev_stars IN (3, 4)
ORDER BY mov_year;


SELECT * FROM movie_cast;
SELECT * FROM actor;
SELECT * FROM movie;
SELECT * FROM movie_direction;

SELECT count(mov_year) AS Count_movie FROM movie WHERE mov_year=1999;
SELECT * FROM movie WHERE mov_title LIKE "V%";

-- SELECT * from actor WHERE act_id = (SELECT mov_title FROM movie WHERE mov_id=901);
SELECT * FROM movie WHERE mov_id IN (SELECT * FROM movie_cast WHERE act_id IN (SELECT * FROM actor WHERE act_fname="James")); 

SELECT * 
FROM movie 
WHERE mov_id IN(
  SELECT act_id 
  FROM movie_cast 
  WHERE mov_id IN (

    SELECT act_id 
    FROM actor
    WHERE act_fname='James'
  )
);



SELECT m.mov_id,m.mov_title FROM movie m
JOIN movie_cast mc ON m.mov_id=mc.mov_id
JOIN actor a ON mc.act_id=a.act_id AND act_fname="James";

DELIMITER $$
CREATE PROCEDURE SetMovieName(IN act_id INT, OUT actName VARCHAR(10))
BEGIN
SELECT m.mov_id,m.mov_title FROM movie m
JOIN movie_cast mc ON m.mov_id=mc.mov_id
JOIN actor a ON mc.act_id=a.act_id AND act_fname= actName;

END $$
DELIMITER ;

CALL SetMovieName(901,@actName);
SELECT @actName;
DROP PROCEDURE SetMovieName;


SELECT * FROM movie;
SELECT * FROM movie HAVING MAX(mov_time);



