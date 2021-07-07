Create database ORG
show databases
use org

create table worker (
worker_id int primary key auto_increment,
first_name char(50),
last_name char(50),
salary int(15),
joining_date datetime,
department char(50));

insert into worker values
(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
worker_ref_id int,
bonus_amount int(10),
bonus_date datetime,
foreign key (worker_ref_id) references worker(worker_id) 
on delete cascade);

insert into bonus values
(001, 5000, '16-02-20'),
(002, 3000, '16-06-11'),
(003, 4000, '16-02-20'),
(001, 4500, '16-02-20'),
(002, 3500, '16-06-11');

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

insert into title values 
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
Select first_name as worker_name from worker

-- Q-2.Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(first_name) from worker

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct(department) from worker

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select substring(first_name, 1, 3) from worker 

-- Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
select instr(first_name, binary'a') from worker
where first_name = 'Amitabh'

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select RTRIM(first_name) from worker

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select LTRIM(department) from worker

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct(length(department)) from worker

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select replace(first_name, 'a', 'A') from worker

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select concat(first_name, ' ', last_name) as 'Complete_name' from worker

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from worker
order by first_name asc;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from worker 
order by first_name asc,
department desc;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from worker 
where first_name in ('Vipul', 'Satish')

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from worker where first_name not in ('Vipul', 'satish')

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin".
select * from worker where department = 'Admin'

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from worker where first_name like '%a%'

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker where first_name like '%a'

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from worker where first_name like '_____h' 

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from worker where salary between 100000 and 500000

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from worker where year(joining_date = 2014) and month(joining_date= 2)

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(*) from worker 
where department = 'Admin'

-- Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select first_name from worker 
where salary between 50000 and 100000

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select count(*), department from worker 
group by department 
order by count(*)

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
select * from worker 
inner join title on title.worker_ref_id = worker.worker_id
where worker_title = 'manager'

-- Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

-- Q-26. Write an SQL query to show only odd rows from a table.
select * from worker where mod (worker_id, 2)

-- Q-27. Write an SQL query to show only even rows from a table.
select * from worker where mod(worker_id, 2) = 0

-- Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE WorkerClone LIKE Worker;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
select * from workerclone left join worker on workerclone.worker_id = worker.worker_id
where 
intersect 
select * from workerclone right join worker on workerclone.worker_id = worker.worker_id

-- Q-30. Write an SQL query to show records from one table that another table does not have.
select * from bonus
minus 
select * from title

-- Q-31. Write an SQL query to show the current date and time.
select curdate()
select now()

-- Q-32. Write an SQL query to show the top n (say 10) records of a table.
select * from worker 
order by salary desc
limit 10

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from worker 
order by salary desc
limit 5

-- Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
SELECT Salary
FROM Worker W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 );

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
select distinct w.worker_id, w.first_name, w.salary
from worker w, worker w1
where w.salary = w1.salary
and w.worker_id != w1.worker_id

-- Q-36. Write an SQL query to show the second highest salary from a table.
Select max(Salary) from Worker 
where Salary not in (Select max(Salary) from  worker)

-- Q-37. Write an SQL query to show one row twice in results from a table.
select first_name, department from worker w where w.department = 'HR'
union all 
select first_name , department from worker w1 where w1.department = 'HR'

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
select * from worker 
where worker_id <= (select count(worker_id)/2 from worker)

-- Q-40. Write an SQL query to fetch the departments that have less than five people in it.
SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM Worker 
GROUP BY DEPARTMENT 
HAVING COUNT(WORKER_ID) < 5;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
select department , count(worker_id) from worker 
group by department

-- Q-42. Write an SQL query to show the last record from a table.
select * from worker 
where worker_id = (select max(worker_id) from worker)
 
-- Q-43. Write an SQL query to fetch the first row of a table.
select * from worker 
where worker_id = (select min(worker_id) from worker)

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT) as TempNew 
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary;
 
-- Q-46. Write an SQL query to fetch three max salaries from a table.
SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;

-- Q-47. Write an SQL query to fetch three min salaries from a table.
SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary >= b.Salary) order by a.Salary desc;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT distinct Salary from worker a WHERE n >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
 SELECT DEPARTMENT, sum(Salary) from worker group by DEPARTMENT;
 
-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from Worker);




