use practice

create table teacher (
id int primary key,
dept varchar(50) default null,
`name` varchar(100) default null, 
phone int default null,
mobile varchar(100) default null);
drop table teacher


create table dept(
id int primary key,
name varchar(100) default null);

INSERT INTO teacher VALUES 
(101,1,'Shrivell','2753','07986 555 1234'),
(102,1,'Throd','2754','07122 555 1920'),
(103,1,'Splint','2293',NULL),
(104,NULL,'Spiregrain',NULL,NULL),
(105,2,'Cutflower','3212','07996 555 6574'),
(106,NULL,'Deadyawn','3345',NULL);

Insert into dept values
(1, 'computing'),
(2, 'design'),
(3, 'engineering');
desc teacher

-- 1.List the teachers who have NULL for their department.
Select name from teacher
where dept is null

-- 2.INNER JOIN misses the teachers with no department and the departments with no teacher. Use a different JOIN so that all teachers are listed.
SELECT t.name,d.name AS dept
FROM teacher t left join dept d
ON t.dept=d.id

-- 3.Use a different JOIN so that all departments are listed.
select t.name , d.name as dept
from teacher t right join dept d
on t.dept = d.id

-- 4.Show teacher name and mobile number .Use the number '07986 444 2266' if there is no number given.
select name, coalesce(mobile, '07986 444 2266') As mobile
from teacher

-- 5.Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
select teacher.name, COALESCE(dept.name, 'None') AS dept from teacher
left join dept on 
teacher.dept = dept.id

-- 6.Use COUNT to show the number of teachers and the number of mobile phones.
select count(name) as 'number of teachers' , count(mobile) as 'no. of mobile phones'
from teacher

-- 7.Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
select dept.name, count(teacher.name) as 'no. of staffs'
from teacher right join dept on 
teacher.dept = dept.id
group by dept.name

-- 8.Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
select teacher.name ,
case 
 when dept in (1,2) then 'Sci'
 else 'art'
end as 'sub'
from teacher 

-- 9.Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
select teacher.name ,
case 
 when dept in (1,2) then 'Sci'
 when dept = 3 then 'art'
 else 'none'
end as 'sub'
from teacher 










