--where conditions
select *
from employee
where last_name='Smith'

select first_name
from employee
where department_id=20

select first_name
from employee
where salary between 3000 and 4500

select first_name
from employee
where department_id in (10,20)

select first_name
from employee
where department_id not in (10,30)

select first_name
from employee
where first_name like 'S%'

select first_name
from employee
where first_name like 'S%' and last_name like '%H'

select first_name
from employee
where first_name like 'S%' and len(First_name)=4

select first_name
from employee
where department_id=10 and salary>3500

select first_name
from employee
where comm is null