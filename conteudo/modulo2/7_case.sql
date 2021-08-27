--exemplo usando case
SET SERVEROUTPUT ON
ACCEPT v_nota_dig PROMPT 'Digite sua Nota:'

DECLARE
      v_nota integer;
    BEGIN
      v_nota := &v_nota_dig;
    
     CASE v_nota
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('Nota Excelente');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('Nota muito boa');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('Boa nota');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('Nota na media');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('Nota abaixo da media');
        ELSE DBMS_OUTPUT.PUT_LINE('Sem classificacao de notas');
      END CASE;
   END;
   /
   
 -- exemplo usando case com EXCEPTION  
SET SERVEROUTPUT ON
ACCEPT v_nota_dig PROMPT 'Digite sua Nota:'

DECLARE
      v_nota integer;
    BEGIN
      v_nota := &v_nota_dig;   
     CASE v_nota
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('Nota Excelente');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('Nota muito boa');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('Boa nota');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('Nota na media');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('Nota abaixo da media');
      END CASE;
      EXCEPTION
        WHEN CASE_NOT_FOUND THEN
          DBMS_OUTPUT.PUT_LINE('Sem classificacao de notas');
   END;
   /
   