SQL> 
SQL> SELECT Name, UPPER(NAME) UNAME, LOWER(NAME) LNAME, INITCAP(NAME) FNAME FROM EMP;

NAME       UNAME      LNAME      FNAME                                          
---------- ---------- ---------- ----------                                     
RAJESH     RAJESH     rajesh     Rajesh                                         
RAVI       RAVI       ravi       Ravi                                           
VIJAY      VIJAY      vijay      Vijay                                          
AJAY       AJAY       ajay       Ajay                                           
BHASKAR    BHASKAR    bhaskar    Bhaskar                                        
RAJ        RAJ        raj        Raj                                            
MANISH     MANISH     manish     Manish                                         
PRASAD     PRASAD     prasad     Prasad                                         
RAKESH     RAKESH     rakesh     Rakesh                                         
RAKSH      RAKSH      raksh      Raksh                                          
VENKAT     VENKAT     venkat     Venkat                                         

NAME       UNAME      LNAME      FNAME                                          
---------- ---------- ---------- ----------                                     
BALAJI     BALAJI     balaji     Balaji                                         
NIKHITH    NIKHITH    nikhith    Nikhith                                        
PAVAN      PAVAN      pavan      Pavan                                          

14 rows selected.

SQL> 
SQL> SELECT (NAME||' WORKS AS A '||DESIGNATION) FROM EMP;

(NAME||'WORKSASA'||DESIGNATION)                                                 
------------------------------------------                                      
RAJESH WORKS AS A DEVELOPER                                                     
RAVI WORKS AS A PROJECT LEADER                                                  
VIJAY WORKS AS A PROJECT MANAGER                                                
AJAY WORKS AS A TECHNICAL HEAD                                                  
BHASKAR WORKS AS A PROJECT DIRECTOR                                             
RAJ WORKS AS A PROJECT LEADER                                                   
MANISH WORKS AS A DEVELOPER                                                     
PRASAD WORKS AS A CEO                                                           
RAKESH WORKS AS A DEVELOPER                                                     
RAKSH WORKS AS A DEVELOPER                                                      
VENKAT WORKS AS A PROJECT LEADER                                                

(NAME||'WORKSASA'||DESIGNATION)                                                 
------------------------------------------                                      
BALAJI WORKS AS A PROJECT DIRECTOR                                              
NIKHITH WORKS AS A TECHNICAL HEAD                                               
PAVAN WORKS AS A PROJECT MANAGER                                                

14 rows selected.

SQL> 
SQL> SELECT LPAD(SALARY ,10, '*') SALARY FROM EMP;

SALARY                                                                          
----------------------------------------                                        
****105000                                                                      
****121000                                                                      
****120000                                                                      
****130000                                                                      
****140000                                                                      
****165000                                                                      
****168000                                                                      
****200000                                                                      
****168000                                                                      
****178500                                                                      
****121000                                                                      

SALARY                                                                          
----------------------------------------                                        
****140000                                                                      
****130000                                                                      
****150000                                                                      

14 rows selected.

SQL> 
SQL> SELECT RPAD(SALARY,10,'*') SALARY FROM EMP;

SALARY                                                                          
----------------------------------------                                        
105000****                                                                      
121000****                                                                      
120000****                                                                      
130000****                                                                      
140000****                                                                      
165000****                                                                      
168000****                                                                      
200000****                                                                      
168000****                                                                      
178500****                                                                      
121000****                                                                      

SALARY                                                                          
----------------------------------------                                        
140000****                                                                      
130000****                                                                      
150000****                                                                      

14 rows selected.

SQL> 
SQL> SELECT NAME, LENGTH(NAME) LENGTH FROM EMP;

NAME           LENGTH                                                           
---------- ----------                                                           
RAJESH              6                                                           
RAVI                4                                                           
VIJAY               5                                                           
AJAY                4                                                           
BHASKAR             7                                                           
RAJ                 3                                                           
MANISH              6                                                           
PRASAD              6                                                           
RAKESH              6                                                           
RAKSH               5                                                           
VENKAT              6                                                           

