use practice;
#1.	Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
create table CITY (
    ID INTEGER,
    NAME VARCHAR(17),
    COUNTRYCODE VARCHAR(3),
    DISTRICT VARCHAR(20),
    POPULATION INTEGER);
    
select * from city;

-- 1.Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
Select * from City
where countrycode = 'USA' && population > 100000;


-- 2.Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
Select Name from city where COUNTRYCODE = 'USA' AND POPULATION > 120000

-- 3.Query all columns for a city in CITY with the ID 1661.
Select * from city 
where ID = 1661

-- 4.Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
select * from city where COUNTRYCODE = 'JPN'

-- 5.Query the names and populations of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
Select name, population from city where countrycode = 'JPN';

-- 6.Query a count of the number of cities in CITY having a Population larger than 100,000.
select count(population>100000) from city
-- OR 
select count(distinct(ID)) as 'cities' from city where population>100000;

-- 7.Query the total population of all cities in CITY where District is California.
select sum(population) as 'total_population' from city 
where district = 'California'

-- 8.Query the average population of all cities in CITY where District is California.
select avg(population) as 'average' from city
where district = 'California'

-- 9.Query the average population for all cities in CITY, rounded down to the nearest integer.
select round(avg(population)) from city 

-- 10.Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
select sum(population) from city where countrycode = 'JPN'

-- 11.Query the difference between the maximum and minimum populations in CITY.
select max(population) - min(population) from city 










