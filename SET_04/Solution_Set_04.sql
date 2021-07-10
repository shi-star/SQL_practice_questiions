use practice
-- 1.Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order
Select name from Employee
order by name

-- 2.Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000  per month who have been employees for less than 10 months. Sort your result by ascending employee_id.
Select name from employee
where salary > 2000 And months < 10
order by employee_id

-- 3.Find the number of Most Senior Employees.
Select * from employee
where months = (select max(months) from employee)

-- 4.We define an employee's total earnings to be their monthly salary x months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.
SELECT months*salary as Earnings,
COUNT(*) as "Top Earners" FROM Employee
group by 1 
order by 1 desc
limit 1