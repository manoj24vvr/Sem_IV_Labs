-- Q.7.6

CREATE OR REPLACE FUNCTION emp_email_generated RETURN NUMBER IS
v_temp NUMBER := 1;

CURSOR c_emp_email IS SELECT empcode, name FROM emp;

BEGIN

dbms_output.put_line('The Generated Email id of the Employees are: ');
dbms_output.put_line(' ');

FOR i IN c_emp_email LOOP

	dbms_output.put_line(i.name || '_' || i.empcode || '@digisol.com');

END LOOP;

RETURN v_temp;

END emp_email_generated;
/