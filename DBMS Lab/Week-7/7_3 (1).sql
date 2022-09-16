-- Q.7.3

SET SERVEROUTPUT ON
DECLARE

v_project_id varchar2(2);
--v_add_Bud_needed number := 0;
v_add_Bud_needed number;
v_name emp.name%type;
v_name_boss emp.name%type;
v_email_boss emp.email%type;


BEGIN

v_project_id := '&v_project_id';

SELECT name INTO v_name FROM emp, prj_details WHERE empcode = lead_by_empcode AND TRIM(prjid) = v_project_id;

SELECT E2.name,E2.email INTO v_name_boss,v_email_boss  FROM emp E1, emp E2, prj_details P WHERE P.lead_by_empcode = E1.empcode AND E1.empcode = E2.reports_to AND TRIM(prjid) = v_project_id;

Add_Bud_Caln(v_project_id, v_add_Bud_needed);

dbms_output.put_line('Name of Project Leader: ' || v_name);
dbms_output.put_line('Name of Employee to whom Project leader reports to: ' || v_name_boss);
dbms_output.put_line('Email of Employee to whom Project leader reports to: ' || v_email_boss);
dbms_output.put_line('Additional Budget Needed: ' || ROUND(v_add_Bud_needed,2));

--dbms_output.put_line('Additional Budget Needed: ' || v_add_Bud_needed);


END;
/



/*

SELECT name INTO v_name FROM emp, prj_details WHERE empcode = lead_by_empcode AND prjid = v_project_id;


THIS STATEMENT NOT WORKING(NOT GIVING ERRORS BUT SAYS NO DATA RETREIVED)

BECAUSE prjid IS DECLARED char(3) IN prj_details TABLE AND v_project_id IS varchar2(2) IN PL/SQL BLOCK 

1 char AT THE END WILL BE FILLED WITH SPACE BY DEFAULT BY ORACLE SOFTWARE

*/