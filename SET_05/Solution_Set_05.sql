use practice

-- 1.Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
select sum(city.POPULATION) from city inner join country 
on city.countrycode = country.code
where continent = 'Asia'

-- 2.Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
select city.name from city 
inner join country on city.countrycode = country.code
where continent = 'Africa'

-- 3.Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
select country.continent , round(avg(city.population)) from country
inner join city on country.code = city.countrycode
group by 1

-- 4.Query the NAME, POPULATION and GNP of the country where GNP is maximum.
select name, population, gnp from country
where GNP=(select max(GNP) from COUNTRY)

-- 5.Query the NAME, POPULATION and GNP of the country where GNP is minimum.
select name, population , gnp from country
where GNP = (select min(gnp) from country)

-- 6.Query the NAME of the country having most LIFEEXPECTANCY.
select name, LIFEEXPECTANCY from country 
order by 2 desc
limit 1

-- 7.Query the NAME and GNP of the largest COUNTRY.
select name, gnp from country
where SURFACEAREA = (select max(SURFACEAREA) from country)

-- 8.Query the NAME and GNP of the most populated COUNTRY.
select name , gnp from country 
order by population desc
limit 1
