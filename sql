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

