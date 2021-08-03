create table employee(
emp_id int primary key not null,
emp_name varchar(20) not null,
email char(25) not null,
phone_number varchar(10) not null,
dept_id int not null);

select * from employee;

/*adding salary to table*/
alter table employee add salary decimal(8,2);

/*constratint check*/
ALTER TABLE employee ADD CONSTRAINT CHK_EmployeeSalary CHECK (salary>10000);
/*Drop constraint*/
alter table employee drop check CHK_EmployeeSalary ;

/*constraint foreign key and references*/
alter table employee add CONSTRAINT dept_id  foreign key (dept_id) references dept(depart_id);

/*Drop constraint*/
alter table employee drop foreign key dept_id;

/*drop email*/
alter table employee drop email;


/*rename table*/
alter table employee rename to empl;

/*drop table*/
drop table dept1;




/*
insert into employee value(101,'Babu','babu101@gmail.com','9448341201',10,12000),
(102,'Somu','somu102@gmail.com','9448534120',20,16000),
(103,'Ramu','ramu103@gmail.com','9448886634',40,14000),
(104,'Gobu','gobu104@gmail.com','9447783412',50,11500),
(105,'Anbu','anbu105@gmail.com','9848341200',40,22000),
(106,'Raj' ,'raj@gmail.com','959595959',30,30000);

/*material dept*/
select *from employee where dept_id=40;

select  dept_id,emp_name  from employee where dept_id=30;

select emp_name from employee where emp_name like "r%";

select emp_name from employee where dept_id=40 and salary>15000;

update employee set salary= salary + (salary * 10 / 100)  where dept_id = 30;

update employee set salary= salary + (salary * 30 / 100)  where dept_id = 20;

select * from employee order by salary asc;

select *from employee order by emp_name desc;

create view my_tab as select emp_id, emp_name,dept_id from employee where salary >=10000;

create table updatedemp select emp_id, emp_name,email from employee where dept_id>20;
/*