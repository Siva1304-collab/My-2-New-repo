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

