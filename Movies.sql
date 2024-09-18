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
