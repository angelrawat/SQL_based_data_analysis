--Simple Queries--
--1.
select *
from employee

--2.
select *
from department

--3.
select *
from job

--4.
select *
from location

--5.
select First_name, last_name, salary, comm as commission
from employee

--6.
select Employee_ID as 'ID of the Employee', Last_Name as 'Name of the Employee', Department_ID as 'Dep_id'
from employee

--7.
select First_name+' '+middle_name+' '+last_name as name, salary
from employee
