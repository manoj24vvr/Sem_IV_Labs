SQL> select * from client;

CLI NAME       PHONE          EMAIL                                             
--- ---------- -------------- --------------------                              
C2  LTS        +91-78389397   bbb@lts.com                                       
C3  RK         +44-67838934   ccc@rk.com                                        
C4  MMA        +31-77839093   ddd@mma.com                                       
C5  AKS        +81-66822903   eee@aks.com                                       
C6  GKS        +91-75628982   fff@gks.com                                       
C9  XYZ        +48-25694598   xyz@ab.com                                        
C10 GHS        +91-25369874   abc@hkd.com                                       
C7  BBB        +91-64839839   ggg@bb.com                                        
C8  ABT        +44-67554667                                                     

9 rows selected.

SQL> 
SQL> select name,phone,email from emp where designation = 'DEVELOPER';

NAME            PHONE EMAIL                                                     
---------- ---------- --------------------                                      
RAJESH     1234567890 rajesh@digisol.com                                        
MANISH     1234567896 manish@digisol.com                                        
RAKESH     1234566789 rakesh@digisol.com                                        
RAKSH      1234567898 raksh@digisol.com                                         

SQL> 
SQL> select name from emp where empcode = 106;

NAME                                                                            
----------                                                                      
RAJ                                                                             

SQL> select name,email from emp where designation = 'TECHNICAL HEAD' and qualification ='BTECH';

NAME       EMAIL                                                                
---------- --------------------                                                 
AJAY       ajay@digisol.com                                                     
NIKHITH    nikhith@digisol.com                                                  

SQL> 
SQL> select name from emp where salary >= 100000 and salary <= 200000;

NAME                                                                            
----------                                                                      
RAJESH                                                                          
RAVI                                                                            
VIJAY                                                                           
AJAY                                                                            
BHASKAR                                                                         
RAJ                                                                             
MANISH                                                                          
PRASAD                                                                          
RAKESH                                                                          
RAKSH                                                                           
VENKAT                                                                          

NAME                                                                            
----------                                                                      
BALAJI                                                                          
NIKHITH                                                                         
PAVAN                                                                           

14 rows selected.

SQL> select name from emp where salary between 100000 and 200000;

NAME                                                                            
----------                                                                      
RAJESH                                                                          
RAVI                                                                            
VIJAY                                                                           
AJAY                                                                            
BHASKAR                                                                         
RAJ                                                                             
MANISH                                                                          
PRASAD                                                                          
RAKESH                                                                          
RAKSH                                                                           
VENKAT                                                                          

NAME                                                                            
----------                                                                      
BALAJI                                                                          
NIKHITH                                                                         
PAVAN                                                                           

14 rows selected.

SQL> 
SQL> select skillname from skill where skillID in (select skillID from emp_skill where empno = 101);

SKILLNAME                                                                       
--------------------                                                            
Full Stack                                                                      
Python                                                                          
Java                                                                            

SQL> 
SQL> select empcode from work_exp where clientID in ('C2','C1') and rating in ('A','B');

   EMPCODE                                                                      
----------                                                                      
       102                                                                      
       105                                                                      

SQL> 
SQL> select name from emp where empcode in (select empcode from work_exp where clientID = 'C2' and rating ='B');

NAME                                                                            
----------                                                                      
VIJAY                                                                           
MANISH                                                                          

SQL> 
SQL> select count(empno) from family_dependents where empno = ( select empcode from emp  where name = 'RAVI');

COUNT(EMPNO)                                                                    
------------                                                                    
           3                                                                    

SQL> 
SQL> select name,designation,salary*12 as Annual_Salary from emp;

NAME       DESIGNATION          ANNUAL_SALARY                                   
---------- -------------------- -------------                                   
RAJESH     DEVELOPER                  1320000                                   
RAVI       PROJECT LEADER             1320000                                   
VIJAY      PROJECT MANAGER            1440000                                   
AJAY       TECHNICAL HEAD             1560000                                   
BHASKAR    PROJECT DIRECTOR           1680000                                   
RAJ        PROJECT LEADER             1800000                                   
MANISH     DEVELOPER                  2112000                                   
PRASAD     CEO                        2400000                                   
RAKESH     DEVELOPER                  2112000                                   
RAKSH      DEVELOPER                  2244000                                   
VENKAT     PROJECT LEADER             1320000                                   

NAME       DESIGNATION          ANNUAL_SALARY                                   
---------- -------------------- -------------                                   
BALAJI     PROJECT DIRECTOR           1680000                                   
NIKHITH    TECHNICAL HEAD             1560000                                   
PAVAN      PROJECT MANAGER            1800000                                   

14 rows selected.

