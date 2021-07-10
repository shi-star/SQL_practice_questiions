-- 1.Query the following two values from the STATION table:
-- The sum of all values in LAT_N rounded to a scale of 2 decimal places.
-- The sum of all values in LONG_W rounded to a scale of 2 decimal places.
select round(sum(lat_N),2) as lat , round(sum(long_W),2) as Lon from station

-- 2.Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places.
select round(sum(lat_N),4) from station
where lat_N > 38.78 and lat_N< 137.23

-- 3.Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.
select round(max(lat_N),4) from station where lat_N < 137.2345

-- 4.Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345 . Round your answer to 4 decimal places.
select round(max(long_W),4) from station where lat_N < 137.2345

-- 5.Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7880 . Round your answer to 4 decimal places.
select round(min(lat_N),4) from station where lat_N > 38.78 

-- 6. Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7880 . Round your answer to 4 decimal places.
select round(long_W,4) as "Smallest value" from STATION 
  where lat_N=(select min(lat_N) from STATION
                where lat_N>38.7880)
                
-- 7.Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.
• a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
• b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
• c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
• d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.
select round(abs(min(lat_N)-max(lat_N))+abs(min(long_W)-max(long_W)),4) as "Manhatten Distance"  from STATION

-- 8.Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
-- Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits
select round(sqrt(pow(min(LAT_N)-max(LAT_N),2)+
                  pow(min(LONG_W)-max(LONG_W),2)),4) as "Euclidean Distance"
  from STATION
 