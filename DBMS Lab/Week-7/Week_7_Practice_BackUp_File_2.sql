SQL> SET SERVEROUTPUT ON
SQL> CREATE OR REPLACE FUNCTION clients_phCode(v_ph_code IN VARCHAR2) RETURN NUMBER IS
  2  v_name_client VARCHAR2(20);
  3  v_temp NUMBER := 1;
  4  
  5  CURSOR c_client_names IS SELECT name FROM client WHERE phone LIKE 'v_ph_code%';
  6  
  7  BEGIN
  8  
  9  dbms_output.put_line('The Names of clients with phone code ' || v_ph_code || ' are: ');
 10  
 11  FOR i IN c_client_names LOOP
 12  
 13  dbms_output.put_line(i.name);
 14  
 15  END LOOP;
 16  
 17  RETURN v_temp;
 18  --RETURN TRUE;
 19  
 20  END clients_phCode;
 21  /

Function created.

SQL> select * from client;

CLI NAME       PHONE          EMAIL                                             
--- ---------- -------------- --------------------                              
c1  ABC        +48-87489389   aaa@abc.com                                       
c2  LTS        +91-78389397   bbb@lts.com                                       
c3  RK         +44-678389397  ccc@rk.com                                        
c4  MMA        +31-77839093   ddd@mma.com                                       
c5  AKS        +81-66822903   eee@aks.com                                       
c6  GKS        +81-75628982   fff@gks.com                                       
c7  B&B        +91-64839839   ggg@bb.com                                        
c8  ABT        +91-67554667                                                     
c9  XYZ                       xyz@bb.com                                        

9 rows selected.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_phone_code VARCHAR2(3);
  4  v_temp NUMBER;
  5  
  6  BEGIN
  7  
  8  v_phone_code := '&v_phone_code';
  9  
 10  v_temp := clients_phCode(v_phone_code);
 11  
 12  dbms_output.put_line('The process was Successful or Not: ' || v_temp);
 13  
 14  
 15  END;
 16  /
Enter value for v_phone_code: +91
old   8: v_phone_code := '&v_phone_code';
new   8: v_phone_code := '+91';
The Names of clients with phone code +91 are:                                   
The process was Successful or Not: 1                                            

PL/SQL procedure successfully completed.

SQL>  SELECT name FROM client WHERE phone LIKE 'v_ph_code%';

no rows selected

SQL>  SELECT name FROM client WHERE phone LIKE '+91%';

NAME                                                                            
----------                                                                      
LTS                                                                             
B&B                                                                             
ABT                                                                             

SQL> CREATE OR REPLACE FUNCTION clients_phCode(v_ph_code IN VARCHAR2) RETURN NUMBER IS
  2  --v_name_client VARCHAR2(20);
  3  v_temp NUMBER := 1;
  4  
  5  CURSOR c_client_names IS SELECT name FROM client WHERE phone LIKE '+91%';
  6  
  7  BEGIN
  8  
  9  dbms_output.put_line('The Names of clients with phone code ' || v_ph_code || ' are: ');
 10  
 11  FOR i IN c_client_names LOOP
 12  
 13  dbms_output.put_line(i.name);
 14  
 15  END LOOP;
 16  
 17  RETURN v_temp;
 18  --RETURN TRUE;
 19  
 20  END clients_phCode;
 21  /

Function created.

SQL> :v_temp := clients_phCode(v_phone_code);
SP2-0734: unknown command beginning ":v_temp :=..." - rest of line ignored.
SQL> clients_phCode(v_phone_code);
SP2-0734: unknown command beginning "clients_ph..." - rest of line ignored.
SQL> SELECT name FROM client WHERE phone LIKE '+91'%;
SELECT name FROM client WHERE phone LIKE '+91'%
                                              *
ERROR at line 1:
ORA-00911: invalid character 


SQL> SELECT name FROM client WHERE phone LIKE '+91%';

NAME                                                                            
----------                                                                      
LTS                                                                             
B&B                                                                             
ABT                                                                             

SQL> CREATE OR REPLACE FUNCTION clients_phCode(v_ph_code IN VARCHAR2) RETURN NUMBER IS
  2  v_temp NUMBER := 1;
  3  
  4  CURSOR c_client_names IS SELECT name FROM client WHERE phone LIKE concat(v_ph_code, '%');
  5  
  6  BEGIN
  7  
  8  dbms_output.put_line('The Names of clients with phone code ' || v_ph_code || ' are: ');
  9  
 10  FOR i IN c_client_names LOOP
 11  
 12  dbms_output.put_line(i.name);
 13  
 14  END LOOP;
 15  
 16  RETURN v_temp;
 17  --RETURN TRUE;
 18  
 19  END clients_phCode;
 20  /

Function created.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_phone_code VARCHAR2(3);
  4  v_temp NUMBER;
  5  
  6  BEGIN
  7  
  8  v_phone_code := '&v_phone_code';
  9  
 10  v_temp := clients_phCode(v_phone_code);
 11  
 12  dbms_output.put_line('The process was Successful or Not: ' || v_temp);
 13  
 14  
 15  END;
 16  /
Enter value for v_phone_code: +91
old   8: v_phone_code := '&v_phone_code';
new   8: v_phone_code := '+91';
The Names of clients with phone code +91 are:                                   
LTS                                                                             
B&B                                                                             
ABT                                                                             
The process was Successful or Not: 1                                            

PL/SQL procedure successfully completed.

SQL> spool off;
SQL> select * from client;

CLI NAME       PHONE          EMAIL                                             
--- ---------- -------------- --------------------                              
c1  ABC        +48-87489389   aaa@abc.com                                       
c2  LTS        +91-78389397   bbb@lts.com                                       
c3  RK         +44-678389397  ccc@rk.com                                        
c4  MMA        +31-77839093   ddd@mma.com                                       
c5  AKS        +81-66822903   eee@aks.com                                       
c6  GKS        +81-75628982   fff@gks.com                                       
c7  B&B        +91-64839839   ggg@bb.com                                        
c8  ABT        +91-67554667                                                     
c9  XYZ                       xyz@bb.com                                        

9 rows selected.

SQL> CREATE OR REPLACE PROCEDURE human_resources_prj(p_skill IN VARCHAR2, p_skill_experience IN NUMBER) IS
  2  
  3  CURSOR c_hr IS SELECT empcode, name, skillname, skill_experience
  4  FROM emp, skill S, skill_experience SE
  5  WHERE empcode = empno AND S.skillid = ES.skillid AND skill_experience >= p_skill_experience AND skillname = p_skill ;
  6  
  7  BEGIN
  8  
  9  dbms_output.put_line('The Human Resources company has for project MARVEL is: ');
 10  
 11  FOR i IN c_hr LOOP
 12  
 13  dbms_output.put_line(i.empcode);
 14      dbms_output.put_line(i.name);
 15      dbms_output.put_line(i.skillname);
 16      dbms_output.put_line(i.skill_experience);
 17  
 18  END LOOP;
 19  
 20  
 21  END human_resources_prj;
 22  /

Warning: Procedure created with compilation errors.

SQL> show errors procedure human_resources_prj;
Errors for PROCEDURE HUMAN_RESOURCES_PRJ:

