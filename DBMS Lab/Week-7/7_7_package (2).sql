-- Q.7.7(PACKAGE)


CREATE OR REPLACE PACKAGE package_Lab_7_Q7 IS

FUNCTION name_boss(v_empcode IN number) RETURN VARCHAR2;

PROCEDURE employees_prj(v_prjid IN VARCHAR2);

PROCEDURE prj_name_date(v_date_prj IN date);

PROCEDURE employees_skill;

FUNCTION no_of_employees RETURN BOOLEAN;


END package_Lab_7_Q7;
/

/*


LINE/COL ERROR
-------- -----------------------------------------------------------------
61/1     PL/SQL: SQL Statement ignored
61/34    PL/SQL: ORA-00904: "SKILL_EXPERIENCE": invalid identifier
73/1     PLS-00428: an INTO clause is expected in this SELECT statement
SQL>


*/