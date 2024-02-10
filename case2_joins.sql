---JOINS
select * from employee
select * from department
select * from job
select * from location

--List out employees with their department names.
select first_name, d.department_id
from employee e
inner join department d
on e.department_id=d.department_id

--Display employees with their designations
select first_name, d.job_id
from employee e
inner join job d
on e.job_id=d.job_id

--Display the employees with their department names and regional groups
with t as 
(select d.department_id, d.name as department_name, e.city as regional_group
from department d
join location e
on d.location_id=e.location_id)

select s.first_name as name, department_name, regional_group
from employee s
join t
on t.department_id=s.department_id

--How many employees are working in different departments? Display with department names.
select count(e.employee_id) as num_of_employee, d.name
from employee e
join department d
on e.department_id=d.department_id
group by d.name

--How many employees are working in the sales depa
select count(e.employee_id) as num_of_employee
from employee e
join department d
on e.department_id=d.department_id
where d.name='sales'

--Which is the department having greater than or equal to 5 employees? Display the department names in ascending order.
select count(e.employee_id) as num_of_employee, d.name
from employee e
join department d
on e.department_id=d.department_id
group by d.name
having count(e.employee_id)>=5
order by d.name asc

--How many jobs are there in the organization? Display with designation
select j.designation 
from employee e
join job j
on e.job_id=j.job_id

--How many employees are working in "New York"?
with t as
(select city, d.department_id
from location l
join department d
on l.location_id=d.location_id)

select count(e.employee_id)
from employee e
join t
on e.department_id=t.department_id
where city='New York'

--Display the employee details with salary grades. Use conditional statement to create a grade column.
select *, case
when salary<1000 then 'Low Salary'
when salary between 1000 and 2000 then 'Medium Salary'
when salary>2000 then 'High Salary'
end as salary_grade
from employee

--List out the number of employees grade wise. Use conditional statement to create a grade column
with t as
(select *, case
when salary<1000 then 'Low Salary'
when salary between 1000 and 2000 then 'Medium Salary'
when salary>2000 then 'High Salary'
end as salary_grade
from employee)
select count(t.salary_grade), t.salary_grade
from t
group by t.salary_grade

--Display the employee salary grades and the number of employees between 2000 to 5000 range of salary
with t as
(select *, case
when salary<1000 then 'Low Salary'
when salary between 1000 and 2000 then 'Medium Salary'
when salary>2000 then 'High Salary'
end as salary_grade
from employee)
select count(t.salary_grade), t.salary_grade
from t
where salary_grade='High Salary'
group by t.salary_grade

--Display all employees in sales or operation department
select e.first_name, d.name
from employee e
join department d
on e.department_id=d.department_id
where d.name in ('Sales' , 'Operations')