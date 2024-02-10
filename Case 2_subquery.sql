--subqueries

--Display the employees list who got the max salary
select * 
from employee a
join department b
on a.department_id=b.department_id
join (select max(salary) as salary, d.name
from employee e
join department d
on e.department_id=d.department_id
group by d.name)t
on a.salary=t.salary and b.name=t.name

--Display the employees who are working in the sales department
select * 
from employee a
join department b
on a.department_id=b.department_id
where b.name='Sales'

--Display the employees who are working as 'Clerk'.
select * 
from employee a
join job b
on a.job_id=b.job_id
where b.designation='clerk'

--Display the list of employees who are living in "New York
select *
from employee e
join department d
on e.department_id= d.department_id
join location l
on l.location_id=d.location_id
where city='New York'

--Find out the number of employees working in the sales department
select count(e.employee_id)
from employee e
join department d
on e.department_id= d.department_id
where d.name='sales'

--Update the salaries of employees who are working as clerks on the basis of 10%.
select * into #tem from 
(select e.first_name, e.salary, j.designation 
from employee e
join job j
on e.job_id=j.job_id)t

update #tem
set salary=0.1*salary+salary
where designation='Clerk'
select * from #tem

--Delete the employees who are working in the accounting department.
select * into rk 
from(select e.first_name, d.name
from employee e
join department d
on e.department_id= d.department_id)t
delete from rk
where name='accounting'
select * from rk

--Display the second highest salary drawing employee details
select *
from (select *, dense_rank() over(order by salary) as k
from employee)e
where k=2

--Display the nth highest salary drawing employee details

--List out the employees who earn more than every employee in department 30
select top 1 *
from employee
where department_id=30
order by salary desc

--List out the employees who earn more than the lowest salary in department.
select *
from (select *, dense_rank() over(partition by department_id order by salary) as k
from employee)e
where k=2

--Find out whose department has no employees.
select name
from (select e.employee_id, d.name
from employee e
right join department d
on e.department_id=d.department_id)t
where t.employee_id is null

--Find out the employees who earn greater than the average salary for their department
select *
from employee e
join (select avg(salary) as average, department_id
from employee
group by department_id)t
on e.department_id=t.department_id
where e.salary-t.average>0