NAME           LENGTH                                                           
---------- ----------                                                           
BALAJI              6                                                           
NIKHITH             7                                                           
PAVAN               5                                                           

14 rows selected.

SQL> 
SQL> SELECT EMAIL, SUBSTR(EMAIL,3,9) Substr_Email FROM EMP;

EMAIL                SUBSTR_EMAIL                                               
-------------------- ------------------------------------                       
rajesh@digisol.com   jesh@digi                                                  
ravi@digisol.com     vi@digiso                                                  
vijay@digisol.com    jay@digis                                                  
ajay@digisol.com     ay@digiso                                                  
bhaskar@digisol.com  askar@dig                                                  
raj@digisol.com      j@digisol                                                  
manish@digisol.com   nish@digi                                                  
prasad@digisol.com   asad@digi                                                  
rakesh@digisol.com   kesh@digi                                                  
raksh@digisol.com    ksh@digis                                                  
venkat@digisol.com   nkat@digi                                                  

EMAIL                SUBSTR_EMAIL                                               
-------------------- ------------------------------------                       
balaji@digisol.com   laji@digi                                                  
nikhith@digisol.com  khith@dig                                                  
pavan@digisol.com    van@digis                                                  

14 rows selected.

SQL> 
SQL> SELECT EMAIL, REPLACE(EMAIL,'digisol','digitech') REPLACED_EMAIL FROM EMP;

EMAIL                                                                           
--------------------                                                            
REPLACED_EMAIL                                                                  
--------------------------------------------------------------------------------
rajesh@digisol.com                                                              
rajesh@digitech.com                                                             
                                                                                
ravi@digisol.com                                                                
ravi@digitech.com                                                               
                                                                                
vijay@digisol.com                                                               
vijay@digitech.com                                                              
                                                                                

EMAIL                                                                           
--------------------                                                            
REPLACED_EMAIL                                                                  
--------------------------------------------------------------------------------
ajay@digisol.com                                                                
ajay@digitech.com                                                               
                                                                                
bhaskar@digisol.com                                                             
bhaskar@digitech.com                                                            
                                                                                
raj@digisol.com                                                                 
raj@digitech.com                                                                
                                                                                

EMAIL                                                                           
--------------------                                                            
REPLACED_EMAIL                                                                  
--------------------------------------------------------------------------------
manish@digisol.com                                                              
manish@digitech.com                                                             
                                                                                
prasad@digisol.com                                                              
prasad@digitech.com                                                             
                                                                                
rakesh@digisol.com                                                              
rakesh@digitech.com                                                             
                                                                                

EMAIL                                                                           
--------------------                                                            
REPLACED_EMAIL                                                                  
--------------------------------------------------------------------------------
raksh@digisol.com                                                               
raksh@digitech.com                                                              
                                                                                
venkat@digisol.com                                                              
venkat@digitech.com                                                             
                                                                                
balaji@digisol.com                                                              
balaji@digitech.com                                                             
                                                                                

EMAIL                                                                           
--------------------                                                            
REPLACED_EMAIL                                                                  
--------------------------------------------------------------------------------
nikhith@digisol.com                                                             
nikhith@digitech.com                                                            
                                                                                
pavan@digisol.com                                                               
pavan@digitech.com                                                              
                                                                                

14 rows selected.

SQL> 
SQL> SELECT NAME, DEP_NAME, CONCAT(NAME,DEP_NAME) CONCATENATED_NAME
  2  FROM EMP E JOIN FAMILY_DEPENDENTS F ON E.EMPCODE = F.EMPNO;

NAME       DEP_NAME             CONCATENATED_NAME                               
---------- -------------------- ------------------------------                  
RAJESH     AJITH                RAJESHAJITH                                     
RAJESH     PRATHVI              RAJESHPRATHVI                                   
RAVI       AARYA                RAVIAARYA                                       
RAVI       AKANKSH              RAVIAKANKSH                                     
RAVI       ANITHA               RAVIANITHA                                      
VIJAY      ANIKET               VIJAYANIKET                                     