SQL> 
SQL> select e.name,f.dep_name from emp e LEFT JOIN family_dependents f on e.empcode = f.empno;

NAME       DEP_NAME                                                             
---------- --------------------                                                 
RAJESH     AJITH                                                                
RAJESH     PRATHVI                                                              
RAVI       AARYA                                                                
RAVI       AKANKSH                                                              
RAVI       ANITHA                                                               
VIJAY      ANIKET                                                               
RAKSH                                                                           
BALAJI                                                                          
AJAY                                                                            
VENKAT                                                                          
BHASKAR                                                                         

NAME       DEP_NAME                                                             
---------- --------------------                                                 
MANISH                                                                          
RAKESH                                                                          
PRASAD                                                                          
PAVAN                                                                           
NIKHITH                                                                         
RAJ                                                                             

17 rows selected.

SQL> 
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

SQL> select e.name,h.name as Higher_Authority_Name,e.phone from emp e, emp h where e.reports_to = h.empcode;

NAME       HIGHER_AUT      PHONE                                                
---------- ---------- ----------                                                
RAJESH     RAVI       1234567890                                                
RAVI       VIJAY      1234567891                                                
AJAY       VIJAY      1234567893                                                
VIJAY      BHASKAR    1234567892                                                
RAJ        BHASKAR    1234567895                                                
BHASKAR    RAJ        1234567894                                                
MANISH     RAJ        1234567896                                                
NIKHITH    MANISH     1236547895                                                
VENKAT     PRASAD     1234567899                                                
RAKSH      RAKESH     1234567898                                                
RAKESH     VENKAT     1234566789                                                

NAME       HIGHER_AUT      PHONE                                                
---------- ---------- ----------                                                
PAVAN      NIKHITH    1236549876                                                
BALAJI     PAVAN      1234569871                                                

13 rows selected.

SQL> 
SQL> select * from prj_details order by ACTUAL_END_DATE desc;

PRJ PRJ_NAME   START_DAT END_DATE  ACTUAL_EN LEAD_BY_EMPCODE BUDGET_ALLOCATED   
--- ---------- --------- --------- --------- --------------- ----------------   
ACTUAL_BUDGET                                                                   
-------------                                                                   
P3  UNICORN    03-NOV-21 10-OCT-23 10-OCT-23             106          7500000   
      8000000                                                                   
                                                                                
P1  SPYDER     10-JAN-20 11-OCT-22 12-OCT-22             102          2000000   
      1990000                                                                   
                                                                                
P4  ZEUS       28-FEB-20 09-JUN-21 10-JAN-22             110          5500000   
      5000000                                                                   
                                                                                

PRJ PRJ_NAME   START_DAT END_DATE  ACTUAL_EN LEAD_BY_EMPCODE BUDGET_ALLOCATED   
--- ---------- --------- --------- --------- --------------- ----------------   
ACTUAL_BUDGET                                                                   
-------------                                                                   
P7  SATURN     21-FEB-20 08-AUG-21 10-DEC-21             108          8500000   
      9400000                                                                   
                                                                                
P2  APOLLO     01-JAN-19 10-JUL-21 11-JUL-21             108          3000000   
      3600000                                                                   
                                                                                
P9  SUN        25-APR-20 14-NOV-20 23-FEB-21             111          9600000   
      9800000                                                                   
                                                                                

PRJ PRJ_NAME   START_DAT END_DATE  ACTUAL_EN LEAD_BY_EMPCODE BUDGET_ALLOCATED   
--- ---------- --------- --------- --------- --------------- ----------------   
ACTUAL_BUDGET                                                                   
-------------                                                                   
P8  PLUTO      21-MAR-19 10-SEP-20 15-JAN-21             112          8000000   
      9000000                                                                   
                                                                                
P6  MARS       21-FEB-19 07-AUG-20 09-DEC-20             113          8000000   
      9000000                                                                   
                                                                                
P5  JUPITER    07-AUG-18 04-FEB-20 01-NOV-20             110          9000000   
      9000000                                                                   
                                                                                

9 rows selected.

SQL> 
SQL> select e.name,s.skillname from emp e, skill s, emp_skill p where e.empcode = p.empno and p.skillID = s.skillID order by p.empno asc, p.skill_experience desc;

NAME       SKILLNAME                                                            
---------- --------------------                                                 
RAJESH     Full Stack                                                           
RAJESH     Java                                                                 
RAVI       Python                                                               
RAVI       Java                                                                 
RAVI       Full Stack                                                           
VIJAY      C++                                                                  
VIJAY      ML                                                                   
MANISH     Android                                                              
MANISH     IOS                                                                  
RAJ        Oracle                                                               
RAJ        Python                                                               

