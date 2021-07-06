use practice 

create table game (
id varchar(10) primary key,
mdate varchar(10) default null ,
stadium varchar(20) default null,
team1 varchar(50) default null,
team2 varchar(50) default null);

alter table game
modify column mdate varchar(30);

alter table game 
modify stadium varchar(100) default null;

create table eteam(
id varchar(10) primary key, 
teamname varchar(30) default null,
coach varchar(20) default null);

create table goal ( 
matchid varchar(20) ,
teamid varchar(20) default null,
player varchar(100) default null,
gtime int(20) ,
primary key (matchid, gtime));

alter table goal
modify player varchar(100) default null;

-- Let's insert the data in the tables
insert into game values
(1001,'8 June 2012','National Stadium, Warsaw','POL','GRE'),
(1002,'8 June 2012','Stadion Miejski (Wroclaw)','RUS','CZE'),
(1003,'12 June 2012','Stadion Miejski (Wroclaw)','GRE','CZE'),
(1004,'12 June 2012','National Stadium, Warsaw','POL','RUS'),
(1005,'16 June 2012','Stadion Miejski (Wroclaw)','CZE','POL'),
(1006,'16 June 2012','National Stadium, Warsaw','GRE','RUS'),
(1007,'9 June 2012','Metalist Stadium','NED','DEN'),
(1008,'9 June 2012','Arena Lviv','GER','POR'),
(1009,'13 June 2012','Arena Lviv','DEN','POR'),
(1010,'13 June 2012','Metalist Stadium','NED','GER'),
(1011,'17 June 2012','Metalist Stadium','POR','NED'),
(1012,'17 June 2012','Arena Lviv','DEN','GER'),
(1013,'10 June 2012','PGE Arena Gdansk','ESP','ITA'),
(1014,'10 June 2012','Stadion Miejski (Poznan)','IRL','CRO'),
(1015,'14 June 2012','Stadion Miejski (Poznan)','ITA','CRO'),
(1016,'14 June 2012','PGE Arena Gdansk','ESP','IRL'),
(1017,'18 June 2012','PGE Arena Gdansk','CRO','ESP'),
(1018,'18 June 2012','Stadion Miejski (Poznan)','ITA','IRL'),
(1019,'11 June 2012','Donbass Arena','FRA','ENG'),
(1020,'11 June 2012','Olimpiyskiy National Sports Complex','UKR','SWE'),
(1021,'15 June 2012','Donbass Arena','UKR','FRA'),
(1022,'15 June 2012','Olimpiyskiy National Sports Complex','SWE','ENG'),
(1023,'19 June 2012','Donbass Arena','ENG','UKR'),
(1024,'19 June 2012','Olimpiyskiy National Sports Complex','SWE','FRA'),
(1025,'21 June 2012','National Stadium, Warsaw','CZE','POR'),
(1026,'22 June 2012','PGE Arena Gdansk','GER','GRE'),
(1027,'23 June 2012','Donbass Arena','ESP','FRA'),
(1028,'24 June 2012','Olimpiyskiy National Sports Complex','ENG','ITA'),
(1029,'27 June 2012','Donbass Arena','POR','ESP'),
(1030,'28 June 2012','National Stadium, Warsaw','GER','ITA'),
(1031,'1 July 2012','Olimpiyskiy National Sports Complex','ESP','ITA ');


insert into eteam values
('POL','Poland','Franciszek Smuda'),
('RUS','Russia','Dick Advocaat'),
('CZE','Czech Republic','Michal Bílek'),
('GRE','Greece','Fernando Santos'),
('NED','Netherlands','Bert van Marwijk'),
('DEN','Denmark','Morten Olsen'),
('GER','Germany','Joachim Löw'),
('POR','Portugal','Paulo Bento'),
('ESP','Spain','Vicente del Bosque'),
('ITA','Italy','Cesare Prandelli'),
('IRL','Republic of Ireland','Giovanni Trapattoni'),
('CRO','Croatia','Slaven Bilic'),
('UKR','Ukraine','Oleh Blokhin'),
('SWE','Sweden','Erik Hamrén'),
('ENG','England','Roy Hodgson'),
('FRA','France','Laurent Blanc');

