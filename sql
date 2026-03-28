#developer-1 code
CREATE OR REPLACE PACKAGE dynamic_pkg AS
   PROCEDURE delete_data(p_table VARCHAR2);
END;
/

CREATE OR REPLACE PACKAGE BODY dynamic_pkg AS

   PROCEDURE delete_data(p_table VARCHAR2) IS
   BEGIN
      EXECUTE IMMEDIATE 'DELETE FROM ' || p_table;
   END;

END;
/

#developer-2 code
CREATE OR REPLACE PACKAGE cursor_pkg AS
   PROCEDURE process_employees;
END;
/

CREATE OR REPLACE PACKAGE BODY cursor_pkg AS

   PROCEDURE process_employees IS
      CURSOR emp_cur IS SELECT employee_id, salary FROM employees;
      v_bonus NUMBER;
   BEGIN
      FOR rec IN emp_cur LOOP
         v_bonus := rec.salary * 0.10;

         UPDATE employees
         SET salary = salary + v_bonus
         WHERE employee_id = rec.employee_id;
      END LOOP;
   END;

END;
/

#Developer-7 code
CREATE OR REPLACE PACKAGE audit_pkg AS
   PROCEDURE log_action(p_user VARCHAR2, p_action VARCHAR2);
END;
/

CREATE OR REPLACE PACKAGE BODY audit_pkg AS

   PROCEDURE log_action(p_user VARCHAR2, p_action VARCHAR2) IS
   BEGIN
      INSERT INTO audit_table(user_name, action, action_date)
      VALUES (p_user, p_action, SYSDATE);
   END;

END;
/

#developer-8 code
CREATE OR REPLACE PACKAGE notify_pkg AS
   PROCEDURE send_email(p_to VARCHAR2, p_msg VARCHAR2);
END;
/

CREATE OR REPLACE PACKAGE BODY notify_pkg AS

   PROCEDURE send_email(p_to VARCHAR2, p_msg VARCHAR2) IS
   BEGIN
      DBMS_OUTPUT.PUT_LINE('Email sent to ' || p_to || ': ' || p_msg);
   END;

END;
/
