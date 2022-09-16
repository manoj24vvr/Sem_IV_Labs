SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  num1 number(5);
  4  num2 number(5);
  5  rev number(5) := 0;
  6  
  7  BEGIN
  8  
  9  num1:=&num1;
 10  while num1>0
 11  loop
 12  num2:=num1 mod 10;
 13  rev:=num2+(rev*10);
 14  num1:=floor(num1/10);
 15  end loop;
 16  
 17  dbms_output.put_line('Reversed number is: '||rev);
 18  
 19  END;
 20  /
Enter value for num1: 254
old   9: num1:=&num1;
new   9: num1:=254;
Reversed number is: 452                                                         

PL/SQL procedure successfully completed.

SQL> DECLARE
  2  
  3  s VARCHAR2(10);
  4  l VARCHAR2(20);
  5  t VARCHAR2(10);
  6  
  7  BEGIN
  8  
  9  s:=&s;
 10  FOR i IN REVERSE 1..Length(s) LOOP
 11  l := Substr(s, i, 1);
 12  t := t||''||l;
 13  END LOOP;
 14  IF t = s THEN
 15  dbms_output.Put_line(t||''||' is palindrome');
 16  ELSE
 17  dbms_output.Put_line(t||''||' is not a palindrome');
 18  END IF;
 19  
 20  END;
 21  /
Enter value for s: Manoj
old   9: s:=&s;
new   9: s:=Manoj;
s:=Manoj;
   *
ERROR at line 9:
ORA-06550: line 9, column 4: 
PLS-00201: identifier 'MANOJ' must be declared 
ORA-06550: line 9, column 1: 
PL/SQL: Statement ignored 


SQL> DECLARE
  2  
  3  s VARCHAR2(10);
  4  l VARCHAR2(20);
  5  t VARCHAR2(10);
  6  
  7  BEGIN
  8  
  9  s:=&s;
 10  FOR i IN REVERSE 1..Length(s) LOOP
 11  l := Substr(s, i, 1);
 12  t := t||''||l;
 13  END LOOP;
 14  IF t = s THEN
 15  dbms_output.Put_line(t||''||' is palindrome');
 16  ELSE
 17  dbms_output.Put_line(t||''||' is not a palindrome');
 18  END IF;
 19  
 20  END;
 21  /
