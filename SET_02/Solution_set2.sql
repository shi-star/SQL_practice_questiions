use practice
create table Station ( 
ID int,
city char(40),
state char(40),
lat_N char(10),
long_W char(10));

-- 1.Query a list of CITY and STATE from the STATION table.
Select city,state from station

-- 2.Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
Select distinct city from station 
where id % 2 = 0 

-- 3.Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
select count(city) - count(distinct city) as difference from station

-- 4.Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
Select city, length(city) from station  order by 2 asc limit 2
select city, length(city) from station order by 2 desc limit 2 

-- 5.Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
select distinct city from station where city regexp '^[aeiou]'

-- 6.Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
select distinct city from station where city regexp '[aeiou]$'

-- 7.Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
select distinct city from station where city regexp '^[aeiou].*[aeiou]$';

-- 8.Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
select distinct city from station where city regexp '[^aeiou]$'

-- 9.Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
select distinct city from station where city regexp '^[^aeiou]'

-- 10.Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
select distinct city from station where city regexp '^[^aeiou]|[^aeiou]$'

-- 11.Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
select distinct(CITY) from STATION
  where CITY regexp "^[^aeiou].*[^aeiou]$";