LINE/COL ERROR                                                                  
-------- -----------------------------------------------------------------      
3/16     PL/SQL: SQL Statement ignored                                          
4/20     PL/SQL: ORA-00942: table or view does not exist                        
13/1     PL/SQL: Statement ignored                                              
13/22    PLS-00364: loop index variable 'I' use is invalid                      
14/5     PL/SQL: Statement ignored                                              
14/26    PLS-00364: loop index variable 'I' use is invalid                      
15/5     PL/SQL: Statement ignored                                              
15/26    PLS-00364: loop index variable 'I' use is invalid                      
16/5     PL/SQL: Statement ignored                                              
16/26    PLS-00364: loop index variable 'I' use is invalid                      
SQL> CREATE OR REPLACE PROCEDURE human_resources_prj(p_skill IN VARCHAR2, p_skill_experience IN NUMBER) IS
  2  
  3  CURSOR c_hr IS SELECT empcode, name, skillname, skill_experience
  4  FROM emp, skill S, emp_skill ES
  5  WHERE empcode = empno AND S.skillid = ES.skillid AND skill_experience >= p_skill_experience AND skillname = p_skill ;
  6  
  7  BEGIN
  8  
  9  dbms_output.put_line('The Human Resources company has for project MARVEL is: ');
 10  
 11  FOR i IN c_hr LOOP
 12  
 13  dbms_output.put_line(i.empcode);
 14      dbms_output.put_line(i.name);
 15      dbms_output.put_line(i.skillname);
 16      dbms_output.put_line(i.skill_experience);
 17  
 18  END LOOP;
 19  
 20  
 21  END human_resources_prj;
 22  /

Warning: Procedure created with compilation errors.

SQL> show errors procedure human_resources_prj;
Errors for PROCEDURE HUMAN_RESOURCES_PRJ:

LINE/COL ERROR                                                                  
-------- -----------------------------------------------------------------      
3/16     PL/SQL: SQL Statement ignored                                          
5/54     PL/SQL: ORA-00904: "SKILL_EXPERIENCE": invalid identifier              
13/1     PL/SQL: Statement ignored                                              
13/22    PLS-00364: loop index variable 'I' use is invalid                      
14/5     PL/SQL: Statement ignored                                              
14/26    PLS-00364: loop index variable 'I' use is invalid                      
15/5     PL/SQL: Statement ignored                                              
15/26    PLS-00364: loop index variable 'I' use is invalid                      
16/5     PL/SQL: Statement ignored                                              
16/26    PLS-00364: loop index variable 'I' use is invalid                      
SQL> select * from emp_skill;

     EMPNO SKI SKILLEXPERIENCE                                                  
---------- --- ---------------                                                  
       100 S3               10                                                  
       102 S4               18                                                  
       110 S6               20                                                  
       106 S2               10                                                  
       106 S6               12                                                  
       106 S8               10                                                  
       108 S9                5                                                  
       108 S6               18                                                  
       105 S7               12                                                  
       105 S10              11                                                  

10 rows selected.

SQL> CREATE OR REPLACE PROCEDURE human_resources_prj(p_skill IN VARCHAR2, p_skill_experience IN NUMBER) IS
  2  
  3  CURSOR c_hr IS SELECT empcode, name, skillname, skillexperience
  4  FROM emp, skill S, emp_skill ES
  5  WHERE empcode = empno AND S.skillid = ES.skillid AND skillexperience >= p_skill_experience AND skillname = p_skill ;
  6  
  7  BEGIN
  8  
  9  dbms_output.put_line('The Human Resources company has for project MARVEL is: ');
 10  
 11  FOR i IN c_hr LOOP
 12  
 13  dbms_output.put_line(i.empcode);
 14      dbms_output.put_line(i.name);
 15      dbms_output.put_line(i.skillname);
 16      dbms_output.put_line(i.skillexperience);
 17  
 18  END LOOP;
 19  
 20  
 21  END human_resources_prj;
 22  /

Procedure created.

SQL>  select * from emp_skill;

     EMPNO SKI SKILLEXPERIENCE                                                  
---------- --- ---------------                                                  
       100 S3               10                                                  
       102 S4               18                                                  
       110 S6               20                                                  
       106 S2               10                                                  
       106 S6               12                                                  
       106 S8               10                                                  
       108 S9                5                                                  
       108 S6               18                                                  
       105 S7               12                                                  
       105 S10              11                                                  

10 rows selected.

SQL>  select * from skill;

SKI SKILLNAME                                                                   
--- --------------------                                                        
S2  PYTHON                                                                      
S3  JAVA                                                                        
S4  C++                                                                         
S6  ORACLE                                                                      
S7  ANDROID                                                                     
S8  AZURE                                                                       
S9  DOT_NET                                                                     
S10 IOS                                                                         

8 rows selected.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_skill VARCHAR2(10);
  4  v_skill_experience NUMBER;
  5  
  6  
  7  BEGIN
  8  
  9  v_skill := '&v_skill';
 10  v_skill_experience := &v_skill_experience;
 11  
 12  human_resources_prj(v_skill, v_skill_experience);
 13  
 14  END;
 15  /
Enter value for v_skill: ORACLE
old   9: v_skill := '&v_skill';
new   9: v_skill := 'ORACLE';
Enter value for v_skill_experience: 12
old  10: v_skill_experience := &v_skill_experience;
new  10: v_skill_experience := 12;
The Human Resources company has for project MARVEL is:                          
108                                                                             
AJAY                                                                            
ORACLE                                                                          
18                                                                              
110                                                                             
BHASKAR                                                                         
ORACLE                                                                          
20                                                                              
106                                                                             
RAJ                                                                             
ORACLE                                                                          
12                                                                              

PL/SQL procedure successfully completed.

SQL> CREATE OR REPLACE PROCEDURE human_resources_prj(p_skill IN VARCHAR2, p_skill_experience IN NUMBER) IS
  2  
  3  CURSOR c_hr IS SELECT empcode, name, skillname, skillexperience
  4  FROM emp, skill S, emp_skill ES
  5  WHERE empcode = empno AND S.skillid = ES.skillid AND skillexperience >= p_skill_experience AND skillname = p_skill ;
  6  
  7  BEGIN
  8  
  9  dbms_output.put_line('The Human Resources company has for project MARVEL is: ');
 10  
 11  FOR i IN c_hr LOOP
 12  
 13      dbms_output.put_line('Details of Emlpoyee: ' || c_hr%ROWCOUNT);
 14  dbms_output.put_line(i.empcode);
 15      dbms_output.put_line(i.name);
 16      dbms_output.put_line(i.skillname);
 17      dbms_output.put_line(i.skillexperience);
 18      dbms_output.put_line('*----------*----------*');
 19  
 20  END LOOP;
 21  
 22  
 23  END human_resources_prj;
 24  /

Procedure created.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_skill VARCHAR2(10);
  4  v_skill_experience NUMBER;
  5  
  6  
  7  BEGIN
  8  
  9  v_skill := '&v_skill';
 10  v_skill_experience := &v_skill_experience;
 11  
 12  human_resources_prj(v_skill, v_skill_experience);
 13  
 14  END;
 15  /
Enter value for v_skill: ORACLE
old   9: v_skill := '&v_skill';
new   9: v_skill := 'ORACLE';
Enter value for v_skill_experience: 12
old  10: v_skill_experience := &v_skill_experience;
new  10: v_skill_experience := 12;
The Human Resources company has for project MARVEL is:                          
Details of Emlpoyee: 1                                                          
108                                                                             
AJAY                                                                            
ORACLE                                                                          
18                                                                              
*----------*----------*                                                         
Details of Emlpoyee: 2                                                          
110                                                                             
BHASKAR                                                                         
ORACLE                                                                          
20                                                                              
*----------*----------*                                                         
Details of Emlpoyee: 3                                                          
106                                                                             
RAJ                                                                             
ORACLE                                                                          
12                                                                              
*----------*----------*                                                         

PL/SQL procedure successfully completed.

