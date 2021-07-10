Create database Employees
use employees
drop table if exists Employee
create table Employee (
Emp_id int primary key, 
Emp_name varchar(20),
Department varchar(20),
Contact_no int ,
Email_id varchar(100), 
Emp_head_id int );

Select * from employee
insert into employee values
(101,'Isha','E-101',1234567890,'isha@gmail.com',105),
(102,'Priya','E-104',1234567890,'priya@yahoo.com',103),
(103,'Neha','E-101',1234567890,'neha@gmail.com',101),
(104,'Rahul','E-102',1234567890,'rahul@yahoo.com',105),
(105,'Abhishek','E-101',1234567890,'abhishek@gmail.com',102)

create table Emp_Dept(
Dept_id varchar(20) primary key,
Dept_name varchar(20),
Dept_off varchar(20),
Dept_head int);

insert into Emp_Dept values 
('E-101','HR','Monday',105),
('E-102','Development','Tuesday',101),
('E-103','HousKeeping','Saturday',103),
('E-104','Sales','Sunday',104),
('E-105','Purchase','Tuesday',104)

create table Emp_Sal(
Emp_id int primary key ,
Salary int,
Is_permament varchar(10),
foreign key (Emp_id) references employee(Emp_id));

insert into Emp_Sal values
(101, 2000, 'Yes'),
(102, 10000, 'yes'),
(103, 5000, 'no'),
(104, 1900, 'yes'),
(105, 2300, 'yes')

Create table Project (
Project_id varchar(20) primary key,
Duration int );

insert into Project values
('p-1',23),
('p-2',15),
('p-3',45),
('p-4',2),
('p-5',30)
Drop table if exists Country
Create table Country(
C_id varchar(10) primary key,
C_name varchar(20));

insert into Country values
('c-1', 'India'),
('c-2', 'USA'),
('c-3', 'China'),
('c-4','Pakistan'),
('c-5','Russia')

Create table Client_Table (
Client_id varchar(20) primary key,
Client_name varchar(50), 
C_id varchar(20) , Foreign key (C_id) references Country(C_id));

insert into Client_Table values 
('cl-1','ABC Group','c-1'),
('cl-2','PQR','c-1'),
('cl-3','XYZ','c-2'),
('cl-4','tech altum','c-3'),
('cl-5','mnp','c-5')

Drop table Emp_project
create table Emp_project(
Emp_id int ,
project_id varchar(20) ,
client_id varchar(20) ,
start_year int, 
end_year int,
FOREIGN KEY (Emp_id) REFERENCES Employee(Emp_id),
FOREIGN KEY (Project_id) REFERENCES Project(Project_id), 
FOREIGN KEY (Client_id) REFERENCES Client_table(client_id));

insert into Emp_project values 
(101, 'p-1', 'cl-1', 2010, 2010),
(102, 'p-2', 'cl-2', 2010, 2012),
(103, 'p-1', 'cl-3', 2013, null),
(104, 'p-4', 'cl-1', 2014, 2015),
(105, 'p-4', 'cl-5', 2015, null);

-- 1. Select the detail of the employee whose name start with P.
Select * from Employee 
where Emp_name like 'p%'

-- 2. How many permanent candidate take salary more than 5000.
Select count(*) from Emp_Sal 
where is_permament = 'yes' and salary >5000

-- 3.Select the detail of employee whose emailId is in gmail.
select * from Employee 
where Email_id like '%gmail.com'

-- 4.Select the details of the employee who work either for department E-104 or E-102.
select * from employee
where department in ('E-104', 'E-102')

-- 5. What is the department name for DeptID E-102?
select dept_name from Emp_dept
where dept_id = 'E-102'

-- 6.What is total salary that is paid to permanent employees?
select sum(salary) from Emp_sal
where Is_permament = 'Yes'

-- 7. List name of all employees whose name ends with a.
Select * from Employee
where Emp_name like '%a'

-- 8.List the number of department of employees in each project.
select department, count(emp_id) as 'no. of employees' from employee
group by department 
		
-- 9. How many project started in year 2010?
select count(project_id) , start_year from emp_project
where start_year = 2010

-- 10.How many project started and finished in the same year?
select count(project_id) from emp_project
where start_year=end_year

-- 11.select the name of the employee whose name's 3rd charactor is 'h'.
select emp_name from employee
where emp_name like '__h%'

-- 12.Select the department name of the company which is assigned to the employee whose employee id is grater 103.
select dept_name, emp_id from emp_dept
inner join employee on employee.department = emp_dept.dept_id
where emp_id > 103;

-- or 

select dept_name from emp_dept 
where dept_id in (select department from employee where emp_id>103)

-- 13. Select the name of the employee who is working under Abhishek.
select emp_name from employee
where emp_head_id = (select emp_id from employee where emp_name='Abhishek')

-- 14.Select the name of the employee who is department head of HR.
select emp_name from employee 
inner join emp_dept on employee.department = emp_dept.dept_id
where emp_id = (select dept_head from emp_dept where dept_name = 'HR')

-- 15.Select the name of the employee head who is permanent.
select emp_name from employee 
where emp_id in (select emp_id from Emp_sal where Is_permament = 'Yes') 
and emp_id in (select dept_head from emp_dept)

-- 16.Select the name and email of the Dept Head who is not Permanent.
select emp_name , email_id from employee 
where emp_id in (select emp_id from emp_sal where Is_permament= 'NO')
and emp_id in (select dept_head from emp_dept)

-- 17.Select the employee whose department off is monday.
select emp_name from employee 
where department = (select dept_id from emp_dept where dept_off = 'Monday')

-- 18.Select the indian clinets details.
select * from client_table 
where c_id = (select c_id from country where c_name = 'India')

-- 19.Select the details of all employee working in development department.
select * from employee 
where department = (select dept_id from emp_dept where dept_name = 'development')




