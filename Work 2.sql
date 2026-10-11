select distinct Salary from Employees;

select Age as Employee_Age,
Salary as Employee_Salary from Employees;

-- Where Clause & Operators
select *from Employees where Salary > 50000 and Hire_date < '2016-01-01';

select *from Employees where Designation is NULL;

update Employees set Designation='Data Scientist' where Employees_id='5004' and Designation is NULL;

select *from Employees where Designation='Data Scientist';

-- ORDER BY:
select *from Employees order by department_id asc,Salary desc;

-- LIMIT:
select *from Employees where year(Hire_date)=2018 order by Hire_date asc limit 5;

-- Aggregate Functions:
select sum(e.Salary) as Total_Finance_Salary
from Employees e 
join departments d
on e.department_id=d.department_id 
where d.department_name='Finance';

select min(Age) as Minimum_Age from Employees;

-- Group by
select l.location_name,
max(e.Salary) as Maximum_Salary
from Employees e
join locations l
on e.location_id=l.location_id
group by l.location_name;

select Designation,
avg(Salary) as Average_Salary 
from Employees
where Designation like '%Analyst%'
group by Designation;

-- Having

select department_name,
count(e.Employees_id) as Total_Employees 
from departments d
left join employees e 
on e.department_id=d.department_id
group by d.department_id,d.department_name
having count(e.Employees_id) < 3;

select l.location_name,
avg(e.Age) as Average_Age
from locations l
join employees e
on l.location_id=e.location_id
where e.Gender='F'
group by l.location_id,l.location_name
having avg(e.Age) < 30;

-- Inner Join

select e.Employees_name,
e.Designation,
d.department_name 
from employees e 
inner join departments d 
on e.department_id=d.department_id;

-- Left join 

select d.department_name,
count(e.Employees_id) as Total_Employees
from departments d
left join employees e
on d.department_id=e.department_id
group by d.department_id,d.department_name;

-- Right Join

select l.location_name,e.Employees_name
from locations l
right join employees e
on e.location_id=l.location_id;