insert into goal values 
(1001,'POL','Robert Lewandowski',17),
(1001,'GRE','Dimitris Salpingidis',51),
(1002,'RUS','Alan Dzagoev',15),
(1002,'RUS','Alan Dzagoev',79),
(1002,'RUS','Roman Shirokov',24),
(1002,'RUS','Roman Pavlyuchenko',82),
(1002,'CZE','Václav Pilar',52),
(1003,'GRE','Theofanis Gekas',53),
(1003,'CZE','Petr Jirácek',3),
(1003,'CZE','Václav Pilar',6),
(1004,'POL','Jakub Blaszczykowski',57),
(1004,'RUS','Alan Dzagoev',37),
(1005,'CZE','Petr Jirácek',72),
(1006,'GRE','Giorgos Karagounis',45),
(1007,'DEN','Michael Krohn-Dehli',24),
(1008,'GER','Mario Gómez',72),
(1009,'DEN','Nicklas Bendtner',41),
(1009,'DEN','Nicklas Bendtner',80),
(1009,'POR','Pepe (footballer born 1983)',24),
(1009,'POR','Hélder Postiga',36),
(1009,'POR','Silvestre Varela',87),
(1010,'NED','Robin van Persie',73),
(1010,'GER','Mario Gómez',24),
(1010,'GER','Mario Gómez',38),
(1011,'POR','Cristiano Ronaldo',28),
(1011,'POR','Cristiano Ronaldo',74),
(1011,'NED','Rafael van der Vaart',11),
(1012,'DEN','Michael Krohn-Dehli',24),
(1012,'GER','Lukas Podolski',19),
(1012,'GER','Lars Bender',80),
(1013,'ESP','Cesc Fàbregas',64),
(1013,'ITA','Antonio Di Natale',61),
(1014,'IRL','Sean St Ledger',19),
(1014,'CRO','Mario Mandžukic',3),
(1014,'CRO','Mario Mandžukic',49),
(1014,'CRO','Nikica Jelavic',43),
(1015,'ITA','Andrea Pirlo',39),
(1015,'CRO','Mario Mandžukic',72),
(1016,'ESP','Fernando Torres',4),
(1016,'ESP','Fernando Torres',70),
(1016,'ESP','David Silva',49),
(1016,'ESP','Cesc Fàbregas',83),
(1017,'ESP','Jesús Navas',88),
(1018,'ITA','Antonio Cassano',35),
(1018,'ITA','Mario Balotelli',90),
(1019,'FRA','Samir Nasri',39),
(1019,'ENG','Joleon Lescott',30),
(1020,'UKR','Andriy Shevchenko',55),
(1020,'UKR','Andriy Shevchenko',62),
(1020,'SWE','Zlatan Ibrahimovic',52),
(1021,'FRA','Jérémy Ménez',53),
(1021,'FRA','Yohan Cabaye',56),
(1022,'SWE','Glen Johnson (English footballer)',49),
(1022,'SWE','Olof Mellberg',59),
(1022,'ENG','Andy Carroll',23),
(1022,'ENG','Theo Walcott',64),
(1022,'ENG','Danny Welbeck',78),
(1023,'ENG','Wayne Rooney',48),
(1024,'SWE','Zlatan Ibrahimovic',54),
(1024,'SWE','Sebastian Larsson',90),
(1025,'POR','Cristiano Ronaldo',79),
(1026,'GER','Philipp Lahm',39),
(1026,'GER','Sami Khedira',61),
(1026,'GER','Miroslav Klose',68),
(1026,'GER','Marco Reus',74),
(1026,'GRE','Georgios Samaras',55),
(1026,'GRE','Dimitris Salpingidis',89),
(1027,'ESP','Xabi Alonso',19),
(1027,'ESP','Xabi Alonso',90),
(1030,'GER','Mesut Özil',90),
(1030,'ITA','Mario Balotelli',20),
(1030,'ITA','Mario Balotelli',36),
(1031,'ESP','David Silva',14),
(1031,'ESP','Jordi Alba',41),
(1031,'ESP','Fernando Torres',84),
(1031,'ESP','Juan Mata',88);

-- let's check the tables 

select * from game limit 5
select * from  eteam limit 5
select * from goal limit 5

select count(*) from eteam

-- 1.Show the matchid and player name for all goals scored by Germany.
select matchid, player from goal
where teamid = 'GRE'

-- 2.Lars Bender's scored a goal in game 1012. What teams were playing in that match?
SELECT Id,stadium,team1,team2
FROM game
WHERE id=1012
LIMIT 1

-- 3.Show the player, teamid, stadium and mdate for every German goal.
select goal.player, goal.teamid, game.stadium, game.mdate from goal 
join game on game.id = goal.matchid
where teamid = 'GER'

-- 4.Show the team1, team2 and player for every goal scored by a player called Mario.
select game.team1, game.team2 , goal.player from game
join goal on game.id = goal.matchid
where player like 'Mario%%'

-- 5.Show player, teamid, coach, gtime for all goals scored in the first 10 minutes.
select player, teamid, coach, gtime from goal
join eteam on goal.teamid = eteam.id 
where gtime <= 10

-- 6.List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
select mdate, teamname from game 
join eteam on game.team1 = eteam.id 
where coach  = 'Fernando Santos'

-- 7.List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw.
select player 
from game join goal on game.id = goal.matchid
where stadium = 'National Stadium, Warsaw'

-- 8.Show the name of all players who scored a goal against Germany.
select player 
from game join goal on matchid = id 
where (team1='GER' OR team2='GER') and teamid != 'GER'

-- 9. Show teamname and the total number of goals scored.
select teamname , count(gtime) from goal
JOIN eteam ON eteam.id=goal.teamid
GROUP BY teamname
ORDER BY count(gtime)

-- 10.Show the stadium and the number of goals scored in each stadium.
select stadium , count(gtime) as 'number of goals'
from game join goal on game.id = goal.matchid
group by stadium
order by stadium

-- 11.For every match involving 'POL', show the matchid, date and the number of goals scored.
select matchid, mdate, count(gtime) as 'number of goals' from goal 
join game on goal.matchid = game.id 
where (team1 = 'POL' or team2 = 'POL')
group by matchid , mdate

-- 12.For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'.
select matchid, mdate as 'matchdate', count(gtime) as 'number of goals' from goal 
join game on game.id = goal.matchid
where teamid = 'GER'
group by matchid

-- 13.List every match with the goals scored by each team as shown in queries 13:
select mdate, team1 , sum(case 
when teamid =team1 then 1 else 0
end) as score1, team2, sum(case
when teamid = team2 then 1 else 0 
end) as score2
from game join goal on game.id = goal.matchid
GROUP BY mdate,matchid,team1,team2
ORDER BY mdate,matchid,team1,team2





