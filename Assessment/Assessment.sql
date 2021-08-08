--1 question create table 
create table myemp1(
eno number(4) primary key not null ,
ename varchar(30) not null,
deptno number(4) not null,
esal decimal(8,2));



--inserting value
insert into myemp1 values(0100,'Babu',0010,12000.02);
insert into myemp1 values(0101,'Somu',0020,16000.45);
insert into myemp1 values(0102,'Ramu',0040,6000.45);
insert into myemp1 values(0103,'Gobu',0050,11500.34);
insert into myemp1 values(0104,'Ram',0060,12000.44);

select * from myemp1;


--1 a) Add a new column experience with number datatype and with not null constraint.
alter table myemp1 add experience number;

--1 b) update esal column of the table with null values whose esal value is between 5000-10000
update  myemp1 set esal= null where esal>5000.0 and esal<10000.0;

--2)Add a new column comm in myemp with some null and not null values*/
alter table myemp1 add comm int;

update myemp1 set comm=40 where eno=0100;
update myemp1 set comm=89 where eno=0103;

create table empcommnul as (select * from myemp where comm=null);

delete from myemp1 where comm is null;

insert  into empcommnul select * from myemp1 where comm is null;


--5)Exception
declare 
 e_id myemp1.eno%type := &eno; 
 e_name myemp1.ename%type; 
 e_sal myemp1.esal%type;
BEGIN 
   SELECT ename,esal INTO  e_name, e_sal FROM myemp1 WHERE eno = e_id;  
   DBMS_OUTPUT.PUT_LINE ('Name: '||  e_name); 
   DBMS_OUTPUT.PUT_LINE ('SALARY: ' || e_sal); 

EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such employee!'); 
   WHEN others THEN 
      dbms_output.put_line('Error!'); 
END; 


--6) create table ebill
create table ebill(
cno varchar(10) primary key,
cname varchar(30) not null,
nounits number(4) not null,
bamt decimal(8,2));

--inserting value
insert into ebill values('10','Babu',5,null);
insert into ebill values('20','Somu',2,null);
insert into ebill values('30','Ramu',8,null);
insert into ebill values('40','Gobu',20,null);
insert into ebill values('50','Anbu',6,null);

select *from ebill;