6 rows selected.

SQL> 
SQL> SELECT CLIENTID, LENGTH(CLIENTID) FROM CLIENT;

CLI LENGTH(CLIENTID)                                                            
--- ----------------                                                            
C10                3                                                            
C2                 3                                                            
C3                 3                                                            
C4                 3                                                            
C5                 3                                                            
C6                 3                                                            
C7                 3                                                            
C8                 3                                                            
C9                 3                                                            

9 rows selected.

SQL> 
SQL> SELECT RTRIM(CLIENTID) TRIMMED, LENGTH(RTRIM(CLIENTID)) NUM_CHARS FROM CLIENT;

TRI  NUM_CHARS                                                                  
--- ----------                                                                  
C10          3                                                                  
C2           2                                                                  
C3           2                                                                  
C4           2                                                                  
C5           2                                                                  
C6           2                                                                  
C7           2                                                                  
C8           2                                                                  
C9           2                                                                  

9 rows selected.

SQL> 
SQL> SELECT LTRIM(CLIENTID) TRIMMED, LENGTH(LTRIM(CLIENTID)) NUM_CHARS FROM CLIENT;

TRI  NUM_CHARS                                                                  
--- ----------                                                                  
C10          3                                                                  
C2           3                                                                  
C3           3                                                                  
C4           3                                                                  
C5           3                                                                  
C6           3                                                                  
C7           3                                                                  
C8           3                                                                  
C9           3                                                                  

9 rows selected.

SQL> 
SQL> SELECT TRIM(CLIENTID) TRIMMED, LENGTH(TRIM(CLIENTID)) NUM_CHARS FROM CLIENT;

TRI  NUM_CHARS                                                                  
--- ----------                                                                  
C10          3                                                                  
C2           2                                                                  
C3           2                                                                  
C4           2                                                                  
C5           2                                                                  
C6           2                                                                  
C7           2                                                                  
C8           2                                                                  
C9           2                                                                  

9 rows selected.

SQL> 
SQL> SELECT ASCII('A') ASCII_of_A, CHR(65) char_OF_65 FROM DUAL;

ASCII_OF_A C                                                                    
---------- -                                                                    
        65 A                                                                    

SQL> 
SQL> SELECT TRUNC(123.456,2) FROM DUAL;

TRUNC(123.456,2)                                                                
----------------                                                                
          123.45                                                                

SQL> 
SQL> SELECT POWER(9,0.5) ROOT, POWER(9,2) SQUARE, POWER(9,5) POWER_5 FROM DUAL;

      ROOT     SQUARE    POWER_5                                                
---------- ---------- ----------                                                
         3         81      59049                                                

SQL> 
SQL> SELECT ROUND(123.456,2) FROM DUAL;

ROUND(123.456,2)                                                                
----------------                                                                
          123.46                                                                

SQL> 
SQL> SELECT ABS(-123) ABS, MOD(123,10) REM FROM DUAL;

       ABS        REM                                                           
---------- ----------                                                           
       123          3                                                           

SQL> 
SQL> SELECT FLOOR(234.36),FLOOR(-234.36), CEIL(-234.26),CEIL(234.26) FROM DUAL;

FLOOR(234.36) FLOOR(-234.36) CEIL(-234.26) CEIL(234.26)                         
------------- -------------- ------------- ------------                         
          234           -235          -234          235                         

SQL> 
SQL> SELECT PRJID, TO_CHAR(START_DATE, 'DD-Month-YYYY') START_DATE,
  2  TO_CHAR(END_DATE, 'DD-Month-YYYY') END_DATE FROM PRJ_DETAILS;

PRJ START_DATE                                                                  
--- --------------------------------------------                                
END_DATE                                                                        
--------------------------------------------                                    
P1  10-January  -2020                                                           
11-October  -2022                                                               
                                                                                
P2  01-January  -2019                                                           
10-July     -2021                                                               
                                                                                
