create table location
(Location_ID int primary key,
City varchar(100));

insert into location
values
(122, 'New York'),
(123, 'Dallas'),
(124, 'Chicago'),
(167, 'Boston');

create table department
(Department_Id int primary key,
Name varchar(100),
Location_Id int,
foreign key(location_id) references location(location_id));

insert into department values
(10, 'Accounting', 122),
(20, 'Sales', 124),
(30, 'Research', 123),
(40, 'Operations', 167);

create table job
(job_id int primary key,
designation varchar(100));

insert into job values
(667, 'Clerk'),
(668, 'Staff'),
(669, 'Analyst'),
(670, 'Sales Person'),
(671, 'Manager'),
(672, 'President');

create table employee
(Employee_Id int,
Last_Name varchar(100),
First_Name varchar(100),
Middle_Name varchar(100),
Job_Id int,
Hire_Date date, 
Salary int,
Comm int,
Department_Id int,
foreign key(Job_Id) references job(job_id),
foreign key(department_Id) references department(department_id));

insert into employee
(Employee_Id, Last_Name, First_Name, Middle_Name, Job_Id, Hire_Date, Salary, comm, Department_Id)   
values
(7369, 'Smith', 'John', 'Q', 667, '1984-12-17',800, Null, 20),
(7499, 'Allen', 'Kevin', 'J', 670, '1985-02-20',1600, 300, 30),
(755, 'Doyle', 'Jean', 'K', 671, '1985-04-04',2850, Null, 30),
(756, 'Dennis', 'Lynn', 'S', 671, '1985-05-15',2750, Null, 30),
(757, 'Baker', 'Leslie', 'D', 671, '1985-06-10',2200, Null, 40),
(7521, 'Wark', 'Cynthia', 'D', 670, '1985-02-22',1250, 50, 30);


