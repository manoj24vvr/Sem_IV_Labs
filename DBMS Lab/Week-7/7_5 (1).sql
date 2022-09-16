-- Q.7.5


--FUNCTION:

CREATE OR REPLACE FUNCTION clients_phCode(v_ph_code IN VARCHAR2) RETURN NUMBER IS
v_temp NUMBER := 1;

CURSOR c_client_names IS SELECT name FROM client WHERE phone LIKE concat(v_ph_code, '%');

BEGIN

dbms_output.put_line('The Names of clients with phone code ' || v_ph_code || ' are: ');

FOR i IN c_client_names LOOP

	dbms_output.put_line(i.name);

END LOOP;

RETURN v_temp;

END clients_phCode;
/


--INVOKING PL/SQL BLOCK:

SET SERVEROUTPUT ON
DECLARE

v_phone_code VARCHAR2(3);
v_temp NUMBER;

BEGIN

v_phone_code := '&v_phone_code';

v_temp := clients_phCode(v_phone_code);

dbms_output.put_line('The process was Successful or Not: ' || v_temp);


END;
/