P3  03-November -2021                                                           
10-October  -2023                                                               
                                                                                

PRJ START_DATE                                                                  
--- --------------------------------------------                                
END_DATE                                                                        
--------------------------------------------                                    
P4  28-February -2020                                                           
09-June     -2021                                                               
                                                                                
P5  07-August   -2018                                                           
04-February -2020                                                               
                                                                                
P6  21-February -2019                                                           
07-August   -2020                                                               
                                                                                

PRJ START_DATE                                                                  
--- --------------------------------------------                                
END_DATE                                                                        
--------------------------------------------                                    
P8  21-March    -2019                                                           
10-September-2020                                                               
                                                                                
P7  21-February -2020                                                           
08-August   -2021                                                               
                                                                                
P9  25-April    -2020                                                           
14-November -2020                                                               
                                                                                

9 rows selected.

SQL> 
SQL> SELECT PRJID, TO_CHAR(ACTUAL_END_DATE,'Month') CLOSING_MONTH,
  2  TO_CHAR(ACTUAL_END_DATE, 'YYYY') CLOSING_YEAR FROM PRJ_DETAILS;

PRJ CLOSING_MONTH                        CLOS                                   
--- ------------------------------------ ----                                   
P1  October                              2022                                   
P2  July                                 2021                                   
P3  October                              2023                                   
P4  January                              2022                                   
P5  November                             2020                                   
P6  December                             2020                                   
P8  January                              2021                                   
P7  December                             2021                                   
P9  February                             2021                                   

9 rows selected.

SQL> 
SQL> SELECT TO_CHAR(START_DATE,'DD') DAY, TO_CHAR(START_DATE,'MON') MONTH,
  2  TO_CHAR(START_DATE,'YYYY') YEAR FROM PRJ_DETAILS;

DA MONTH        YEAR                                                            
-- ------------ ----                                                            
10 JAN          2020                                                            
01 JAN          2019                                                            
03 NOV          2021                                                            
28 FEB          2020                                                            
07 AUG          2018                                                            
21 FEB          2019                                                            
21 MAR          2019                                                            
21 FEB          2020                                                            
25 APR          2020                                                            

9 rows selected.

SQL> 
SQL> SELECT PRJ_NAME, round(MONTHS_BETWEEN(END_DATE,START_DATE)) NUM_MONTHS FROM PRJ_DETAILS;

PRJ_NAME   NUM_MONTHS                                                           
---------- ----------                                                           
SPYDER             33                                                           
APOLLO             30                                                           
UNICORN            23                                                           
ZEUS               15                                                           
JUPITER            18                                                           
MARS               18                                                           
PLUTO              18                                                           
SATURN             18                                                           
SUN                 7                                                           

9 rows selected.

SQL> 
SQL> SELECT PRJ_NAME, END_DATE, ADD_MONTHS(END_DATE,2) TWO_MONTHS_LATER FROM PRJ_DETAILS;

PRJ_NAME   END_DATE  TWO_MONTH                                                  
---------- --------- ---------                                                  
SPYDER     11-OCT-22 11-DEC-22                                                  
APOLLO     10-JUL-21 10-SEP-21                                                  
UNICORN    10-OCT-23 10-DEC-23                                                  
ZEUS       09-JUN-21 09-AUG-21                                                  
JUPITER    04-FEB-20 04-APR-20                                                  
MARS       07-AUG-20 07-OCT-20                                                  
PLUTO      10-SEP-20 10-NOV-20                                                  
SATURN     08-AUG-21 08-OCT-21                                                  
SUN        14-NOV-20 14-JAN-21                                                  

9 rows selected.

SQL> 
SQL> SELECT NEXT_DAY(TO_CHAR(LOCALTIMESTAMP,'DD-MON-YYYY'),'THURSDAY') NEXT_THURSDAY
  2  FROM DUAL;

NEXT_THUR                                                                       
---------                                                                       
19-MAY-22                                                                       

SQL> spool off;