Enter value for s: 'Manoj'
old   9: s:=&s;
new   9: s:='Manoj';
jonaM is not a palindrome                                                       

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_sentence varchar2(100);
  4  --v_sentence varchar(100);
  5  v_vowels number:=0;
  6  v_consonents number:=0;
  7  v_numbers number:=0;
  8  v_special_char number:=0;
  9  C char;
 10  
 11  BEGIN
 12  
 13  v_sentence := '&v_sentence';
 14  
 15  FOR i IN 1..LENGTH(v_sentence) LOOP
 16  
 17  C:= SUBSTR(v_sentence, i, 1);
 18  
 19  IF C IN ('A', 'E', 'I', 'O', 'U' ) OR C IN ( 'a', 'e', 'i', 'o', 'u' ) THEN v_vowels := v_vowels + 1;
 20  
 21  ELSIF C IN ('!','#','$','%','&','(',')','*','+',',','-','.','/',':',';','<','=','>','?','@','[','\',']','^','_','`','{','|','}','~') THEN  v_special_char := v_special_char + 1;
 22  
 23  ELSIF C IN ('0','1','2','3','4','5','6','7','8','9') THEN v_numbers := v_numbers + 1;
 24  
 25  ELSIF C NOT IN (' ') THEN v_consonents := v_consonents + 1;
 26  
 27  END IF;
 28  END LOOP;
 29  
 30  dbms_output.Put_line('No. of Vowels: ' || v_vowels);
 31  dbms_output.Put_line('No. of Consonants: ' || v_consonents);
 32  dbms_output.Put_line('No. of Numbers: ' || v_numbers);
 33  dbms_output.Put_line('No. of Special Characters: ' || v_special_char);
 34  
 35  END;
 36  /
Enter value for v_sentence: Manoj24 is a good boy.
old  13: v_sentence := '&v_sentence';
new  13: v_sentence := 'Manoj24 is a good boy.';
No. of Vowels: 7                                                                
No. of Consonants: 8                                                            
No. of Numbers: 2                                                               
No. of Special Characters: 1                                                    

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_emp_code number(3);
  4  
  5  v_emp emp%rowtype;
  6  
  7  BEGIN
  8  
  9  v_emp_code := &v_emp_code;
 10  
 11  SELECT * INTO v_emp FROM emp where empcode = v_emp_code;
 12  
 13  dbms_output.Put_line('Employee Code of Employee is: ' || v_emp.empcode);
 14  dbms_output.Put_line('Name of Employee is:          ' || v_emp.name);
 15  dbms_output.Put_line('Qualification of Employee is: ' || v_emp.qualification);
 16  dbms_output.Put_line('Phone of Employee is:         ' || v_emp.phone);
 17  dbms_output.Put_line('Email of Employee is:         ' || v_emp.email);
 18  dbms_output.Put_line('Designation of Employee is:   ' || v_emp.designation);
 19  dbms_output.Put_line('Salary of Employee is:        ' || v_emp.salary);
 20  dbms_output.Put_line('Given Employee Reports To Employee with Employee Code: ' || v_emp.reports_to);
 21  
 22  END;
 23  /
Enter value for v_emp_code: 102
old   9: v_emp_code := &v_emp_code;
new   9: v_emp_code := 102;
Employee Code of Employee is: 102                                               
Name of Employee is:          VIJAY                                             
Qualification of Employee is: BTECH                                             
Phone of Employee is:         1234567892                                        
Email of Employee is:         vijay@digisol.com                                 
Designation of Employee is:   PROJECT MANAGER                                   
Salary of Employee is:        120000                                            
Given Employee Reports To Employee with Employee Code: 110                      

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_empcode number(3);
  4  v_prj_id char(2);
  5  v_rating char;
  6  v_incentive number;
  7  
  8  v_work work_exp%rowtype;
  9  v_emp emp%rowtype;
 10  v_prj prj_details%rowtype;
 11  --v_paycheck pay_check%rowtype;
 12  
 13  BEGIN
 14  
 15  v_empcode := &v_empcode;
 16  v_prj_id := '&v_prj_id';
 17  
 18  SELECT * INTO v_work FROM work_exp WHERE empcode = v_empcode AND prjid = v_prj_id;
 19  SELECT * INTO v_emp FROM emp WHERE empcode = v_empcode;
 20  SELECT * INTO v_prj FROM prj_details WHERE prjid = v_prj_id;
 21  --SELECT * INTO v_paycheck FROM pay_check WHERE empcode = v_empcode;
 22  
 23  SELECT v_work.rating INTO v_rating FROM work_exp WHERE empcode = v_empcode AND prjid = v_prj_id;
 24  --v_rating := v_work.rating;
 25  
 26  IF v_rating = 'A' THEN v_incentive := 10000;
 27  
 28  ELSIF v_rating = 'B' THEN v_incentive := 5000;
 29  
 30  ELSIF v_rating = 'c' THEN v_incentive := 3000;
 31  
 32  ELSE v_incentive :=0;
 33  
 34  END IF;
 35  
 36  dbms_output.Put_line('Employee Number: ' || v_work.empcode);
 37  dbms_output.Put_line('Employee Name:   ' || v_emp.name);
 38  dbms_output.Put_line('Salary:          ' || v_emp.salary);
 39  dbms_output.Put_line('Project Name:    ' || v_prj.prj_name);
 40  dbms_output.Put_line('Rating:          ' || v_work.rating);
 41  dbms_output.Put_line('Incentive:       ' || v_incentive);
 42  dbms_output.Put_line('Total Salary:    ' || to_char(v_emp.salary+v_incentive));
 43  
 44  dbms_output.Put_line('Other Iincentives Updated: ' ||  v_incentive);
 45  
 46  UPDATE pay_check SET other_incentives =  other_incentives + v_incentive WHERE empcode = v_empcode;
 47  
 48  END;
 49  /
Enter value for v_empcode: 102
old  15: v_empcode := &v_empcode;
new  15: v_empcode := 102;
Enter value for v_prj_id: P2
old  16: v_prj_id := '&v_prj_id';
new  16: v_prj_id := 'P2';
Employee Number: 102                                                            
Employee Name:   VIJAY                                                          
Salary:          120000                                                         
Project Name:    APOLLO                                                         
Rating:          B                                                              
Incentive:       5000                                                           
Total Salary:    125000                                                         
Other Iincentives Updated: 5000                                                 

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  v_emp_code number(3) := 100;
  4  --v_pay_date date := '01-JAN-2021';
  5  
  6  v_emp emp%rowtype;
  7  v_pay pay_check%rowtype;
  8  
  9  BEGIN
 10  
 11  SELECT * INTO v_emp FROM emp WHERE empcode = v_emp_code;
 12  SELECT * INTO v_pay FROM pay_check WHERE empcode = v_emp_code AND pay_date = to_date('01-01-2021', 'DD-MM-YYYY');
 13  
 14  dbms_output.Put_line('Name:              ' || v_emp.name);
 15  dbms_output.Put_line('Basic_Salary:      ' || v_emp.salary);
 16  dbms_output.Put_line('Regular Increment: ' || v_pay.Regular_Increment);
 17  dbms_output.Put_line('Increased Basic Salary: ' || to_char(v_emp.Salary+v_pay.Regular_Increment));
 18  dbms_output.Put_line('Performance incentive:  ' || v_pay.performance_incentive);
 19  dbms_output.Put_line('DA is:                  '|| v_pay.da*0.5);
 20  --dbms_output.Put_line('DA is:                '|| to_char(v_pay.da*0.5));
 21  dbms_output.Put_line('PF is:                  ' || v_pay.pf*0.12);
 22  --dbms_output.Put_line('PF is:                ' || to_char(v_pay.pf*0.12));
 23  dbms_output.Put_line('Other Incentive:        ' || v_pay.other_incentives);
 24  dbms_output.Put_line('Advance tax paid:       ' || v_pay.advanc_tax);
 25  dbms_output.Put_line('Monthly Gross Salary:   ' || to_char(v_emp.Salary+v_pay.Regular_Increment+v_pay.Performance_incentive+v_pay.DA+v_pay.PF+v_pay.other_incentives));
 26  dbms_output.Put_line('Monthly Take home salary: ' ||  to_char(v_emp.Salary+v_pay.Regular_Increment+v_pay.Performance_incentive+v_pay.DA+v_pay.PF+v_pay.other_incentives-v_pay.PF-v_pay.advanc_tax));
 27  
 28  END;
 29  /
Name:              RAJESH                                                       
Basic_Salary:      105000                                                       
Regular Increment: 3000                                                         
Increased Basic Salary: 108000                                                  
Performance incentive:  3000                                                    
DA is:                  2250                                                    
PF is:                  600                                                     
Other Incentive:        450                                                     
Advance tax paid:       4000                                                    
Monthly Gross Salary:   120950                                                  
Monthly Take home salary: 111950                                                

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  CURSOR c_emp IS SELECT empcode, name, salary, regular_increment, performance_incentive, other_incentives, advanc_tax FROM emp NATURAL JOIN pay_check
  4  WHERE pay_date = to_date('01-01-2021', 'DD-MM-YYYY');
  5  
  6  c_da pay_check.da%type;
  7  c_pf pay_check.pf%type;
  8  c_incsal emp.salary%type;
  9  c_mgross emp.salary%type;
 10  c_home emp.salary%type;
 11  
 12  BEGIN
 13  
 14  FOR i IN c_emp LOOP
 15  
 16  c_incsal := i.salary + i.regular_increment;
 17  c_da := c_incsal*0.5;
 18  c_pf := c_incsal*0.12;
 19  c_mgross := i.salary + i.regular_increment + i.performance_incentive + c_da + c_pf + i.other_incentives;
 20  c_home := c_mgross - c_pf - i.advanc_tax;
 21  dbms_output.put_line('Name:           '|| i.name);
 22  dbms_output.put_line('Basic_Salary:   '|| i.salary);
 23  dbms_output.put_line('Increased Basic Salary:   '|| c_incsal);
 24  dbms_output.put_line('Performance Incentive:    '|| i.performance_incentive);
 25  dbms_output.put_line('DA:  '|| c_da);
 26  dbms_output.put_line('PF:  '|| c_pf);
 27  dbms_output.put_line('Other Incentive:          '|| i.other_incentives);
 28  dbms_output.put_line('Advance Tax Paid:         '|| i.advanc_tax);
 29  dbms_output.put_line('Monthly Gross Salary:     '|| c_mgross);
 30  dbms_output.put_line('Monthly Take Home Salary: '|| c_home);
 31  
 32  END LOOP;
 33  
 34  END;
 35  /
Name:           RAJESH                                                          
Basic_Salary:   105000                                                          
Increased Basic Salary:   108000                                                
Performance Incentive:    3000                                                  
DA:  54000                                                                      
PF:  12960                                                                      
Other Incentive:          450                                                   
Advance Tax Paid:         4000                                                  
Monthly Gross Salary:     178410                                                
Monthly Take Home Salary: 161450                                                
Name:           VIJAY                                                           
Basic_Salary:   120000                                                          
Increased Basic Salary:   125000                                                
Performance Incentive:    3600                                                  
DA:  62500                                                                      
PF:  15000                                                                      
Other Incentive:                                                                
Advance Tax Paid:         9000                                                  
Monthly Gross Salary:                                                           
Monthly Take Home Salary:                                                       

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  CURSOR c_prj IS SELECT empcode, prj_name, lead_by_empcode FROM emp NATURAL JOIN work_exp NATURAL JOIN prj_details WHERE actual_budget > budget_allocated;
  4  
  5  prj_lead emp.name%type;
  6  
  7  BEGIN
  8  
  9  FOR i IN c_prj LOOP
 10  
 11  SELECT name INTO prj_lead FROM emp WHERE empcode = i.lead_by_empcode;
 12  dbms_output.put_line('Name of the Project Leader: ' || prj_lead);
 13  dbms_output.put_line('Name of the Project:        ' || i.prj_name);
 14  
 15  END LOOP;
 16  
 17  END;
 18  /
Name of the Project Leader: AJAY                                                
Name of the Project:        APOLLO                                              
Name of the Project Leader: AJAY                                                
Name of the Project:        APOLLO                                              
Name of the Project Leader: AJAY                                                
Name of the Project:        APOLLO                                              
Name of the Project Leader: RAJ                                                 
Name of the Project:        UNICORN                                             
Name of the Project Leader: RAJ                                                 
Name of the Project:        UNICORN                                             
Name of the Project Leader: NIKHITH                                             
Name of the Project:        SUN                                                 

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  CURSOR c_emp IS SELECT name, designation from emp;
  4  
  5  BEGIN
  6  
  7  FOR i IN c_emp LOOP
  8  
  9  dbms_output.put_line('Name:            ' || i.name);
 10  dbms_output.put_line('Designation:     ' || i.designation);
 11  dbms_output.put_line('Email Generated: ' || i.name || '.' || i.designation || '@digisoul.com');
 12  
 13  END LOOP;
 14  
 15  END;
 16  /
Name:            RAJESH                                                         
Designation:     DEVELOPER                                                      
Email Generated: RAJESH.DEVELOPER@digisoul.com                                  
Name:            RAVI                                                           
Designation:     PROJECT LEADER                                                 
Email Generated: RAVI.PROJECT LEADER@digisoul.com                               
Name:            VIJAY                                                          
Designation:     PROJECT MANAGER                                                
Email Generated: VIJAY.PROJECT MANAGER@digisoul.com                             
Name:            AJAY                                                           
Designation:     TECHNICAL HEAD                                                 
Email Generated: AJAY.TECHNICAL HEAD@digisoul.com                               
Name:            BHASKAR                                                        
Designation:     PROJECT DIRECTOR                                               
Email Generated: BHASKAR.PROJECT DIRECTOR@digisoul.com                          
Name:            RAJ                                                            
Designation:     PROJECT LEADER                                                 
Email Generated: RAJ.PROJECT LEADER@digisoul.com                                
Name:            MANISH                                                         
Designation:     DEVELOPER                                                      
Email Generated: MANISH.DEVELOPER@digisoul.com                                  
Name:            PRASAD                                                         
Designation:     CEO                                                            
Email Generated: PRASAD.CEO@digisoul.com                                        
Name:            RAKESH                                                         
Designation:     DEVELOPER                                                      
Email Generated: RAKESH.DEVELOPER@digisoul.com                                  
Name:            RAKSH                                                          
Designation:     DEVELOPER                                                      
Email Generated: RAKSH.DEVELOPER@digisoul.com                                   
Name:            VENKAT                                                         
Designation:     PROJECT LEADER                                                 
Email Generated: VENKAT.PROJECT LEADER@digisoul.com                             
Name:            BALAJI                                                         
Designation:     PROJECT DIRECTOR                                               
Email Generated: BALAJI.PROJECT DIRECTOR@digisoul.com                           
Name:            NIKHITH                                                        
Designation:     TECHNICAL HEAD                                                 
Email Generated: NIKHITH.TECHNICAL HEAD@digisoul.com                            
Name:            PAVAN                                                          
Designation:     PROJECT MANAGER                                                
Email Generated: PAVAN.PROJECT MANAGER@digisoul.com                             

PL/SQL procedure successfully completed.

SQL> 
SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  CURSOR c_emp(par_rating CHAR, par_clientID VARCHAR2)
  4  IS SELECT E.empcode Emp_code, name, designation
  5  FROM emp E, work_exp W
  6  WHERE E.empcode = W.empcode AND rating = par_rating AND clientid = par_clientID;
  7  
  8  BEGIN
  9  
 10  FOR i IN c_emp('&par_clientID', '&par_rating') LOOP
 11  
 12  dbms_output.put_line('Employee Code:        ' || i.Emp_code);
 13  dbms_output.put_line('Employee Name:        ' || i.name);
 14  dbms_output.put_line('Employee Designation: ' || i.designation);
 15  
 16  END LOOP;
 17  
 18  END;
 19  /
Enter value for par_clientid: 
Enter value for par_rating: 
old  10: FOR i IN c_emp('&par_clientID', '&par_rating') LOOP
new  10: FOR i IN c_emp('', '') LOOP

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  CURSOR c_emp(par_rating CHAR, par_clientID VARCHAR2)
  4  IS SELECT E.empcode Emp_code, name, designation
  5  FROM emp E, work_exp W
  6  WHERE E.empcode = W.empcode AND rating = par_rating AND clientid = par_clientID;
  7  
  8  BEGIN
  9  
 10  FOR i IN c_emp('&par_clientID', '&par_rating') LOOP
 11  
 12  dbms_output.put_line('Employee Code:        ' || i.Emp_code);
 13  dbms_output.put_line('Employee Name:        ' || i.name);
 14  dbms_output.put_line('Employee Designation: ' || i.designation);
 15  
 16  END LOOP;
 17  
 18  END;
 19  /
Enter value for par_clientid: C5
Enter value for par_rating: C
old  10: FOR i IN c_emp('&par_clientID', '&par_rating') LOOP
new  10: FOR i IN c_emp('C5', 'C') LOOP

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2  
  3  CURSOR c_emp IS SELECT name, SUM(work_experience) total_work_experience FROM emp NATURAL JOIN work_exp GROUP BY name ORDER BY total_work_experience DESC;
  4  
  5  v_emp_name emp.name%type;
  6  v_work_exp work_exp.work_experience%type;
  7  i number(1) := 1;
  8  
  9  BEGIN
 10  
 11  OPEN c_emp;
 12  
 13  LOOP
 14  
 15  EXIT WHEN i > 5;
 16  FETCH c_emp INTO v_emp_name, v_work_exp;
 17  i := i + 1;
 18  dbms_output.put_line('--------------------');
 19  dbms_output.put_line('Employee Name: ' || v_emp_name);
 20  dbms_output.put_line('Total Work Experience: ' || v_work_exp);
 21  
 22  END LOOP;
 23  
 24  CLOSE c_emp;
 25  
 26  END;
 27  /
--------------------                                                            
Employee Name: VIJAY                                                            
Total Work Experience: 36                                                       
--------------------                                                            
Employee Name: RAJESH                                                           
Total Work Experience: 35                                                       
--------------------                                                            
Employee Name: RAJ                                                              
Total Work Experience: 30                                                       
--------------------                                                            
Employee Name: BHASKAR                                                          
Total Work Experience: 28                                                       
--------------------                                                            
Employee Name: MANISH                                                           
Total Work Experience: 24                                                       

PL/SQL procedure successfully completed.

SQL> spool off;