SQL> CREATE OR REPLACE FUNCTION return_incentive(f_rating IN CHAR) RETURN NUMBER IS
  2  f_incentive NUMBER;
  3  
  4  BEGIN
  5  
  6  CASE f_rating
  7  
  8  WHEN 'A' THEN f_incentive := 30000;
  9  WHEN 'B' THEN f_incentive := 20000;
 10  WHEN 'C' THEN f_incentive := 10000;
 11  
 12  END CASE;
 13  
 14  RETURN f_incentive;
 15  
 16  END return_incentive;
 17  /

Function created.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_temp CHAR;
  4  v_prj_id varchar2(3);
  5  v_incentive number;
  6  
  7  CURSOR c_emp(v_prjID varchar2) IS SELECT E.name Name, WE.rating Rating FROM work_exp WE, emp E WHERE E.empcode = WE.empcode AND WE.prjid = v_prjID;
  8  
  9  BEGIN
 10  
 11  v_prj_id := '&v_prj_id';
 12  
 13  dbms_output.put_line('Employees working in Project ' || v_prj_id || ' are:');
 14  dbms_output.put_line('*----------*----------*');
 15  
 16  FOR i IN c_emp('&v_prjID') LOOP
 17  
 18      dbms_output.put_line('Name of Employee: ' || i.Name);
 19  
 20      dbms_output.put_line('Rating of Employee: ' || i.Rating);
 21  
 22  
 23      v_temp := i.Rating;
 24  
 25      v_incentive := return_incentive(v_temp);
 26  
 27      dbms_output.put_line('Incentive of Employee: ' || v_incentive);
 28  
 29      dbms_output.put_line('*----------*----------*');
 30  
 31  END LOOP;
 32  
 33  END;
 34  /
Enter value for v_prj_id: P1
old  11: v_prj_id := '&v_prj_id';
new  11: v_prj_id := 'P1';
Enter value for v_prjid: P1 
old  16: FOR i IN c_emp('&v_prjID') LOOP
new  16: FOR i IN c_emp('P1 ') LOOP
Employees working in Project P1 are:                                            
*----------*----------*                                                         
Name of Employee: RAJESH                                                        
Rating of Employee: A                                                           
Incentive of Employee: 30000                                                    
*----------*----------*                                                         
Name of Employee: VIJAY                                                         
Rating of Employee: A                                                           
Incentive of Employee: 30000                                                    
*----------*----------*                                                         

PL/SQL procedure successfully completed.

SQL> SPOOL OFF;
SQL> DESC WORK_EXP;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPCODE                                            NUMBER(3)
 PRJID                                              CHAR(3)
 WORK_EXPERIENCE                           NOT NULL NUMBER(2)
 CLIENTID                                           CHAR(3)
 RATING                                             CHAR(1)

SQL> SELECT * FROM WORK_EXP;

   EMPCODE PRJ WORK_EXPERIENCE CLI R                                            
---------- --- --------------- --- -                                            
       100 P1               20 c1  A                                            
       100 P3               15 c3  A                                            
       102 P2               18 c2  B                                            
       102 P1               18 c1  A                                            
       106 P3               20 c3  C                                            
       106 P4               10 c4  C                                            
       105 P2               19 c2  B                                            
       110 P4               12 c4  B                                            
       110 P5               16 c8  A                                            
       105 P5                5 c5  C                                            
       111 P5                5 c5  C                                            

11 rows selected.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_temp CHAR;
  4  v_prj_id varchar2(3);
  5  
  6  CURSOR c_emp(v_prjID varchar2) IS SELECT E.name Name, WE.rating Rating FROM work_exp WE, emp E WHERE E.empcode = WE.empcode AND WE.prjid = v_prjID;
  7  
  8  BEGIN
  9  
 10  v_prj_id := '&v_prj_id';
 11  
 12  dbms_output.put_line('Employees working in Project ' || v_prj_id || ' are:');
 13  dbms_output.put_line('*----------*----------*');
 14  
 15  FOR i IN c_emp('&v_prjID') LOOP
 16  
 17      dbms_output.put_line('Name of Employee: ' || i.Name);
 18  
 19      dbms_output.put_line('Rating of Employee: ' || i.Rating);
 20  
 21      v_temp := i.Rating;
 22  
 23      dbms_output.put_line('Incentive of Employee: ' || return_incentive(v_temp));
 24  
 25      dbms_output.put_line('*----------*----------*');
 26  
 27  END LOOP;
 28  
 29  END;
 30  /
Enter value for v_prj_id: P1
old  10: v_prj_id := '&v_prj_id';
new  10: v_prj_id := 'P1';
Enter value for v_prjid: P1 
old  15: FOR i IN c_emp('&v_prjID') LOOP
new  15: FOR i IN c_emp('P1 ') LOOP
Employees working in Project P1 are:                                            
*----------*----------*                                                         
Name of Employee: RAJESH                                                        
Rating of Employee: A                                                           
Incentive of Employee: 30000                                                    
*----------*----------*                                                         
Name of Employee: VIJAY                                                         
Rating of Employee: A                                                           
Incentive of Employee: 30000                                                    
*----------*----------*                                                         

PL/SQL procedure successfully completed.

SQL> SPOOL OFF;
SQL> CREATE OR REPLACE PACKAGE package_Lab_7_Q7 IS
  2  
  3  FUNCTION name_boss(v_empcode IN number) RETURN VARCHAR2;
  4  
  5  PROCEDURE employees_prj(v_prjid IN VARCHAR2);
  6  
  7  PROCEDURE prj_name_date(v_date_prj IN date);
  8  
  9  PROCEDURE employees_skill;
 10  
 11  FUNCTION no_of_employees;
 12  
 13  
 14  END package_Lab_7_Q7;
 15  
 16  
 17  
 18  
 19  /

Warning: Package created with compilation errors.

SQL> CREATE OR REPLACE PACKAGE package_Lab_7_Q7 IS
  2  
  3  FUNCTION name_boss(v_empcode IN number) RETURN VARCHAR2;
  4  
  5  PROCEDURE employees_prj(v_prjid IN VARCHAR2);
  6  
  7  PROCEDURE prj_name_date(v_date_prj IN date);
  8  
  9  PROCEDURE employees_skill;
 10  
 11  FUNCTION no_of_employees;
 12  
 13  
 14  END package_Lab_7_Q7;
 15  /

Warning: Package created with compilation errors.

SQL> show errors package package_Lab_7_Q7;
Errors for PACKAGE PACKAGE_LAB_7_Q7:

LINE/COL ERROR                                                                  
-------- -----------------------------------------------------------------      
11/25    PLS-00103: Encountered the symbol ";" when expecting one of the        
         following:                                                             
         ( return                                                               
                                                                                
SQL> CREATE OR REPLACE PACKAGE package_Lab_7_Q7 IS
  2  
  3  FUNCTION name_boss(v_empcode IN number) RETURN VARCHAR2;
  4  
  5  PROCEDURE employees_prj(v_prjid IN VARCHAR2);
  6  
  7  PROCEDURE prj_name_date(v_date_prj IN date);
  8  
  9  PROCEDURE employees_skill;
 10  
 11  FUNCTION no_of_employees RETURN BOOLEAN;
 12  
 13  
 14  END package_Lab_7_Q7;
 15  /

Package created.

SQL> CREATE OR REPLACE PACKAGE BODY package_Lab_7_Q7 IS
  2  
  3  
  4  -- (i)
  5  FUNCTION name_boss(v_empcode IN number) RETURN VARCHAR2 IS
  6  
  7  v_boss VARCHAR2(20);
  8  
  9  BEGIN
 10  
 11  SELECT E2.name INTO v_boss FROM emp E1, emp E2 WHERE E1.reports_to = E2.empcode AND E1.empcode = v_empcode;
 12  
 13  RETURN v_boss;
 14  
 15  END name_boss;
 16  
 17  
 18  -- (ii)
 19  PROCEDURE employees_prj(v_prjid IN VARCHAR2) IS
 20  
 21  CURSOR c_emp IS SELECT E.name Name FROM prj_details P, work_exp W, emp E WHERE E.empcode = P.lead_by_empcode AND W.prjid = P.prjid AND P.prjid = v_prjid;
 22  
 23  BEGIN
 24  
 25  dbms_output.put_line('The Names of Employees in project ' || v_prjid || ' are:');
 26  dbms_output.put_line(' ');
 27  
 28  FOR i IN c_emp LOOP
 29  
 30  dbms_output.put_line(i.name);
 31  
 32  END LOOP;
 33  
 34  END employees_prj;
 35  
 36  
 37  -- (iii)
 38  PROCEDURE prj_name_date(v_date_prj IN date) IS
 39  
 40  v_prj_name VARCHAR2(10);
 41  
 42  BEGIN
 43  
 44  dbms_output.put_line('Name of the Project started from ' || v_date_prj || ' is:');
 45  
 46  --SELECT prj_name FROM prj_details WHERE start_date = v_date_prj;
 47  
 48  SELECT prj_name INTO v_prj_name FROM prj_details WHERE start_date = v_date_prj;
 49  dbms_output.put_line(v_prj_name);
 50  
 51  
 52  END prj_name_date;
 53  
 54  
 55  -- (iv)
 56  PROCEDURE employees_skill IS
 57  
 58  
 59  BEGIN
 60  
 61  SELECT empcode, name, skillname, skill_experience FROM emp E, emp_skill ES, skill S WHERE empcode = ES.empno AND ES.skillid = S.skillid;
 62  
 63  
 64  END employees_skill;
 65  
 66  
 67  -- (v)
 68  FUNCTION no_of_employees RETURN BOOLEAN IS
 69  
 70  
 71  BEGIN
 72  
 73  SELECT COUNT(DISTINCT empcode) No_of_emp_designation, designation FROM emp GROUP BY designation;
 74  
 75  
 76  RETURN TRUE;
 77  
 78  END no_of_employees;
 79  
 80  
 81  END package_Lab_7_Q7;
 82  /

Warning: Package Body created with compilation errors.

SQL>  show errors package body package_Lab_7_Q7;
Errors for PACKAGE BODY PACKAGE_LAB_7_Q7:

LINE/COL ERROR                                                                  
-------- -----------------------------------------------------------------      
61/1     PL/SQL: SQL Statement ignored                                          
61/34    PL/SQL: ORA-00904: "SKILL_EXPERIENCE": invalid identifier              
73/1     PLS-00428: an INTO clause is expected in this SELECT statement         
SQL> CREATE OR REPLACE PACKAGE BODY package_Lab_7_Q7 IS
  2  
  3  
  4  -- (i)
  5  FUNCTION name_boss(v_empcode IN number) RETURN VARCHAR2 IS
  6  
  7  v_boss VARCHAR2(20);
  8  
  9  BEGIN
 10  
 11  SELECT E2.name INTO v_boss FROM emp E1, emp E2 WHERE E1.reports_to = E2.empcode AND E1.empcode = v_empcode;
 12  
 13  RETURN v_boss;
 14  
 15  END name_boss;
 16  
 17  
 18  -- (ii)
 19  PROCEDURE employees_prj(v_prjid IN VARCHAR2) IS
 20  
 21  CURSOR c_emp IS SELECT E.name Name FROM prj_details P, work_exp W, emp E WHERE E.empcode = P.lead_by_empcode AND W.prjid = P.prjid AND P.prjid = v_prjid;
 22  
 23  BEGIN
 24  
 25  dbms_output.put_line('The Names of Employees in project ' || v_prjid || ' are:');
 26  dbms_output.put_line(' ');
 27  
 28  FOR i IN c_emp LOOP
 29  
 30  dbms_output.put_line(i.name);
 31  
 32  END LOOP;
 33  
 34  END employees_prj;
 35  
 36  
 37  -- (iii)
 38  PROCEDURE prj_name_date(v_date_prj IN date) IS
 39  
 40  v_prj_name VARCHAR2(10);
 41  
 42  BEGIN
 43  
 44  dbms_output.put_line('Name of the Project started from ' || v_date_prj || ' is:');
 45  
 46  --SELECT prj_name FROM prj_details WHERE start_date = v_date_prj;
 47  
 48  SELECT prj_name INTO v_prj_name FROM prj_details WHERE start_date = v_date_prj;
 49  
 50  dbms_output.put_line(v_prj_name);
 51  
 52  
 53  END prj_name_date;
 54  
 55  
 56  -- (iv)
 57  PROCEDURE employees_skill IS
 58  
 59  CURSOR c_emp_skill IS SELECT empcode, name, skillname, skillexperience FROM emp E, emp_skill ES, skill S WHERE empcode = ES.empno AND ES.skillid = S.skillid;
 60  
 61  BEGIN
 62  
 63  dbms_output.put_line('Details of Work Force: ');
 64  dbms_output.put_line('*----------*----------*');
 65  
 66  FOR i IN c_emp_skill LOOP
 67  
 68  dbms_output.put_line('Employee Code: ' || i.empcode);
 69  dbms_output.put_line('Employee Name: ' || i.name);
 70  dbms_output.put_line('Skill Name' || i.skillname,);
 71  dbms_output.put_line('Skill Experience(In Months)' || i.skillexperience);
 72  
 73  dbms_output.put_line('*----------*----------*');
 74  
 75  END LOOP;
 76  
 77  
 78  END employees_skill;
 79  
 80  
 81  -- (v)
 82  FUNCTION no_of_employees RETURN BOOLEAN IS
 83  
 84  CURSOR c_desgn_count IS SELECT COUNT(DISTINCT empcode) No_of_emp_designation, designation FROM emp GROUP BY designation;
 85  
 86  BEGIN
 87  
 88  dbms_output.put_line('No. of Employees in each Designation: ');
 89  dbms_output.put_line('*----------*----------*');
 90  
 91  FOR i IN c_desgn_count LOOP
 92  
 93  dbms_output.put_line('Employee Designation: ' || i.designation);
 94  
 95  dbms_output.put_line('No of Employees: ' || i.No_of_emp_designation);
 96  
 97  dbms_output.put_line('*----------*----------*');
 98  
 99  END LOOP;
100  
101  RETURN TRUE;
102  
103  END no_of_employees;
104  
105  
106  END package_Lab_7_Q7;
107  /

Warning: Package Body created with compilation errors.

SQL> show errors package body package_Lab_7_Q7;
Errors for PACKAGE BODY PACKAGE_LAB_7_Q7:

LINE/COL ERROR                                                                  
-------- -----------------------------------------------------------------      
70/50    PLS-00103: Encountered the symbol ")" when expecting one of the        
         following:                                                             
         ( - + case for mod new not null <an identifier>                        
         <a double-quoted delimited-identifier> <a bind variable>               
         continue avg count current exists max min prior sql stddev             
         sum variance execute forall merge standard time timestamp              
         interval date                                                          
         <a string literal with character set specification>                    
         <a number> <a single-quoted SQL string> pipe                           
         <an alternatively-quoted string literal with character set             
         specification>                                                         

LINE/COL ERROR                                                                  
-------- -----------------------------------------------------------------      
         <                                                                      
                                                                                
SQL> CREATE OR REPLACE PACKAGE BODY package_Lab_7_Q7 IS
  2  
  3  
  4  -- (i)
  5  FUNCTION name_boss(v_empcode IN number) RETURN VARCHAR2 IS
  6  
  7  v_boss VARCHAR2(20);
  8  
  9  BEGIN
 10  
 11  SELECT E2.name INTO v_boss FROM emp E1, emp E2 WHERE E1.reports_to = E2.empcode AND E1.empcode = v_empcode;
 12  
 13  RETURN v_boss;
 14  
 15  END name_boss;
 16  
 17  
 18  -- (ii)
 19  PROCEDURE employees_prj(v_prjid IN VARCHAR2) IS
 20  
 21  CURSOR c_emp IS SELECT E.name Name FROM prj_details P, work_exp W, emp E WHERE E.empcode = P.lead_by_empcode AND W.prjid = P.prjid AND P.prjid = v_prjid;
 22  
 23  BEGIN
 24  
 25  dbms_output.put_line('The Names of Employees in project ' || v_prjid || ' are:');
 26  dbms_output.put_line(' ');
 27  
 28  FOR i IN c_emp LOOP
 29  
 30  dbms_output.put_line(i.name);
 31  
 32  END LOOP;
 33  
 34  END employees_prj;
 35  
 36  
 37  -- (iii)
 38  PROCEDURE prj_name_date(v_date_prj IN date) IS
 39  
 40  v_prj_name VARCHAR2(10);
 41  
 42  BEGIN
 43  
 44  dbms_output.put_line('Name of the Project started from ' || v_date_prj || ' is:');
 45  
 46  --SELECT prj_name FROM prj_details WHERE start_date = v_date_prj;
 47  
 48  SELECT prj_name INTO v_prj_name FROM prj_details WHERE start_date = v_date_prj;
 49  
 50  dbms_output.put_line(v_prj_name);
 51  
 52  
 53  END prj_name_date;
 54  
 55  
 56  -- (iv)
 57  PROCEDURE employees_skill IS
 58  
 59  CURSOR c_emp_skill IS SELECT empcode, name, skillname, skillexperience FROM emp E, emp_skill ES, skill S WHERE empcode = ES.empno AND ES.skillid = S.skillid;
 60  
 61  BEGIN
 62  
 63  dbms_output.put_line('Details of Work Force: ');
 64  dbms_output.put_line('*----------*----------*');
 65  
 66  FOR i IN c_emp_skill LOOP
 67  
 68  dbms_output.put_line('Employee Code: ' || i.empcode);
 69  dbms_output.put_line('Employee Name: ' || i.name);
 70  dbms_output.put_line('Skill Name' || i.skillname);
 71  dbms_output.put_line('Skill Experience(In Months)' || i.skillexperience);
 72  
 73  dbms_output.put_line('*----------*----------*');
 74  
 75  END LOOP;
 76  
 77  
 78  END employees_skill;
 79  
 80  
 81  -- (v)
 82  FUNCTION no_of_employees RETURN BOOLEAN IS
 83  
 84  CURSOR c_desgn_count IS SELECT COUNT(DISTINCT empcode) No_of_emp_designation, designation FROM emp GROUP BY designation;
 85  
 86  BEGIN
 87  
 88  dbms_output.put_line('No. of Employees in each Designation: ');
 89  dbms_output.put_line('*----------*----------*');
 90  
 91  FOR i IN c_desgn_count LOOP
 92  
 93  dbms_output.put_line('Employee Designation: ' || i.designation);
 94  
 95  dbms_output.put_line('No of Employees: ' || i.No_of_emp_designation);
 96  
 97  dbms_output.put_line('*----------*----------*');
 98  
 99  END LOOP;
100  
101  RETURN TRUE;
102  
103  END no_of_employees;
104  
105  
106  END package_Lab_7_Q7;
107  /

Package body created.

SQL> select prj_name, start_date from prj_details;

PRJ_NAME   START_DAT                                                            
---------- ---------                                                            
SPYDER     10-JAN-20                                                            
APOLLO     01-JAN-19                                                            
UNICORN    03-SEP-21                                                            
ZEUS       28-FEB-20                                                            
JUPITOR    07-AUG-18                                                            
MARS       21-FEB-20                                                            
XXX        01-JAN-18                                                            

7 rows selected.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  --(i)
 15  v_empno := 100;
 16  v_boss_name := name_boss(v_empno);
 17  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 18  
 19  --(ii)
 20  v_prjID := 'P1 ';
 21  employees_prj(v_prjID);
 22  
 23  --(iii)
 24  v_date := '10-JAN-20';
 25  
 26  --(iv)
 27  employees_skill
 28  
 29  --(v)
 30  v_temp := no_of_employees;
 31  dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || v_temp);
 32  
 33  
 34  END;
 35  /
v_temp := no_of_employees;
*
ERROR at line 30:
ORA-06550: line 30, column 1: 
PLS-00103: Encountered the symbol "V_TEMP" when expecting one of the following: 
:= . ( @ % ; 
The symbol "." was substituted for "V_TEMP" to continue. 


SQL> -- Q.7.7(INVOKING FUNCTION)
SQL> 
SQL> 
SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  --(i)
 15  v_empno := 100;
 16  v_boss_name := name_boss(v_empno);
 17  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 18  
 19  --(ii)
 20  v_prjID := 'P1 ';
 21  employees_prj(v_prjID);
 22  
 23  --(iii)
 24  v_date := '10-JAN-20';
 25  
 26  --(iv)
 27  employees_skill
 28  
 29  --(v)
 30  
 31  v_temp := no_of_employees;
 32  dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || v_temp);
 33  
 34  
 35  END;
 36  /
v_temp := no_of_employees;
*
ERROR at line 31:
ORA-06550: line 31, column 1: 
PLS-00103: Encountered the symbol "V_TEMP" when expecting one of the following: 
:= . ( @ % ; 
The symbol "." was substituted for "V_TEMP" to continue. 


SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  --(i)
 15  v_empno := 100;
 16  v_boss_name := name_boss(v_empno);
 17  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 18  
 19  --(ii)
 20  v_prjID := 'P1 ';
 21  employees_prj(v_prjID);
 22  
 23  --(iii)
 24  v_date := '10-JAN-20';
 25  
 26  --(iv)
 27  employees_skill
 28  
 29  --(v)
 30  
 31  v_temp := no_of_employees;
 32  dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || v_temp);
 33  
 34  
 35  END;
 36  /
v_temp := no_of_employees;
*
ERROR at line 31:
ORA-06550: line 31, column 1: 
PLS-00103: Encountered the symbol "V_TEMP" when expecting one of the following: 
:= . ( @ % ; 
The symbol "." was substituted for "V_TEMP" to continue. 


SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  --(i)
 15  v_empno := 100;
 16  v_boss_name := name_boss(v_empno);
 17  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 18  
 19  --(ii)
 20  v_prjID := 'P1 ';
 21  employees_prj(v_prjID);
 22  
 23  --(iii)
 24  v_date := '10-JAN-20';
 25  
 26  --(iv)
 27  employees_skill
 28  
 29  --(v)
 30  
 31  --v_temp := no_of_employees;
 32  --dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || v_temp);
 33  
 34  
 35  END;
 36  /
END;
*
ERROR at line 35:
ORA-06550: line 35, column 1: 
PLS-00103: Encountered the symbol "END" when expecting one of the following: 
:= . ( @ % ; 
The symbol ";" was substituted for "END" to continue. 


SQL> var v_empno number;
SQL> :v_empno := 100;
SP2-0734: unknown command beginning ":v_empno :..." - rest of line ignored.
SQL> v_empno := 100;
SP2-0734: unknown command beginning "v_empno :=..." - rest of line ignored.
SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  --(i)
 15  v_empno := 100;
 16  v_boss_name := name_boss(v_empno);
 17  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 18  /*
 19  --(ii)
 20  v_prjID := 'P1 ';
 21  employees_prj(v_prjID);
 22  
 23  --(iii)
 24  v_date := '10-JAN-20';
 25  
 26  --(iv)
 27  employees_skill
 28  
 29  --(v)
 30  
 31  --v_temp := no_of_employees;
 32  --dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || v_temp);
 33  
 34  */
 35  END;
 36  /
v_boss_name := name_boss(v_empno);
               *
ERROR at line 16:
ORA-06550: line 16, column 16: 
PLS-00201: identifier 'NAME_BOSS' must be declared 
ORA-06550: line 16, column 1: 
PL/SQL: Statement ignored 


SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  --(i)
 15  v_empno := 100;
 16  v_boss_name := package_Lab_7_Q7.name_boss(v_empno);
 17  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 18  
 19  --(ii)
 20  v_prjID := 'P1 ';
 21  package_Lab_7_Q7.employees_prj(v_prjID);
 22  
 23  --(iii)
 24  v_date := '10-JAN-20';
 25  package_Lab_7_Q7.prj_name_date(v_date);
 26  
 27  --(iv)
 28  package_Lab_7_Q7.employees_skill
 29  
 30  --(v)
 31  
 32  --v_temp := package_Lab_7_Q7.no_of_employees;
 33  --dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || v_temp);
 34  
 35  
 36  END;
 37  /
END;
*
ERROR at line 36:
ORA-06550: line 36, column 1: 
PLS-00103: Encountered the symbol "END" when expecting one of the following: 
:= . ( @ % ; 
The symbol ";" was substituted for "END" to continue. 


SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  --(i)
 15  v_empno := 100;
 16  v_boss_name := package_Lab_7_Q7.name_boss(v_empno);
 17  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 18  /*
 19  --(ii)
 20  v_prjID := 'P1 ';
 21  package_Lab_7_Q7.employees_prj(v_prjID);
 22  
 23  --(iii)
 24  v_date := '10-JAN-20';
 25  package_Lab_7_Q7.prj_name_date(v_date);
 26  
 27  --(iv)
 28  package_Lab_7_Q7.employees_skill
 29  
 30  --(v)
 31  
 32  --v_temp := package_Lab_7_Q7.no_of_employees;
 33  --dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || v_temp);
 34  
 35  */
 36  END;
 37  /
DECLARE
*
ERROR at line 1:
ORA-01403: no data found 
ORA-06512: at "SYSTEM.PACKAGE_LAB_7_Q7", line 11 
ORA-06512: at line 16 


SQL> select empcode, reports_to from emp
  2  ;

   EMPCODE REPORTS_TO                                                           
---------- ----------                                                           
       100                                                                      
       102        110                                                           
       108        102                                                           
       110        106                                                           
       106                                                                      
       105                                                                      
       107                                                                      
       103                                                                      
       104                                                                      
       109                                                                      
       112                                                                      

   EMPCODE REPORTS_TO                                                           
---------- ----------                                                           
       111                                                                      

12 rows selected.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  --(i)
 15  v_empno := 102;
 16  v_boss_name := package_Lab_7_Q7.name_boss(v_empno);
 17  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 18  /*
 19  --(ii)
 20  v_prjID := 'P1 ';
 21  package_Lab_7_Q7.employees_prj(v_prjID);
 22  
 23  --(iii)
 24  v_date := '10-JAN-20';
 25  package_Lab_7_Q7.prj_name_date(v_date);
 26  
 27  --(iv)
 28  package_Lab_7_Q7.employees_skill
 29  
 30  --(v)
 31  
 32  --v_temp := package_Lab_7_Q7.no_of_employees;
 33  --dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || v_temp);
 34  
 35  */
 36  END;
 37  /
Boss Name of 102 is: BHASKAR                                                    

PL/SQL procedure successfully completed.

SQL> select name from emp where empcode = 110;

NAME                                                                            
----------                                                                      
BHASKAR                                                                         

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  /*
 15  --(i)
 16  v_empno := 102;
 17  v_boss_name := package_Lab_7_Q7.name_boss(v_empno);
 18  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 19  */
 20  
 21  --(ii)
 22  v_prjID := 'P1 ';
 23  package_Lab_7_Q7.employees_prj(v_prjID);
 24  
 25  /*
 26  --(iii)
 27  v_date := '10-JAN-20';
 28  package_Lab_7_Q7.prj_name_date(v_date);
 29  
 30  --(iv)
 31  package_Lab_7_Q7.employees_skill
 32  
 33  --(v)
 34  
 35  --v_temp := package_Lab_7_Q7.no_of_employees;
 36  --dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || v_temp);
 37  
 38  */
 39  END;
 40  /
The Names of Employees in project P1  are:                                      
VIJAY                                                                           
VIJAY                                                                           

PL/SQL procedure successfully completed.

SQL> -- Q.7.7(INVOKING FUNCTION)
SQL> 
SQL> 
SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  /*
 15  --(i)
 16  v_empno := 102;
 17  v_boss_name := package_Lab_7_Q7.name_boss(v_empno);
 18  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 19  */
 20  
 21  --(ii)
 22  v_prjID := 'P2 ';
 23  package_Lab_7_Q7.employees_prj(v_prjID);
 24  
 25  /*
 26  --(iii)
 27  v_date := '10-JAN-20';
 28  package_Lab_7_Q7.prj_name_date(v_date);
 29  
 30  --(iv)
 31  package_Lab_7_Q7.employees_skill
 32  
 33  --(v)
 34  
 35  --v_temp := package_Lab_7_Q7.no_of_employees;
 36  --dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || v_temp);
 37  
 38  */
 39  END;
 40  /
The Names of Employees in project P2  are:                                      
AJAY                                                                            
AJAY                                                                            

PL/SQL procedure successfully completed.

SQL> -- Q.7.7(INVOKING FUNCTION)
SQL> 
SQL> 
SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  /*
 15  
 16  --(i)
 17  v_empno := 102;
 18  v_boss_name := package_Lab_7_Q7.name_boss(v_empno);
 19  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 20  
 21  
 22  --(ii)
 23  v_prjID := 'P2 ';
 24  package_Lab_7_Q7.employees_prj(v_prjID);
 25  
 26  */
 27  --(iii)
 28  v_date := '10-JAN-20';
 29  package_Lab_7_Q7.prj_name_date(v_date);
 30  
 31  /*
 32  --(iv)
 33  package_Lab_7_Q7.employees_skill
 34  
 35  --(v)
 36  
 37  --v_temp := package_Lab_7_Q7.no_of_employees;
 38  --dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || v_temp);
 39  
 40  */
 41  END;
 42  /
Name of the Project started from 10-JAN-20 is:                                  
SPYDER                                                                          

PL/SQL procedure successfully completed.

SQL> -- Q.7.7(INVOKING FUNCTION)
SQL> 
SQL> 
SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  /*
 15  
 16  --(i)
 17  v_empno := 102;
 18  v_boss_name := package_Lab_7_Q7.name_boss(v_empno);
 19  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 20  
 21  
 22  --(ii)
 23  v_prjID := 'P2 ';
 24  package_Lab_7_Q7.employees_prj(v_prjID);
 25  
 26  
 27  --(iii)
 28  v_date := '10-JAN-20';
 29  package_Lab_7_Q7.prj_name_date(v_date);
 30  
 31  */
 32  
 33  --(iv)
 34  package_Lab_7_Q7.employees_skill
 35  
 36  --(v)
 37  
 38  --v_temp := package_Lab_7_Q7.no_of_employees;
 39  --dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || v_temp);
 40  
 41  */
 42  END;
 43  /
*/
*
ERROR at line 41:
ORA-06550: line 41, column 1: 
PLS-00103: Encountered the symbol "*" when expecting one of the following: 
:= . ( @ % ; 


SQL> -- Q.7.7(INVOKING FUNCTION)
SQL> 
SQL> 
SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  /*
 15  
 16  --(i)
 17  v_empno := 102;
 18  v_boss_name := package_Lab_7_Q7.name_boss(v_empno);
 19  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 20  
 21  
 22  --(ii)
 23  v_prjID := 'P2 ';
 24  package_Lab_7_Q7.employees_prj(v_prjID);
 25  
 26  
 27  --(iii)
 28  v_date := '10-JAN-20';
 29  package_Lab_7_Q7.prj_name_date(v_date);
 30  
 31  */
 32  
 33  --(iv)
 34  package_Lab_7_Q7.employees_skill
 35  
 36  /*
 37  --(v)
 38  
 39  --v_temp := package_Lab_7_Q7.no_of_employees;
 40  --dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || v_temp);
 41  
 42  */
 43  END;
 44  /
END;
*
ERROR at line 43:
ORA-06550: line 43, column 1: 
PLS-00103: Encountered the symbol "END" when expecting one of the following: 
:= . ( @ % ; 
The symbol ";" was substituted for "END" to continue. 


SQL> -- Q.7.7(INVOKING FUNCTION)
SQL> 
SQL> 
SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  /*
 15  
 16  --(i)
 17  v_empno := 102;
 18  v_boss_name := package_Lab_7_Q7.name_boss(v_empno);
 19  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 20  
 21  
 22  --(ii)
 23  v_prjID := 'P2 ';
 24  package_Lab_7_Q7.employees_prj(v_prjID);
 25  
 26  
 27  --(iii)
 28  v_date := '10-JAN-20';
 29  package_Lab_7_Q7.prj_name_date(v_date);
 30  
 31  */
 32  
 33  --(iv)
 34  package_Lab_7_Q7.employees_skill;
 35  
 36  /*
 37  --(v)
 38  
 39  --v_temp := package_Lab_7_Q7.no_of_employees;
 40  --dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || v_temp);
 41  
 42  */
 43  
 44  END;
 45  /
Details of Work Force:                                                          
*----------*----------*                                                         
Employee Code: 100                                                              
Employee Name: RAJESH                                                           
Skill NameJAVA                                                                  
Skill Experience(In Months)10                                                   
*----------*----------*                                                         
Employee Code: 102                                                              
Employee Name: VIJAY                                                            
Skill NameC++                                                                   
Skill Experience(In Months)18                                                   
*----------*----------*                                                         
Employee Code: 108                                                              
Employee Name: AJAY                                                             
Skill NameDOT_NET                                                               
Skill Experience(In Months)5                                                    
*----------*----------*                                                         
Employee Code: 108                                                              
Employee Name: AJAY                                                             
Skill NameORACLE                                                                
Skill Experience(In Months)18                                                   
*----------*----------*                                                         
Employee Code: 110                                                              
Employee Name: BHASKAR                                                          
Skill NameORACLE                                                                
Skill Experience(In Months)20                                                   
*----------*----------*                                                         
Employee Code: 106                                                              
Employee Name: RAJ                                                              
Skill NamePYTHON                                                                
Skill Experience(In Months)10                                                   
*----------*----------*                                                         
Employee Code: 106                                                              
Employee Name: RAJ                                                              
Skill NameORACLE                                                                
Skill Experience(In Months)12                                                   
*----------*----------*                                                         
Employee Code: 106                                                              
Employee Name: RAJ                                                              
Skill NameAZURE                                                                 
Skill Experience(In Months)10                                                   
*----------*----------*                                                         
Employee Code: 105                                                              
Employee Name: MANISH                                                           
Skill NameANDROID                                                               
Skill Experience(In Months)12                                                   
*----------*----------*                                                         
Employee Code: 105                                                              
Employee Name: MANISH                                                           
Skill NameIOS                                                                   
Skill Experience(In Months)11                                                   
*----------*----------*                                                         

PL/SQL procedure successfully completed.

SQL> -- Q.7.7(INVOKING FUNCTION)
SQL> 
SQL> 
SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  /*
 15  
 16  --(i)
 17  v_empno := 102;
 18  v_boss_name := package_Lab_7_Q7.name_boss(v_empno);
 19  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 20  
 21  
 22  --(ii)
 23  v_prjID := 'P2 ';
 24  package_Lab_7_Q7.employees_prj(v_prjID);
 25  
 26  
 27  --(iii)
 28  v_date := '10-JAN-20';
 29  package_Lab_7_Q7.prj_name_date(v_date);
 30  
 31  
 32  
 33  --(iv)
 34  package_Lab_7_Q7.employees_skill;
 35  
 36  */
 37  
 38  --(v)
 39  
 40  v_temp := package_Lab_7_Q7.no_of_employees;
 41  dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || v_temp);
 42  
 43  
 44  
 45  END;
 46  /
dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || v_temp);
                     *
ERROR at line 41:
ORA-06550: line 41, column 22: 
PLS-00306: wrong number or types of arguments in call to '||' 
ORA-06550: line 41, column 1: 
PL/SQL: Statement ignored 


SQL> -- Q.7.7(INVOKING FUNCTION)
SQL> 
SQL> 
SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  /*
 15  
 16  --(i)
 17  v_empno := 102;
 18  v_boss_name := package_Lab_7_Q7.name_boss(v_empno);
 19  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 20  
 21  
 22  --(ii)
 23  v_prjID := 'P2 ';
 24  package_Lab_7_Q7.employees_prj(v_prjID);
 25  
 26  
 27  --(iii)
 28  v_date := '10-JAN-20';
 29  package_Lab_7_Q7.prj_name_date(v_date);
 30  
 31  
 32  
 33  --(iv)
 34  package_Lab_7_Q7.employees_skill;
 35  
 36  */
 37  
 38  --(v)
 39  
 40  v_temp := package_Lab_7_Q7.no_of_employees;
 41  dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || to_char(v_temp));
 42  
 43  
 44  
 45  END;
 46  /
dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || to_char(v_temp));
                                                                                                         *
ERROR at line 41:
ORA-06550: line 41, column 106: 
PLS-00306: wrong number or types of arguments in call to 'TO_CHAR' 
ORA-06550: line 41, column 1: 
PL/SQL: Statement ignored 


SQL> -- Q.7.7(INVOKING FUNCTION)
SQL> 
SQL> 
SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  /*
 15  
 16  --(i)
 17  v_empno := 102;
 18  v_boss_name := package_Lab_7_Q7.name_boss(v_empno);
 19  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 20  
 21  
 22  --(ii)
 23  v_prjID := 'P2 ';
 24  package_Lab_7_Q7.employees_prj(v_prjID);
 25  
 26  
 27  --(iii)
 28  v_date := '10-JAN-20';
 29  package_Lab_7_Q7.prj_name_date(v_date);
 30  
 31  
 32  
 33  --(iv)
 34  package_Lab_7_Q7.employees_skill;
 35  
 36  */
 37  
 38  --(v)
 39  
 40  v_temp := package_Lab_7_Q7.no_of_employees;
 41  --dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || to_char(v_temp));
 42  
 43  
 44  
 45  END;
 46  /
No. of Employees in each Designation:                                           
*----------*----------*                                                         
Employee Designation: DEVELOPER                                                 
No of Employees: 7                                                              
*----------*----------*                                                         
Employee Designation: PROJECT MANAGER                                           
No of Employees: 1                                                              
*----------*----------*                                                         
Employee Designation: TECHNICAL HEAD                                            
No of Employees: 1                                                              
*----------*----------*                                                         
Employee Designation: PROJECT DIRECTOR                                          
No of Employees: 1                                                              
*----------*----------*                                                         
Employee Designation: PROJECT LEADER                                            
No of Employees: 1                                                              
*----------*----------*                                                         
Employee Designation: CEO                                                       
No of Employees: 1                                                              
*----------*----------*                                                         

