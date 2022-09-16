/* Back Up File of DBMS LAB-7 programs */



SQL*Plus: Release 19.0.0.0.0 - Production on Mon May 16 08:38:11 2022
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

Enter user-name: dse068@mcaorcl
Enter password:
Last Successful login time: Mon May 09 2022 10:14:09 +05:30

Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

*--------------------*--------------------*
[Q.7.1]: -

SQL> CREATE OR REPLACE PROCEDURE Withdraw_Money
  2  (v_accno IN number, v_withdraw IN number) IS
  3  v_final_bal NUMBER;
  4  v_bal NUMBER;
  5  e_Low_Balance EXCEPTION;
  6
  7  BEGIN
  8
  9  SELECT BALANCE INTO v_bal FROM account WHERE account_number = v_accno;
 10
 11  v_final_bal := v_bal - v_withdraw;
 12
 13  dbms_output.put_line('Current Balance: ' || v_bal);
 14
 15  IF v_final_bal > 1000 THEN
 16
 17  dbms_output.put_line('Withdrawal of amount ' || v_withdraw || ' is Successful');
 18
 19  UPDATE ACCOUNT SET BALANCE = v_final_bal WHERE ACCOUNT_NUMBER = v_accno;
 20
 21  dbms_output.put_line('Updated Current Balance: ' || v_final_bal);
 22
 23  ELSE
 24  RAISE e_Low_Balance;
 25
 26  END IF;
 27
 28  EXCEPTION
 29  WHEN e_Low_Balance THEN
 30
 31  dbms_output.put_line('Insufficient fund to withdraw, Try with lesser withdrawal amount');
 32
 33  END Withdraw_Money;
 34  /

Procedure created.

BEFORE PROCEDURE VALUES:

SQL> select * from account;

ACCOUNT_NUMBER    BALANCE
-------------- ----------
           101      10000
           102      20000
           103      30000
           104      40000
           105      50000

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2
  3  v_accno number;
  4  v_withdraw number;
  5
  6  BEGIN
  7
  8  v_accno := &v_accno;
  9  v_withdraw := &v_withdraw;
 10
 11  Withdraw_Money(v_accno, v_withdraw);
 12
 13  END;
 14  /
Enter value for v_accno: 101
old   8: v_accno := &v_accno;
new   8: v_accno := 101;
Enter value for v_withdraw: 9999
old   9: v_withdraw := &v_withdraw;
new   9: v_withdraw := 9999;
Current Balance: 10000
Insufficient fund to withdraw, Try with lesser withdrawal amount

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2
  3  v_accno number;
  4  v_withdraw number;
  5
  6  BEGIN
  7
  8  v_accno := &v_accno;
  9  v_withdraw := &v_withdraw;
 10
 11  Withdraw_Money(v_accno, v_withdraw);
 12
 13  END;
 14  /
Enter value for v_accno: 101
old   8: v_accno := &v_accno;
new   8: v_accno := 101;
Enter value for v_withdraw: 1000
old   9: v_withdraw := &v_withdraw;
new   9: v_withdraw := 1000;
Current Balance: 10000
Withdrawal of amount 1000 is Successful
Updated Current Balance: 9000

PL/SQL procedure successfully completed.

AFTER PROCEDURE VALUES:

SQL> select * from account;

ACCOUNT_NUMBER    BALANCE
-------------- ----------
           101       9000
           102      20000
           103      30000
           104      40000
           105      50000



*--------------------*--------------------*
[Q.7.2]: -




*--------------------*--------------------*
[Q.7.3]: -

SQL> CREATE OR REPLACE PROCEDURE Add_Bud_Caln
  2  (v_project_id IN VARCHAR2, v_add_Bud_needed OUT NUMBER) IS
  3  v_prj prj_details%ROWTYPE;
  4  v_dur_prj_days number;
  5  v_per_day_cost_prj number;
  6  v_addtl_days number;
  7
  8  BEGIN
  9
 10  SELECT * INTO v_prj FROM prj_details WHERE TRIM(prjid) = v_project_id;
 11
 12  SELECT to_date(end_date, 'dd-mm-yyyy') - to_date(start_date, 'dd-mm-yyyy') INTO v_dur_prj_days FROM prj_details WHERE TRIM(prjid) = v_project_id;
 13
 14  v_per_day_cost_prj := (v_prj.BUDGET_ALLOCATED)/(v_dur_prj_days);
 15
 16  SELECT to_date(actual_end_date, 'dd-mm-yyyy') - to_date(end_date, 'dd-mm-yyyy') INTO v_addtl_days FROM prj_details WHERE TRIM(prjid) = v_project_id;
 17
 18  v_add_Bud_needed := v_addtl_days*v_per_day_cost_prj;
 19
 20  END Add_Bud_Caln;
 21  /

