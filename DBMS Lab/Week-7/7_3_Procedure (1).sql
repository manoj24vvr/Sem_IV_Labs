-- Q.7.3(PROCEDURE)

CREATE OR REPLACE PROCEDURE Add_Bud_Caln
(v_project_id IN VARCHAR2, v_add_Bud_needed OUT NUMBER) IS
v_prj prj_details%ROWTYPE;
v_dur_prj_days number;
v_per_day_cost_prj number;
v_addtl_days number;

BEGIN

SELECT * INTO v_prj FROM prj_details WHERE TRIM(prjid) = v_project_id;

SELECT to_date(end_date, 'dd-mm-yyyy') - to_date(start_date, 'dd-mm-yyyy') INTO v_dur_prj_days FROM prj_details WHERE TRIM(prjid) = v_project_id;

v_per_day_cost_prj := (v_prj.BUDGET_ALLOCATED)/(v_dur_prj_days);

SELECT to_date(actual_end_date, 'dd-mm-yyyy') - to_date(end_date, 'dd-mm-yyyy') INTO v_addtl_days FROM prj_details WHERE TRIM(prjid) = v_project_id;

v_add_Bud_needed := v_addtl_days*v_per_day_cost_prj;

END Add_Bud_Caln;
/