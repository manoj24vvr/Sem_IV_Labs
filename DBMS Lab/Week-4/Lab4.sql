SQL> select name from emp where designation = (select designation from emp where empcode = 101);

NAME                                                                            
----------                                                                      
RAVI                                                                            
RAJ                                                                             
VENKAT                                                                          

SQL> select name from emp where reports_to in (select empcode from emp where name = 'VIJAY');

NAME                                                                            
----------                                                                      
RAVI                                                                            
AJAY                                                                            

SQL> select e.name,e.designation,e.email from emp e,prj_details p where e.empcode=p.lead_by_empcode and p.prj_name = some (select prj_name from prj_details where lead_by_empcode = (select empcode from emp where name = 'VIJAY'));

NAME       DESIGNATION          EMAIL                                           
---------- -------------------- --------------------                            
VIJAY      PROJECT MANAGER      vijay@digisol.com                               

SQL> select name from emp,family_dependents where empcode=empno and relationship = 'DAUGHTER';

NAME                                                                            
----------                                                                      
RAJESH                                                                          
RAVI                                                                            

SQL> select distinct e.name from emp e,prj_details p where e.empcode=p.lead_by_empcode and e.empcode not in (select empcode from work_exp where prjid='P1');

NAME                                                                            
----------                                                                      
BHASKAR                                                                         
AJAY                                                                            
PAVAN                                                                           
NIKHITH                                                                         
RAJ                                                                             
BALAJI                                                                          

6 rows selected.

SQL> select e.name from emp e,emp_skill es,skill s,work_exp w where s.skillID=es.skillID and e.empcode=es.empno and s.skillname = some(select s.skillname from skill s,emp_skill es where s.skillID=es.skillID and es.empno in (select empcode from work_exp where prjid='P1'));

NAME                                                                            
----------                                                                      
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          

NAME                                                                            
----------                                                                      
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          

NAME                                                                            
----------                                                                      
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAJESH                                                                          
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            

NAME                                                                            
----------                                                                      
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            

NAME                                                                            
----------                                                                      
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            

NAME                                                                            
----------                                                                      
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            

NAME                                                                            
----------                                                                      
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           

NAME                                                                            
----------                                                                      
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           

NAME                                                                            
----------                                                                      
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
VIJAY                                                                           
BHASKAR                                                                         

NAME                                                                            
----------                                                                      
BHASKAR                                                                         
BHASKAR                                                                         
BHASKAR                                                                         
BHASKAR                                                                         
BHASKAR                                                                         
BHASKAR                                                                         
BHASKAR                                                                         
BHASKAR                                                                         
BHASKAR                                                                         
BHASKAR                                                                         
BHASKAR                                                                         

NAME                                                                            
----------                                                                      
BHASKAR                                                                         
BHASKAR                                                                         
RAJ                                                                             
RAJ                                                                             
RAJ                                                                             
RAJ                                                                             
RAJ                                                                             
RAJ                                                                             
RAJ                                                                             
RAJ                                                                             
RAJ                                                                             

NAME                                                                            
----------                                                                      
RAJ                                                                             
RAJ                                                                             
RAJ                                                                             
RAJ                                                                             
RAJ                                                                             

126 rows selected.

SQL> select distinct e.name from emp e,emp_skill es,skill s,work_exp w where s.skillID=es.skillID and e.empcode=es.empno and s.skillname = some(select s.skillname from skill s,emp_skill es where s.skillID=es.skillID and es.empno in (select empcode from work_exp where prjid='P1'));

NAME                                                                            
----------                                                                      
RAVI                                                                            
BHASKAR                                                                         
VIJAY                                                                           
RAJ                                                                             
RAJESH                                                                          

SQL> select e.name from emp e,work_exp w where e.empcode=w.empcode and w.prjid='P1' and work_experience > all(select work_experience from work_exp where prjid='P2');

NAME                                                                            
----------                                                                      
RAJESH                                                                          

SQL> select p.prj_name from (prj_details p left join work_exp w on w.prjid=p.prjid)  group by prj_name having count(w.empcode) > 2;

PRJ_NAME                                                                        
----------                                                                      
APOLLO                                                                          
JUPITER                                                                         
SPYDER                                                                          

SQL> select e.name,count(f.empno) from (emp e left join family_dependents f on e.empcode=f.empno) group by e.name;

NAME       COUNT(F.EMPNO)                                                       
---------- --------------                                                       
RAVI                    3                                                       
BHASKAR                 0                                                       
RAKESH                  0                                                       
RAKSH                   0                                                       
AJAY                    0                                                       
VENKAT                  0                                                       
PAVAN                   0                                                       
MANISH                  0                                                       
PRASAD                  0                                                       
NIKHITH                 0                                                       
VIJAY                   1                                                       

NAME       COUNT(F.EMPNO)                                                       
---------- --------------                                                       
BALAJI                  0                                                       
RAJ                     0                                                       
RAJESH                  2                                                       

14 rows selected.

SQL> select extract(year from policydate),sum(premium) as Total_premium from medical_policy group by extract(year from policydate);

EXTRACT(YEARFROMPOLICYDATE) TOTAL_PREMIUM                                       
--------------------------- -------------                                       
                       2021         46000                                       
                       2020         22000                                       

SQL> select e.name, p.prj_name from emp e, prj_details p where e.empcode = p.lead_by_empcode;

NAME       PRJ_NAME                                                             
---------- ----------                                                           
VIJAY      SPYDER                                                               
AJAY       APOLLO                                                               
AJAY       SATURN                                                               
BHASKAR    ZEUS                                                                 
BHASKAR    JUPITER                                                              
RAJ        UNICORN                                                              
BALAJI     MARS                                                                 
NIKHITH    SUN                                                                  
PAVAN      PLUTO                                                                

9 rows selected.

SQL> update table emp,
  2  set salary = CASE Rating when 'A' Then salary*1.1 when 'B' tHEN SALARY*1.05 else salary
  3  from emp,work_exp
  4  where emp.empcode = work_exp.empcode;
update table emp,
       *
ERROR at line 1:
ORA-00903: invalid table name 


SQL> update emp,
  2  set salary = CASE Rating when 'A' Then salary*1.1 when 'B' tHEN SALARY*1.05 else salary
  3  from emp,work_exp
  4  where emp.empcode = work_exp.empcode;
update emp,
          *
ERROR at line 1:
ORA-00971: missing SET keyword 


SQL> update emp
  2  set salary = CASE Rating when 'A' Then salary*1.1 when 'B' tHEN SALARY*1.05 else salary
  3  from emp,work_exp
  4  where emp.empcode = work_exp.empcode;
from emp,work_exp
*
ERROR at line 3:
ORA-00905: missing keyword 


SQL> update emp, work_exp
  2  set salary = CASE Rating when 'A' Then salary*1.1 when 'B' tHEN SALARY*1.05 else salary
  3  where emp.empcode = work_exp.empcode;
update emp, work_exp
          *
ERROR at line 1:
ORA-00971: missing SET keyword 


SQL> 
SQL> update emp, work_exp
  2  SET salary = CASE Rating when 'A' Then salary*1.1 when 'B' tHEN SALARY*1.05 else salary
  3  where emp.empcode = work_exp.empcode;
update emp, work_exp
          *
ERROR at line 1:
ORA-00971: missing SET keyword 


SQL> spool off;
