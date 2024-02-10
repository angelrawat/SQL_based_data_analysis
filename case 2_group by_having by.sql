--group by and having clause
select count(employee_id) as no_of_employees
from employee
group by department_id

select max(salary) as max_salary, min(salary) as min_salary, avg(salary) as avg_salary
from employee
group by department_id

select max(salary) as max_salary, min(salary) as min_salary, avg(salary) as avg_salary
from employee
group by job_id

select count(employee_id), month(hire_date) as months
from employee
group by month(hire_date)
order by count(employee_id)

select department_id
from employee
group by department_id
having count(employee_id)>=4

select count(employee_id)
from employee
group by month(hire_date)
having month(hire_date)=1

select count(employee_id)
from employee
group by month(hire_date)
having month(hire_date)=1 or month(hire_date)=9 

select count(employee_id)
from employee
group by year(hire_date)
having year(hire_date)=1985


select count(employee_id), x
from (select *, cast(year(hire_date) as varchar(10))+'-'+cast(month(hire_date) as varchar(10)) as x
from employee)t
where year(hire_date)=1985
group by x

select department_id
from employee
where month(hire_date)=4 and year(hire_date)=1985
group by department_id
having count(department_id)>=3

