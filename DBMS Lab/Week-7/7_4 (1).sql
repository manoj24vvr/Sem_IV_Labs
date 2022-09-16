-- Q.7.4


--FUNCTION:

CREATE OR REPLACE FUNCTION return_incentive(f_rating IN CHAR) RETURN NUMBER IS
f_incentive NUMBER;

BEGIN

CASE f_rating

	WHEN 'A' THEN f_incentive := 30000;
	WHEN 'B' THEN f_incentive := 20000;
	WHEN 'C' THEN f_incentive := 10000;

END CASE;

RETURN f_incentive;

END return_incentive;
/


--INVOKING PL/SQL BLOCK:

SET SERVEROUTPUT ON
DECLARE

v_temp CHAR;
v_prj_id varchar2(3);

CURSOR c_emp(v_prjID varchar2) IS SELECT E.name Name, WE.rating Rating FROM work_exp WE, emp E WHERE E.empcode = WE.empcode AND WE.prjid = v_prjID;

BEGIN

v_prj_id := '&v_prj_id';

dbms_output.put_line('Employees working in Project ' || v_prj_id || ' are:');
dbms_output.put_line('*----------*----------*');

FOR i IN c_emp('&v_prjID') LOOP

    dbms_output.put_line('Name of Employee: ' || i.Name);

    dbms_output.put_line('Rating of Employee: ' || i.Rating);

    v_temp := i.Rating;

    dbms_output.put_line('Incentive of Employee: ' || return_incentive(v_temp));

    dbms_output.put_line('*----------*----------*');

END LOOP;


END;
/