Procedure created.


SQL> SET SERVEROUTPUT ON
SQL> DECLARE
  2
  3  v_project_id varchar2(2);
  4  --v_add_Bud_needed number := 0;
  5  v_add_Bud_needed number;
  6  v_name emp.name%type;
  7  v_name_boss emp.name%type;
  8  v_email_boss emp.email%type;
  9
 10
 11  BEGIN
 12
 13  v_project_id := '&v_project_id';
 14
 15  SELECT name INTO v_name FROM emp, prj_details WHERE empcode = lead_by_empcode AND TRIM(prjid) = v_project_id;
 16
 17  SELECT E2.name,E2.email INTO v_name_boss,v_email_boss  FROM emp E1, emp E2, prj_details P WHERE P.lead_by_empcode = E1.empcode AND E1.empcode = E2.reports_to AND TRIM(prjid) = v_project_id;
 18
 19  Add_Bud_Caln(v_project_id, v_add_Bud_needed);
 20
 21  dbms_output.put_line('Name of Project Leader: ' || v_name);
 22  dbms_output.put_line('Name of Employee to whom Project leader reports to: ' || v_name_boss);
 23  dbms_output.put_line('Email of Employee to whom Project leader reports to: ' || v_email_boss);
 24  dbms_output.put_line('Additional Budget Needed: ' || ROUND(v_add_Bud_needed,2));
 25
 26
 27  END;
 28  /
Enter value for v_project_id: P2
old  13: v_project_id := '&v_project_id';
new  13: v_project_id := 'P2';
Name of Project Leader: AJAY
Name of Employee to whom Project leader reports to: RAJ
Email of Employee to whom Project leader reports to: raj@digisol.com
Additional Budget Needed: 563517.92

PL/SQL procedure successfully completed.




*--------------------*--------------------*
[Q.7.4]: -






*--------------------*--------------------*
[Q.7.5]: -

SQL> CREATE OR REPLACE FUNCTION clients_phCode(v_ph_code VARCHAR2) RETURN NUMBER IS
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



*--------------------*--------------------*
[Q.7.6]: -

SQL> CREATE OR REPLACE FUNCTION emp_email_generated RETURN NUMBER IS
  2  v_temp NUMBER := 1;
  3
  4  CURSOR c_emp_email IS SELECT empcode, name FROM emp;
  5
  6  BEGIN
  7
  8  dbms_output.put_line('The Generated Email id of the Employees are: ');
  9
 10  FOR i IN c_emp_email LOOP
 11
 12  dbms_output.put_line(i.name || '_' || i.empcode || '@digisol.com');
 13
 14  END LOOP;
 15
 16  RETURN v_temp;
 17
 18  END emp_email_generated;
 19  /

Function created.

SQL> exec emp_email_generated;
BEGIN emp_email_generated; END;

      *
ERROR at line 1:
ORA-06550: line 1, column 7:
PLS-00221: 'EMP_EMAIL_GENERATED' is not a procedure or is undefined
ORA-06550: line 1, column 7:
PL/SQL: Statement ignored


SQL> var v_temp number;
SQL> exec :v_temp := emp_email_generated;
The Generated Email id of the Employees are:
RAJESH_100@digisol.com
VIJAY_102@digisol.com
AJAY_108@digisol.com
BHASKAR_110@digisol.com
RAJ_106@digisol.com
MANISH_105@digisol.com
RAVI_101@digisol.com
PRASAD_112@digisol.com
RAKESH_113@digisol.com
RAKESH_114@digisol.com
_109@digisol.com
_115@digisol.com
RAJ_111@digisol.com

PL/SQL procedure successfully completed.

SQL> print v_temp;

    V_TEMP
----------
         1


*--------------------*--------------------*
[Q.7.7]: -



