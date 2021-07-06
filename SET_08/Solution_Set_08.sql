use practice 

-- let's create the tables
create table movie (
id int primary key,
title varchar(100) default null,
yr int(4) default null, 
director varchar(100) default null,
budget int default null,
gross int default null, 
key director (director),
key movietitle (title))ENGINE=MyISAM DEFAULT CHARSET=utf8;

alter table movie
modify director int default null


create table actor (
id int primary key,
name varchar(100) default null,
key actorname (name) )ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE casting (
  movieid INTEGER NOT NULL DEFAULT '0',
  actorid INTEGER NOT NULL DEFAULT '0',
  Ord INTEGER NOT NULL DEFAULT '0',
  PRIMARY KEY (movieid,actorid,Ord),
  KEY castact (actorid)
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

DESC casting
DESC actor
Desc movie

INSERT INTO movie VALUES
(10001,'$',1971,3,NULL,NULL),
(10002,'\"Crocodile\" Dundee',1986,19,NULL,328203506),
(10003,'\"Crocodile\" Dundee II',1988,36,15800000,239606210),
(10004,'\'Til There Was You',1997,49,10000000,NULL),
(10005,'\'Til We Meet Again',1940,65,NULL,NULL),
(10006,'Ã…dalen 31',1969,77,NULL,NULL),
(10007,'Ã†on Flux',2005,82,62000000,52304001),
(10008,'(500) Days of Summer',2009,95,7500000,60722734),
(10009,'(Untitled)',2009,107,NULL,NULL),
(10010,'*batteries not included ',1987,115,25000000,65088797);



INSERT INTO movie VALUES (10011,'10,000 BC',2008,121,105000000,NULL),(10012,'101 Dalmatians',1996,139,NULL,320689294),(10013,'101 Dalmatians II: Patch\'s London Adventure',2003,148,NULL,NULL),(10014,'101 ReykjavÃ­k',2000,163,NULL,126404),(10015,'102 Dalmatians',2000,169,85000000,183611771),(10016,'10',1979,177,74856000,NULL),(10017,'10 Rillington Place',1971,184,NULL,NULL),(10018,'10 Things I Hate About You',1999,204,16000000,53478166),(10019,'10 to Midnight',1983,219,NULL,NULL),(10020,'11:14',2003,228,6000000,NULL),(10021,'127 Hours',2011,242,18000000,60738797),(10022,'12',2007,250,2500000,4000000),(10023,'12 Angry Men',1957,261,350000,NULL),(10024,'12 Monkeys',1995,273,29500000,168839459),(10025,'12 Rounds',2009,289,20000000,18184083),(10026,'12th & Delaware',2010,296,NULL,NULL),(10027,'13 Ghosts',1960,297,NULL,NULL),(10028,'13 Going on 30',2004,305,37000000,96455697),(10029,'13 Moons',2002,323,NULL,NULL),(10030,'13 Rue Madeleine',1947,330,NULL,NULL);

INSERT INTO actor VALUES (30509,'Tori Amos'),(2,''),(35329,'Barbara Leake'),(12445,'Don Pike'),(41202,'Jill Remez'),(29400,'Elsa Peterson'),(14241,'Mary-Kate and Ashley Olsen'),(2131,'Eve Brent'),(690,'Christopher Eccleston'),(27966,'Sir Ian McKellen'),(20773,'Tony Genaro'),(43733,'Christopher Witty'),(35232,'Roland Gift'),(20205,'Phil Davis'),(25790,'Alexandra Monvoisin'),(24003,'Suzanne Barnes'),(25730,'Dominique Blanc'),(13640,'Laraine Humphrys'),(45069,'The Guard Brothers'),(15185,'Philip Quast'),(41214,'Myrtle Anderson'),(35763,'Phillip Jarrett'),(2838,'Whit Hertford'),(18714,'Robert Conway'),(2487,'Salli Richardson'),(44061,'Lev Atamanov'),(29767,'Ashley Williams'),(7743,'Patrick Aherne'),(116,'Hume Cronyn'),(38875,'Kevin McKenzie'),(33430,'Klaus Voormann'),(29933,'Joel Gordon'),(8352,'Hugh Quarshie'),(31272,'Denzel Whitaker'),(41840,'Ben Hollingsworth'),(40090,'Jonathan Estrin'),(22067,'Harold Waite'),(18406,'Richard Panebianco'),(35292,'Yoshiaki Hanayagi'),(22659,'Alan North'),(2179,'Michael Vale'),(22859,'RisÃ« Stevens'),(39507,'Bill Hayes'),(19225,'Kulbhushan Kharbanda'),(4358,'Wendie Malick'),(21949,'Katherine Bailess'),(6518,'Jay Johnston'),(17700,'Michael Cimino'),(11672,'Tyrone Power, Sr.'),(334,'Frank Latimore'),(15309,'Taylor Mead'),(21166,'Sadako Ka'),(1810,'William E. Shay'),(18694,'Edward Sedwick'),(17016,'Gal Gadot'),(1145,'Robert Urquhart'),(39891,'Jacqueline Fontaine'),(4214,'Nicholas Worth'),(42016,'Heather Hogan'),(34353,'Mackenzie Firgens'),(20591,'Werner Fuetterer'),(21251,'Rutha Harris'),(1071,'Drew Barrymore'),(38659,'Graham Payn'),(25462,'Katie Wright'),(10667,'S. Epatha Merkerson'),(42693,'Outi MÃ¤enpÃ¤Ã¤'),(43683,'Pen Tennyson'),(22176,'Rainn Wilson'),(24447,'Erford Gage'),(13677,'Barbara Rosenblat'),(31789,'Kazimierz Kaczor'),(42087,'Fred Lincoln'),(9204,'Fess Parker'),(43101,'Brian Wenzel'),(35569,'Erica Prior<br />Denis Rafter<br />Craig Stevenson'),(28011,'Tab Murphy'),(29849,'Allan Sears'),(6917,'Donnie Wahlberg'),(36870,'Stanley Smith'),(26432,'Jeannot Szwarc'),(4233,'Polly Moran'),(41108,'Dorothy Dwan'),(13378,'Giuliana Calandra'),(24722,'Frank Kauer'),(32290,'Torstein Rustdal'),(45543,'Poldi Dur'),(20022,'Jody Gilbert'),(27285,'Toni Braxton'),(20312,'Brian Weske'),(19798,'Jeffrey Buckner Ford'),(47131,'Simon Cadell'),(21349,'Cleve Moore'),(9292,'Paul Adelstein'),(12282,'Anita Colby'),(19791,'Barbara Tyson'),(36399,'Phil Arnold'),(18456,'Toshifumi Muramatsu'),(20602,'Heinz Reincke'),(39683,'Nicholas Blandullo'),(1419,'Chris Weitz'),(38837,'Michael Brill'),(8328,'Donna Reed'),(47597,'Gary Bayer'),(38780,'Matthew Peckinpah'),(19853,'Tom McNulty'),(29430,'Renata Sorrah'),(22835,'Annie Legrand'),(12612,'David Green'),(26274,'Marsha Clark'),(23681,'Johnny Sanchez'),(36516,'Sandra Dorsey'),(15612,'Bridget Barkan')


select count(*) from movie
select count(*) from actor
select count(*) from casting

-- 1.List the films where the yr is 1962.
Select title from movie
where yr = 1962

-- 2.When was Citizen Kane released?
select yr from movie
where title = 'citizen kane'

-- 3.List all of the Star Trek movies, include the id, title and yr. Order results by year.
select id, title, yr
from movie
where title like '%star trek%'
order by yr 

-- 4.What id number does the actor 'Glenn Close' have?
select id from actor
where name = 'Glenn Close'

-- 5.What is the id of the film 'Casablanca'
select id from movie
where title = 'Casablanca'

-- 6.Obtain the cast list for 'Casablanca' (The cast list is the names of the actors who were in the movie.)
SELECT name
FROM casting INNER JOIN actor
ON casting.actorid=actor.id
WHERE movieid=(SELECT id 
			   FROM movie
			   WHERE title='Casablanca');
               
-- 7.Obtain the cast list for the film 'Alien'
select name 
from casting inner join actor
on casting.actorid = actor.id
where movieid = (select id from movie where title = 'alien')

-- 8.List the films in which 'Harrison Ford' has appeared.
select title from movie 
inner join actor on movie.id = actor.id
where name = 'Harrison Forn'

-- 9.List the films where 'Harrison Ford' has appeared - but not in the starring role. 
-- [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
SELECT title
FROM movie m,casting c,actor a
WHERE m.id=c.movieid 
     AND c.actorid=a.id
     AND a.name='Harrison Ford'
     AND c.ord!=1;

-- 10.List the films together with the leading star for all 1962 films.
select title, name  from movie m, casting c, actor a
where m.id = c.movieid
And c.movieid = a.id
And m.yr = 1962
And c.ord != 1;

-- 11.Which were the busiest years for 'Rock Hudson', 
-- show the year and the number of movies he made each year for any year in which he made more than 2 movies. 
SELECT yr,COUNT(title) AS "Number of Movies" 
FROM movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

-- 12.List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT title,name
FROM movie m,casting c,actor a
WHERE m.id=c.movieid 
     AND c.actorid=a.id
     AND m.Id IN (SELECT movieid FROM casting
                  WHERE actorid IN (SELECT id FROM actor
                                    WHERE name='Julie Andrews'))
     AND c.ord=1;

-- 13.Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT a.name
FROM casting c,actor a
WHERE c.actorid=a.id
      AND c.ord=1
GROUP BY a.name
HAVING COUNT(*)>=15
ORDER BY a.name;

-- 14.List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title,COUNT(actorid) AS "Number of Actors"
FROM movie m,casting c
WHERE m.id=c.movieid
      AND m.yr=1978

GROUP BY title
ORDER BY COUNT(actorid) DESC,title;

-- 15.List all the people who have worked with 'Art Garfunkel'.
SELECT name
FROM movie m,casting c,actor a
WHERE m.id=c.movieid 
     AND c.actorid=a.id
     AND m.id IN (SELECT movieid
                  FROM casting
                  WHERE actorid=(SELECT id
                                 FROM actor
                                 WHERE name='Art Garfunkel'))
     AND name!='Art Garfunkel';
