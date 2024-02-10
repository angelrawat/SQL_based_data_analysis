
--. List out the distinct jobs in sales and accounting departments
select distinct j.designation,d.name 
from employee e
join department d
on e.department_id=d.department_id
join job j
on e.job_id=j.job_id
where d.name in ('sales','accounting')

--. List out all the jobs in sales and accounting departments
select distinct j.designation,d.name 
from employee e
join department d
on e.department_id=d.department_id
join job j
on e.job_id=j.job_id
where d.name in ('sales','accounting')

--. List out the common jobs in research and accounting departments in ascending order
select j.designation,d.name 
from employee e
join department d
on e.department_id=d.department_id
join job j
on e.job_id=j.job_id
where d.name ='accounting'
intersect
select j.designation,d.name 
from employee e
join department d
on e.department_id=d.department_id
join job j
on e.job_id=j.job_id
where d.name ='research'
