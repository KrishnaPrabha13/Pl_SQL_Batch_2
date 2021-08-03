create database assignment;
use assignment;

create table dept(
depart_id int primary key not null,
depart_name varchar(30) not null,
manage_id int unique);


insert into dept values( 10,'purchase',123), (20,'inventoery',345),(30,'sales',567),(40,'materilas',789),(50,'production',911);

/* new table from exsiting table structure*/
create table dept1 as select * from dept;