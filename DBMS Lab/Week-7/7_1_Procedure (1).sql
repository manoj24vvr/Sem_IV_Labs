-- Q.7.1(PROCEDURE)

CREATE OR REPLACE PROCEDURE Withdraw_Money
(v_accno IN number, v_withdraw IN number) IS
v_final_bal NUMBER;
v_bal NUMBER;
e_Low_Balance EXCEPTION;

BEGIN

SELECT BALANCE INTO v_bal FROM account WHERE account_number = v_accno;

v_final_bal := v_bal - v_withdraw;

dbms_output.put_line('Current Balance: ' || v_bal);

IF v_final_bal > 1000 THEN 

	dbms_output.put_line('Withdrawal of amount ' || v_withdraw || ' is Successful');

	UPDATE ACCOUNT SET BALANCE = v_final_bal WHERE ACCOUNT_NUMBER = v_accno;

	dbms_output.put_line('Updated Current Balance: ' || v_final_bal);

ELSE
	RAISE e_Low_Balance;

END IF;

EXCEPTION
WHEN e_Low_Balance THEN

	dbms_output.put_line('Insufficient fund to withdraw, Try with lesser withdrawal amount');

END Withdraw_Money;
/