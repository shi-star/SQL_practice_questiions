create database shilpa
use shilpa

create table countries(
country_id varchar(20) not null, 
country_name char(20),  
region_id int);

create table if not exists countries(
country_id varchar(20) not null, 
country_name char(20),  
region_id int);

create table if not exists dup_countries(
country_id varchar(20) not null, 
country_name char(20),  
region_id int);
create table if not exists dup_countries(
like countries);

create table if not exists dup_countries
As select * from countries;

CREATE TABLE jobs (
    job_id INT,
    job_title VARCHAR(20),
    min_salary INT,
    max_salary INT,
    CHECK (max_salary > 25000)
);
create table if not exists countries (
country_id varchar(20) not null, 
country_name char(20),  
region_id int,
check ( country_name in ('india', 'china', 'italy')));

CREATE TABLE job_history (
employee_id INT,
start_date DATE,
end_date DATE ,
check (end_date like '--/--/----'),
job_id INT,
department_id INT
);


create table if not exists job_history(
job_id INT,
job_title VARCHAR(20) not null default ' ',
min_salary INT not null default 8000 ,
max_salary INT not null default 'null'
);
create table if not exists countries (
country_id int(20) not null unique auto_increment primary key , 
country_name char(20),  
region_id int);

create table if not exists job_history(
employee_id INT primary key ,
start_date DATE,
end_date DATE ,
job_id INT,
department_id INT,
foreign key (job_id) references jobs(job_id)

);

CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    first_name TEXT not null ,
    last_name char(25) default 'na',
    email VARCHAR(50),
    phone_number INT,
    hire_date DATE,
    job_id varchar(20),
    salary INT,
    commission INT,
    manager_id INT,
    department_id INT,
    foreign key (department_id) references job_history(department_id),
    foreign key (job_id) references jobs(job_id)
);

insert into countries values ( 1234, 'india', '256');
select * from countries
insert into countries(country_id, region_id) value ('as001', 365);

create table if not exists country_new 
As select * from countries

select * from country_new;
insert into countries values 
('0032we', 'germany', 133),
('00nhj2', 'france', 134);

insert into country_new
select * from countries;

update employees
set email = 'not available'
where department_id = (
select department_id from departments 
where department_name = 'accounting');

update employees 
set salary = 5000,
where employee_id = 105 and salary <= 5000;

update employees 
set job_id = 'SH-Clerk',
where employee_id = 118 and department_id = 30 and not job_id like 'SH%';

update employeess 
set salary = salary+ salary*0.25
where department_id = 40

alter table countries rename countri_new ;
alter table location add region_id int;
alter table location add id int first ;
alter table location add region_id int after state_province;
alter table locations modify country_id int;
alter table location drop city;
alter table location 
change state_province state varchar(50);
alter table location modify location_id primary key;
alter table location add primary key ( location_id, country_id);
SELECT 171*214+625 Result;

alter table countries rename country_new;
alter table location add region_id int;
alter table location add Id int first;
alter table location add region_id int after state_provice;
alter table locations modify country_id int;
alter table location drop city;
alter table location change state_province state varchar(50);
alter table location add primary key (location_id);
alter table location drop primary key ;
alter table location add foreign key (job_id) references jobs(job_id);
select * from employee
where salary not between 10000 and 15000;

select first_name, last_name , employee_id from employees
where department in (30, 100) 
order by department_id ASC;

select first_name, last_name , employee_id from employees
where salary between 10000 and 15000
and department_id in (30,100);

select first_name, last_name , hiredate from employees
where year (hire_date) like '1987%'

select first_name from employees
where first_name like '%b%' 
and first_name like '%c%';

select lastname , job, salary from employees
where job in ('prog' , 'clerk')
and salary not in (4500, 10000, 1500);

select last_name from employees
where last_name like '_______';

select last_name from employees
where last_name like '__e%';

select count(distinct job_id) from employees

select distinct first_name from employees;

select sum(salary) from employees;
select min(salary) from employees;
select max(salary) from employees
where job = 'prog';
select avg(salary) from employees
where department = 90;
select round(sum(salary), 0) 'max',
round(max(salary), 0) 'min',
round(min(salary), 0) 'sum',
round(avg(salary), 0) 'avg'
from employees
select job_id, count(*)
from employees
group_by job_id;

select max(salary) - min(salary) difference
from employees;

select manager_id from employees
where salary = min(salary);
































































select 15+75 result;
select concat(first_name , ' ', last_name) 'employee name'
from employees














