PL/SQL procedure successfully completed.

SQL> -- Q.7.7(INVOKING FUNCTION)
SQL> 
SQL> 
SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp VARCHAR2(10);
 11  
 12  BEGIN
 13  /*
 14  --(i)
 15  v_empno := 102;
 16  v_boss_name := package_Lab_7_Q7.name_boss(v_empno);
 17  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 18  
 19  
 20  --(ii)
 21  v_prjID := 'P2 ';
 22  package_Lab_7_Q7.employees_prj(v_prjID);
 23  
 24  
 25  --(iii)
 26  v_date := '10-JAN-20';
 27  package_Lab_7_Q7.prj_name_date(v_date);
 28  
 29  
 30  --(iv)
 31  package_Lab_7_Q7.employees_skill;
 32  
 33  */
 34  --(v)
 35  v_temp := package_Lab_7_Q7.no_of_employees;
 36  dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || to_char(v_temp));
 37  
 38  
 39  
 40  END;
 41  /
v_temp := package_Lab_7_Q7.no_of_employees;
                           *
ERROR at line 35:
ORA-06550: line 35, column 28: 
PLS-00382: expression is of wrong type 
ORA-06550: line 35, column 1: 
PL/SQL: Statement ignored 


SQL> -- Q.7.7(INVOKING FUNCTION)
SQL> 
SQL> 
SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  /*
 14  --(i)
 15  v_empno := 102;
 16  v_boss_name := package_Lab_7_Q7.name_boss(v_empno);
 17  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 18  
 19  
 20  --(ii)
 21  v_prjID := 'P2 ';
 22  package_Lab_7_Q7.employees_prj(v_prjID);
 23  
 24  
 25  --(iii)
 26  v_date := '10-JAN-20';
 27  package_Lab_7_Q7.prj_name_date(v_date);
 28  
 29  
 30  --(iv)
 31  package_Lab_7_Q7.employees_skill;
 32  
 33  */
 34  --(v)
 35  v_temp := package_Lab_7_Q7.no_of_employees;
 36  dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || sys.diutil.bool_to_int(v_temp));
 37  
 38  
 39  
 40  END;
 41  /
