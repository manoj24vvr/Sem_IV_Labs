-- Q.7.7(INVOKING FUNCTION)


SET SERVEROUTPUT ON
DECLARE

v_empno NUMBER;
v_boss_name VARCHAR2(10);

v_prjID VARCHAR(3);

v_date DATE;

v_temp BOOLEAN;

BEGIN

--(i)
v_empno := 102;
v_boss_name := package_Lab_7_Q7.name_boss(v_empno);
dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);


--(ii)
v_prjID := 'P2 ';
package_Lab_7_Q7.employees_prj(v_prjID);


--(iii)
v_date := '10-JAN-20';
package_Lab_7_Q7.prj_name_date(v_date);


--(iv)
package_Lab_7_Q7.employees_skill;


--(v)
v_temp := package_Lab_7_Q7.no_of_employees;
dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || sys.diutil.bool_to_int(v_temp));


END;
/