NAME       SKILLNAME                                                            
---------- --------------------                                                 
RAJ        AZURE                                                                
AJAY       Oracle                                                               
AJAY       DOT NET                                                              
BHASKAR    Oracle                                                               
BHASKAR    Full Stack                                                           

16 rows selected.

SQL> 
SQL> select e.name,f.dep_name,age from emp e, family_dependents f where e.empcode = f.empno and f.relationship = 'SON' order by e.name asc, age desc;

NAME       DEP_NAME                    AGE                                      
---------- -------------------- ----------                                      
RAJESH     AJITH                        12                                      
RAVI       AKANKSH                      11                                      

SQL> 
SQL> select e.name, p.prj_name from emp e, prj_details p where e.empcode = p.lead_by_empcode order by e.name asc, p.prj_name desc;

NAME       PRJ_NAME                                                             
---------- ----------                                                           
AJAY       SATURN                                                               
AJAY       APOLLO                                                               
BALAJI     MARS                                                                 
BHASKAR    ZEUS                                                                 
BHASKAR    JUPITER                                                              
NIKHITH    SUN                                                                  
PAVAN      PLUTO                                                                
RAJ        UNICORN                                                              
VIJAY      SPYDER                                                               

9 rows selected.

SQL> 
SQL> select name,prj_name from emp,prj_details where empcode = lead_by_empcode and prj_name = 'SPYDER'
  2  UNION
  3  select name,prj_name from emp,prj_details where empcode = lead_by_empcode and prj_name = 'APOLLO';

NAME       PRJ_NAME                                                             
---------- ----------                                                           
AJAY       APOLLO                                                               
VIJAY      SPYDER                                                               

SQL> 
SQL> select e.name from emp e,skill s,emp_skill p where e.empcode=p.empno and s.skillID=p.skillID and s.skillname='Oracle'
  2  INTERSECT
  3  select e.name from emp e,skill s,emp_skill p where e.empcode=p.empno and p.skillID=s.skillID and s.skillname='AZURE';

NAME                                                                            
----------                                                                      
RAJ                                                                             

SQL> 
SQL> select e.name from emp e, prj_details p where e.empcode = p.lead_by_empcode
  2  MINUS
  3  select e.name from emp e, prj_details p where e.empcode = p.lead_by_empcode and p.prj_name = 'JUPITER';

NAME                                                                            
----------                                                                      
AJAY                                                                            
BALAJI                                                                          
NIKHITH                                                                         
PAVAN                                                                           
RAJ                                                                             
VIJAY                                                                           

6 rows selected.

SQL> 
SQL> select name from emp where reports_to is null;

NAME                                                                            
----------                                                                      
PRASAD                                                                          

SQL> 
SQL> select name,email from emp where name like ('A%');

NAME       EMAIL                                                                
---------- --------------------                                                 
AJAY       ajay@digisol.com                                                     

SQL> 
SQL> select prj_name from prj_details where start_date between '01/Jan/2020' and '31/Dec/2020';

PRJ_NAME                                                                        
----------                                                                      
SPYDER                                                                          
ZEUS                                                                            
SATURN                                                                          
SUN                                                                             

SQL> 
SQL> select e.name from emp e,skill s,emp_skill p where e.empcode=p.empno and p.skillID=s.skillID and s.skillname in
  2  (select s.skillname from emp e,skill s,emp_skill p where e.empcode=p.empno and p.skillID=s.skillID and e.empcode = 101);

NAME                                                                            
----------                                                                      
RAJESH                                                                          
RAJESH                                                                          
RAVI                                                                            
RAVI                                                                            
RAVI                                                                            
BHASKAR                                                                         
RAJ                                                                             

7 rows selected.

SQL> select e.name,e.salary,p.* from emp e, pay_check p where e.empcode = p.lead_by_empcode and pay_date like '%MAR%';
select e.name,e.salary,p.* from emp e, pay_check p where e.empcode = p.lead_by_empcode and pay_date like '%MAR%'
                                                                     *
ERROR at line 1:
ORA-00904: "P"."LEAD_BY_EMPCODE": invalid identifier 


SQL> select e.name,e.salary,p.* from emp e, pay_check p where e.empcode = p.empcode and pay_date like '%MAR%';

NAME           SALARY    EMPCODE PAY_DATE  REGULAR_INCREMENT                    
---------- ---------- ---------- --------- -----------------                    
PERFORMANCE_INCENTIVE         DA         PF OTHER_INCENTIVES ADVANC_TAX         
--------------------- ---------- ---------- ---------------- ----------         
RAVI           110000        101 01-MAR-20              3000                    
                 2400       5000       2300             5000       7000         
                                                                                
RAVI           110000        101 01-MAR-21              5000                    
                 3500       4000       5500             2100       4000         
                                                                                

SQL> spool off;
