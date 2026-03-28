#developer-3 code
CREATE OR REPLACE PACKAGE auth_pkg AS
   FUNCTION login(p_user VARCHAR2, p_pass VARCHAR2) RETURN VARCHAR2;
END;
/

CREATE OR REPLACE PACKAGE BODY auth_pkg AS

   FUNCTION login(p_user VARCHAR2, p_pass VARCHAR2)
   RETURN VARCHAR2 IS
      v_count NUMBER;
   BEGIN
      SELECT COUNT(*) INTO v_count
      FROM users
      WHERE username = p_user AND password = p_pass;

      IF v_count = 1 THEN
         RETURN 'LOGIN SUCCESS';
      ELSE
         RETURN 'INVALID USER';
      END IF;

   END;

END;
/
#developer-4 code
CREATE OR REPLACE PACKAGE auth_pkg AS
   FUNCTION login(p_user VARCHAR2, p_pass VARCHAR2) RETURN VARCHAR2;
END;
/

CREATE OR REPLACE PACKAGE BODY auth_pkg AS

   FUNCTION login(p_user VARCHAR2, p_pass VARCHAR2)
   RETURN VARCHAR2 IS
      v_count NUMBER;
   BEGIN
      SELECT COUNT(*) INTO v_count
      FROM users
      WHERE username = p_user AND password = p_pass;

      IF v_count = 1 THEN
         RETURN 'LOGIN SUCCESS';
      ELSE
         RETURN 'INVALID USER';
      END IF;

   END;

END;
/

#developer-5 code
CREATE OR REPLACE PACKAGE txn_pkg AS
   PROCEDURE transfer_money(p_from NUMBER, p_to NUMBER, p_amt NUMBER);
END;
/

CREATE OR REPLACE PACKAGE BODY txn_pkg AS

   PROCEDURE transfer_money(p_from NUMBER, p_to NUMBER, p_amt NUMBER) IS
   BEGIN
      UPDATE accounts SET balance = balance - p_amt WHERE account_id = p_from;
      UPDATE accounts SET balance = balance + p_amt WHERE account_id = p_to;

      COMMIT;

   EXCEPTION
      WHEN OTHERS THEN
         ROLLBACK;
         DBMS_OUTPUT.PUT_LINE('Transaction Failed');
   END;

END;
/

# Developer-6 code
CREATE OR REPLACE PACKAGE job_pkg AS
   PROCEDURE run_daily_job;
END;
/

CREATE OR REPLACE PACKAGE BODY job_pkg AS

   PROCEDURE run_daily_job IS
   BEGIN
      DELETE FROM temp_data;
      INSERT INTO temp_data
      SELECT * FROM main_data WHERE created_date = SYSDATE;
   END;

END;
/
