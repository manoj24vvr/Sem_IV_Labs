SQL> create table EMP(
  2  EMPCODE number(3) CONSTRAINT PK_EMPNO Primary key,
  3  Name varchar2(10),
  4  QUALIFICATION varchar2(7) CONSTRAINT VALID_QUALIF check(QUALIFICATION IN ('BTECH','MTECH','MSC','MCA','PHD')),
  5  PHONE number(10),
  6  EMAIL varchar2(20) CONSTRAINT EMAIL_DOMAIN check(EMAIL LIKE '%@digisol.com'),
  7  DESIGNATION varchar2(20) CONSTRAINT VALID_DESIGNATION check(DESIGNATION IN ('DEVELOPER','PROJECT LEADER','PROJECT MANAGER','TECHNICAL HEAD','PROJECT DIRECTOR','PROJECT LEADER','CEO')),
  8  SALARY NUMBER(7) CONSTRAINT SALARY_RANGE CHECK(salary between 97000 and 300000));
create table EMP(
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object 


SQL> drop table emp;

Table dropped.

SQL> create table EMP(
  2  EMPCODE number(3) CONSTRAINT PK_EMPNO Primary key,
  3  Name varchar2(10),
  4  QUALIFICATION varchar2(7) CONSTRAINT VALID_QUALIF check(QUALIFICATION IN ('BTECH','MTECH','MSC','MCA','PHD')),
  5  PHONE number(10),
  6  EMAIL varchar2(20) CONSTRAINT EMAIL_DOMAIN check(EMAIL LIKE '%@digisol.com'),
  7  DESIGNATION varchar2(20) CONSTRAINT VALID_DESIGNATION check(DESIGNATION IN ('DEVELOPER','PROJECT LEADER','PROJECT MANAGER','TECHNICAL HEAD','PROJECT DIRECTOR','PROJECT LEADER','CEO')),
  8  SALARY NUMBER(7) CONSTRAINT SALARY_RANGE CHECK(salary between 97000 and 300000));

Table created.

SQL> desc emp;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPCODE                                   NOT NULL NUMBER(3)
 NAME                                               VARCHAR2(10)
 QUALIFICATION                                      VARCHAR2(7)
 PHONE                                              NUMBER(10)
 EMAIL                                              VARCHAR2(20)
 DESIGNATION                                        VARCHAR2(20)
 SALARY                                             NUMBER(7)

SQL> spool off;
