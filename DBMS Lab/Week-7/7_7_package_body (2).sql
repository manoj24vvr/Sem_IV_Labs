-- Q.7.7(PACKAGE BODY)



CREATE OR REPLACE PACKAGE BODY package_Lab_7_Q7 IS


-- (i)
FUNCTION name_boss(v_empcode IN number) RETURN VARCHAR2 IS 

v_boss VARCHAR2(20);

BEGIN

	SELECT E2.name INTO v_boss FROM emp E1, emp E2 WHERE E1.reports_to = E2.empcode AND E1.empcode = v_empcode;

	RETURN v_boss;

END name_boss;


-- (ii)
PROCEDURE employees_prj(v_prjid IN VARCHAR2) IS

CURSOR c_emp IS SELECT E.name Name FROM prj_details P, work_exp W, emp E WHERE E.empcode = P.lead_by_empcode AND W.prjid = P.prjid AND P.prjid = v_prjid;

BEGIN

	dbms_output.put_line('The Names of Employees in project ' || v_prjid || ' are:');
	dbms_output.put_line(' ');

	FOR i IN c_emp LOOP

		dbms_output.put_line(i.name);

	END LOOP;

END employees_prj;


-- (iii)
PROCEDURE prj_name_date(v_date_prj IN date) IS

v_prj_name VARCHAR2(10);

BEGIN

	dbms_output.put_line('Name of the Project started from ' || v_date_prj || ' is:');
	
	--SELECT prj_name FROM prj_details WHERE start_date = v_date_prj;

	SELECT prj_name INTO v_prj_name FROM prj_details WHERE start_date = v_date_prj;

	dbms_output.put_line(v_prj_name);


END prj_name_date;


-- (iv)
PROCEDURE employees_skill IS

CURSOR c_emp_skill IS SELECT empcode, name, skillname, skill_experience FROM emp E, emp_skill ES, skill S WHERE empcode = ES.empno AND ES.skillid = S.skillid;

BEGIN

	dbms_output.put_line('Details of Work Force: ');
	dbms_output.put_line('*----------*----------*');

	FOR i IN c_emp_skill LOOP

		dbms_output.put_line('Employee Code: ' || i.empcode);
		dbms_output.put_line('Employee Name: ' || i.name);
		dbms_output.put_line('Skill Name' || i.skillname);
		dbms_output.put_line('Skill Experience(In Months)' || i.skillexperience);

		dbms_output.put_line('*----------*----------*');

	END LOOP;	


END employees_skill;


-- (v)
FUNCTION no_of_employees RETURN BOOLEAN IS

CURSOR c_desgn_count IS SELECT COUNT(DISTINCT empcode) No_of_emp_designation, designation FROM emp GROUP BY designation;

BEGIN

	dbms_output.put_line('No. of Employees in each Designation: ');
	dbms_output.put_line('*----------*----------*');

	FOR i IN c_desgn_count LOOP

		dbms_output.put_line('Employee Designation: ' || i.designation);

		dbms_output.put_line('No of Employees: ' || i.No_of_emp_designation);

		dbms_output.put_line('*----------*----------*');

	END LOOP;

	RETURN TRUE;

END no_of_employees;


END package_Lab_7_Q7;
/