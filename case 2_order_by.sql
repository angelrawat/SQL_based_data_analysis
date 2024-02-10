--order by clause
select employee_id, last_name
from employee
order by employee_id

select employee_id, first_name
from employee
order by salary desc

select *
from employee
order by last_name asc

select *
from employee
order by last_name asc, department_id desc

