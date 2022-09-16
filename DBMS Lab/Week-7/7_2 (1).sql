-- Q.7.2


--PROCEDURE:

CREATE OR REPLACE PROCEDURE human_resources_prj(p_skill IN VARCHAR2, p_skill_experience IN NUMBER) IS

CURSOR c_hr IS SELECT empcode, name, skillname, skillexperience
FROM emp, skill S, emp_skill ES
WHERE empcode = empno AND S.skillid = ES.skillid AND skillexperience >= p_skill_experience AND skillname = p_skill;

BEGIN

dbms_output.put_line('The Human Resources company has for project MARVEL is: ');
dbms_output.put_line('*----------*----------*');

FOR i IN c_hr LOOP

    dbms_output.put_line('Details of Emlpoyee: ' || c_hr%ROWCOUNT);
	dbms_output.put_line(i.empcode);
    dbms_output.put_line(i.name);
    dbms_output.put_line(i.skillname);
    dbms_output.put_line(i.skillexperience);
    dbms_output.put_line('*----------*----------*');

END LOOP;


END human_resources_prj;
/


--INVOKING PL/SQL BLOCK:

SET SERVEROUTPUT ON
DECLARE

v_skill VARCHAR2(10);
v_skill_experience NUMBER;

BEGIN

v_skill := '&v_skill';
v_skill_experience := &v_skill_experience;

human_resources_prj(v_skill, v_skill_experience);

END;
/