No. of Employees in each Designation:                                           
*----------*----------*                                                         
Employee Designation: DEVELOPER                                                 
No of Employees: 7                                                              
*----------*----------*                                                         
Employee Designation: PROJECT MANAGER                                           
No of Employees: 1                                                              
*----------*----------*                                                         
Employee Designation: TECHNICAL HEAD                                            
No of Employees: 1                                                              
*----------*----------*                                                         
Employee Designation: PROJECT DIRECTOR                                          
No of Employees: 1                                                              
*----------*----------*                                                         
Employee Designation: PROJECT LEADER                                            
No of Employees: 1                                                              
*----------*----------*                                                         
Employee Designation: CEO                                                       
No of Employees: 1                                                              
*----------*----------*                                                         
Function for finding No. of Employees per Designation Executed Successfully ? 1 

PL/SQL procedure successfully completed.

SQL> -- Q.7.7(INVOKING FUNCTION)
SQL> 
SQL> 
SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empno NUMBER;
  4  v_boss_name VARCHAR2(10);
  5  
  6  v_prjID VARCHAR(3);
  7  
  8  v_date DATE;
  9  
 10  v_temp BOOLEAN;
 11  
 12  BEGIN
 13  
 14  --(i)
 15  v_empno := 102;
 16  v_boss_name := package_Lab_7_Q7.name_boss(v_empno);
 17  dbms_output.put_line('Boss Name of ' || v_empno || ' is: ' || v_boss_name);
 18  
 19  
 20  --(ii)
 21  v_prjID := 'P2 ';
 22  package_Lab_7_Q7.employees_prj(v_prjID);
 23  
 24  
 25  --(iii)
 26  v_date := '10-JAN-20';
 27  package_Lab_7_Q7.prj_name_date(v_date);
 28  
 29  
 30  --(iv)
 31  package_Lab_7_Q7.employees_skill;
 32  
 33  
 34  --(v)
 35  v_temp := package_Lab_7_Q7.no_of_employees;
 36  dbms_output.put_line('Function for finding No. of Employees per Designation Executed Successfully ? ' || sys.diutil.bool_to_int(v_temp));
 37  
 38  
 39  
 40  END;
 41  /
