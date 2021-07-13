use hr
-- 1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
select location_id, street_address, city, state_province, country_name from locations 
natural join countries

-- 2. Write a query to find the name (first_name, last name), department ID and name of all the employees.
select first_name, last_name, department_id, department_name from employees
natural join departments

-- 3. Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
select first_name, last_name , job_id, d.department_id, department_name from employees e
join departments d on d.department_id = e.department_id
join locations l on d.location_id = l.location_id
where l.city = 'London'

-- 4. Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
select e.employee_id , e.last_name , m.manager_id , m.last_name from employees m
join employees e
on m.manager_id = e.manager_id 

-- 5. Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.
select e.first_name, e.last_name, e.hire_date from employees e
join employees s
on s.last_name = 'Jones'
where s.hire_date < e.hire_date

-- 6. Write a query to get the department name and number of employees in the department.
select d.department_name , count(e.employee_id) from employees e
join departments d on d.department_id = e.department_id
group by department_name

-- 7. Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90
select employee_id, job_title, end_date-start_date  from job_history
natural join jobs
where department_id = 90

-- 8. Write a query to display the department ID and name and first name of manager.
SELECT d.department_id, d.department_name, d.manager_id, e.first_name 
FROM departments d 
INNER JOIN employees e 
ON (d.manager_id = e.employee_id);

-- 9. Write a query to display the department name, manager name, and city.
select d.department_name, d.manager_id, e.first_name, l.city 
from employees e
join departments d on d.manager_id = e.employee_id
join locations l on d.location_id = d.location_id

-- 10. Write a query to display the job title and average salary of employees.
select j.job_title , avg(e.salary) from jobs j
join employees e
on j.job_id = e.job_id
group by j.job_title
order by avg(e.salary) desc

-- 11. Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 
select  j.job_title, e.first_name, e.salary-j.min_salary from employees e
join jobs j
on j.job_id = e.job_id

-- 12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.
select * from job_history  
join employees on employees.employee_id = job_history.employee_id
where salary > 10000

-- 13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
SELECT first_name, last_name, hire_date, salary, 
(DATEDIFF(now(), hire_date))/365 Experience 
FROM departments d JOIN employees e 
ON (d.manager_id = e.employee_id) 
WHERE (DATEDIFF(now(), hire_date))/365>15;
