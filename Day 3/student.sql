create table student(
stu_id int primary key not null,
stu_name varchar(20) not null,
sex  varchar(10) not null,
total_mark int not null);

insert into student value(10,'Anu',' Female', 553),
(20,'Anbu','Male', 345),
(30 ,'Malini', 'Female', 567),
(40, 'Sankar', 'Male', 590),
(50, 'varshan', 'Male' ,587);

/*max mark*/
select max(total_mark) as max_mark from student;

/*count of malee and female*/
select count(sex) from student group by sex;

/*avg mark*/
select avg(total_mark) from student;

/*mark grater than avg of totalmark*/
select* from student where total_mark>(select avg(total_mark) from student ) group by stu_name;

/*mark greater than avg*/
select stu_name,total_mark, avg(total_mark) as average from student group by stu_name having average >(select avg(total_mark) from student);

/*name with 3 char*/
select * from student where stu_name like "___";

/*asc and desc*/
select * from student where total_mark>0 order by sex asc , total_mark desc;

/*diff*/
select max(total_mark) - min(total_mark) from student;

/*view*/
create view student1 as select stu_id, stu_name,sex,total_mark from student where total_mark>100 with check option;
insert into student1 values(60 ,'Komala', 'Female', 537),(70 ,'Mahe', 'Female',467);

/*inserstion,savepoitn,rollback*/
start transaction;
insert into student values(80 ,'Ram', 'Male', 547),(90 ,'Raj', 'Male', 367),(100 ,'Priya', 'Female', 567);

savepoint s;
delete from student where stu_id between 90 and 100;

rollback to savepoint s;
commit;
