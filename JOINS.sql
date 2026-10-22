create database basicjoin;
use basicjoin;

create table employees( employee_id int primary key, ename varchar(50));
desc employees;

insert into employees (employee_id, ename) values
(101,'raghav'),
(102,'raashi'),
(103,'rohan'),
(104,'mohan');

create table project (project_id int primary key, pname varchar(50), employee_id int,foreign key (employee_id) 
references employees (employee_id));

insert into project (project_id, pname,employee_id) values
(1,'Project A',101),
(2,'Project B',102),
(3,'Project C',101),
(4,'Project D',103);

insert into employees values (105,'sanjay');
insert into employees values (106,'akshay');
insert into project values(5,'project E',103);
insert into project values(6,'project f',null);

-- inner join
select * from employees join project on employees.employee_id=project.employee_id;

select e.ename, p.pname from employees e inner join project p on e.employee_id =p.employee_id;

-- right join
select e.ename, p.pname from employees e right join project p on e.employee_id =p.employee_id;
select e.ename, p.pname from project p right join employees e on e.employee_id =p.employee_id;

-- left join
select e.ename, p.pname from employees e left join project p on e.employee_id =p.employee_id;


-- fuller outer join using union 
-- display all matching and non matching table data from both tables
select * from employees left join project on employees.employee_id = project.employee_id
union
select * from employees right join project on employees.employee_id = project.employee_id;

select e.ename, p.pname from employees e left join project p on e.employee_id=p.employee_id where 
p.employee_id is not null;

select e.ename, p.pname from employees e left join project p on e.employee_id=p.employee_id where 
p.employee_id is null;