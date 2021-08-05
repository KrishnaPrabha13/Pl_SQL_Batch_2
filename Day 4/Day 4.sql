SET SERVEROUTPUT ON;

--tables
Declare
i number(2);
n number(2);
BEGIN
n:=&n;
for i in 1..10 loop
dbms_output.put_line( n || ' * ' || i || ' = ' || n*i);
end loop;
end;

--50 whole number
CREATE GLOBAL TEMPORARY TABLE table2
(
numb1 NUMBER(4)
)
ON COMMIT PRESERVE ROWS;
Declare
I number;
Begin
    I:=0;
While (I<=49)
loop
    Dbms_output.put_line(I||' ');
    I:=I+1;
     INSERT INTO table2 VALUES(I);
End loop;
End;
/

--table creation
create table employee4(emp_id int , emp_name varchar(20), salary int, comm int ); 
insert into employee4 values(1, 'Ram',10000,50);
insert into employee4 values(2, 'Mahe',10000,50);

Select * from employee4;

--Builtin expection
DECLARE
   temp varchar(20);
BEGIN
   SELECT emp_id into temp from employee4  where emp_name='Raj';
exception
   WHEN no_data_found THEN
      dbms_output.put_line('ERROR');
      dbms_output.put_line('There is no name as Raj');
end;

--Built in exception
DECLARE
   tem varchar(20);
  
BEGIN
   SELECT emp_id into tem from employee4;
  
EXCEPTION
   WHEN too_many_rows THEN
      dbms_output.put_line('ERROR');
      dbms_output.put_line('Trying to Select too many rows');
end;


--User Defined Exeption
DECLARE
   myex EXCEPTION;
   i Number;
BEGIN
    For i in (select* from employee4)loop
        if i.emp_id = 1 then 
            RAISE myex;
        END IF;
    END LOOP;
EXCEPTION
     WHEN myex then
     dbms_output.put_line('Employee id already exist');
END;
    

--panlindrome
DECLARE 
    s VARCHAR2(10) := 'radar'; 
    l VARCHAR2(20); 
    t VARCHAR2(10); 
BEGIN
    FOR i IN REVERSE 1..Length(s) LOOP 
        l := Substr(s, i, 1); 
        t := t ||'' ||l; 
    END LOOP; 

    IF t = s THEN 
      dbms_output.Put_line(t||'' ||' is palindrome'); 
    ELSE 
      dbms_output.Put_line(t ||'' ||' is not palindrome'); 
    END IF; 
END;


--Trigger
CREATE OR REPLACE TRIGGER employee4_insert_update
 BEFORE INSERT OR UPDATE ON employee4
 for each row
 BEGIN
       :NEW.emp_name := UPPER(:NEW.emp_name);
  END;
  

select * from employee4;

--Delete
CREATE  procedure del;
IS
BEGIN
    delete from employee4 where emp_id=1;
commit;
end;
