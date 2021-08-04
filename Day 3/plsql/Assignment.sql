SET SERVEROUTPUT ON;
DECLARE
        n1 NUMBER:= 20;
        n2 NUMBER:=20;
BEGIN
    CASE n1
        when 20 then dbms_output.put_line(POWER(n1,2));
        END CASE;
        
    CASE n2 
        when 20 then dbms_output.put_line(POWER(n2,3));
        END CASE;
END;
        