Boss Name of 102 is: BHASKAR                                                    
The Names of Employees in project P2  are:                                      
AJAY                                                                            
AJAY                                                                            
Name of the Project started from 10-JAN-20 is:                                  
SPYDER                                                                          
Details of Work Force:                                                          
*----------*----------*                                                         
Employee Code: 100                                                              
Employee Name: RAJESH                                                           
Skill NameJAVA                                                                  
Skill Experience(In Months)10                                                   
*----------*----------*                                                         
Employee Code: 102                                                              
Employee Name: VIJAY                                                            
Skill NameC++                                                                   
Skill Experience(In Months)18                                                   
*----------*----------*                                                         
Employee Code: 108                                                              
Employee Name: AJAY                                                             
Skill NameDOT_NET                                                               
Skill Experience(In Months)5                                                    
*----------*----------*                                                         
Employee Code: 108                                                              
Employee Name: AJAY                                                             
Skill NameORACLE                                                                
Skill Experience(In Months)18                                                   
*----------*----------*                                                         
Employee Code: 110                                                              
Employee Name: BHASKAR                                                          
Skill NameORACLE                                                                
Skill Experience(In Months)20                                                   
*----------*----------*                                                         
Employee Code: 106                                                              
Employee Name: RAJ                                                              
Skill NamePYTHON                                                                
Skill Experience(In Months)10                                                   
*----------*----------*                                                         
Employee Code: 106                                                              
Employee Name: RAJ                                                              
Skill NameORACLE                                                                
Skill Experience(In Months)12                                                   
*----------*----------*                                                         
Employee Code: 106                                                              
Employee Name: RAJ                                                              
Skill NameAZURE                                                                 
Skill Experience(In Months)10                                                   
*----------*----------*                                                         
Employee Code: 105                                                              
Employee Name: MANISH                                                           
Skill NameANDROID                                                               
Skill Experience(In Months)12                                                   
*----------*----------*                                                         
Employee Code: 105                                                              
Employee Name: MANISH                                                           
Skill NameIOS                                                                   
Skill Experience(In Months)11                                                   
*----------*----------*                                                         
No. of Employees in each Designation:                                           
*----------*----------*                                                         
Employee Designation: DEVELOPER                                                 
No of Employees: 7                                                              
*----------*----------*                                                         
Employee Designation: PROJECT MANAGER                                           
No of Employees: 1                                                              
*----------*----------*                                                         
Employee Designation: TECHNICAL HEAD                                            
No of Employees: 1                                                              
*----------*----------*                                                         
Employee Designation: PROJECT DIRECTOR                                          
No of Employees: 1                                                              
*----------*----------*                                                         
Employee Designation: PROJECT LEADER                                            
No of Employees: 1                                                              
*----------*----------*                                                         
Employee Designation: CEO                                                       
No of Employees: 1                                                              
*----------*----------*                                                         
Function for finding No. of Employees per Designation Executed Successfully ? 1 

PL/SQL procedure successfully completed.

SQL> SPOOL OFF;
