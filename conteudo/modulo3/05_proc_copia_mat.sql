--PROCEDURE PARA COPIA DE MATERIAL
CREATE OR REPLACE PROCEDURE PROC_COPIA_MAT (V_EMP_DE IN NUMBER,
                                            V_EMP_PARA IN NUMBER, 
                                            V_MAT IN NUMBER)
                IS
    --EXCESSOES   
    V_EXECPT_EMP_DE EXCEPTION;
    V_EXECPT_EMP_PARA EXCEPTION;
    V_EXECPT_EMP_MAT_DE EXCEPTION;
    V_EXECPT_EMP_MAT_PARA EXCEPTION;
    --VARIAVES DE APOIO CONTROLE
    V_CONT_EMP_DE NUMBER;
    V_CONT_EMP_PARA NUMBER;
    V_CONT_EMP_MAT_DE NUMBER;
    V_CONT_EMP_MAT_PARA NUMBER;
   
 BEGIN
    --VERIFICA SE EMPRESA ORIGEM EXISTE (DE)
    SELECT COUNT(*) QTD INTO V_CONT_EMP_DE FROM EMPRESA WHERE COD_EMPRESA=V_EMP_DE;
    IF (V_CONT_EMP_DE=0) THEN
        RAISE V_EXECPT_EMP_DE;
    END IF;
    
       --VERIFICA SE EMPRESA DESTINO EXISTE (PARA)
    SELECT COUNT(*) QTD INTO V_CONT_EMP_PARA FROM EMPRESA WHERE COD_EMPRESA=V_EMP_PARA;
    IF (V_CONT_EMP_PARA=0) THEN
        RAISE V_EXECPT_EMP_PARA;
    END IF;
    
     --VERIFICA SE MATERIAL ORIGEM EXISTE
    SELECT COUNT(*) QTD INTO V_CONT_EMP_MAT_DE FROM MATERIAL WHERE COD_EMPRESA=V_EMP_DE AND COD_MAT=V_MAT;
    IF (V_CONT_EMP_MAT_DE=0) THEN
        RAISE V_EXECPT_EMP_MAT_DE;
    END IF;
    
         --VERIFICA SE MATERIAL DESTINO EXISTE
    SELECT COUNT(*) QTD INTO V_CONT_EMP_MAT_PARA FROM MATERIAL WHERE COD_EMPRESA=V_EMP_PARA AND COD_MAT=V_MAT;
    IF (V_CONT_EMP_MAT_PARA=1) THEN
        RAISE V_EXECPT_EMP_MAT_PARA;
    END IF;
    
    
    INSERT INTO MATERIAL
    SELECT V_EMP_PARA,COD_MAT,DESCRICAO,PRECO_UNIT,COD_TIP_MAT FROM MATERIAL
    WHERE COD_MAT=V_MAT AND COD_EMPRESA=V_EMP_DE;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('COPIA REALIZADA COM SUCESSO!');
 
 EXCEPTION
 WHEN V_EXECPT_EMP_DE THEN
      DBMS_OUTPUT.PUT_LINE('ATENCAO! EMPRESA ORIGEM NAO EXISTE');
      
 WHEN V_EXECPT_EMP_PARA THEN
      DBMS_OUTPUT.PUT_LINE('ATENCAO! EMPRESA DESTINO NAO EXISTE');
      
 WHEN V_EXECPT_EMP_MAT_DE THEN
      DBMS_OUTPUT.PUT_LINE('ATENCAO! MATERIAL NAO EXISTE NA EMPRESA ORIGEM');
      
  WHEN V_EXECPT_EMP_MAT_PARA THEN
       --RAISE_APPLICATION_ERROR(-20999,'ATENCAO! MATERIAL JA EXISTE NA EMPRESA DESTINO', FALSE);
       DBMS_OUTPUT.PUT_LINE('ATENCAO! MATERIAL JA EXISTE NA EMPRESA DESTINO');
      
 WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('OCORREU UM ERRO - '||SQLCODE||' -ERROR- '||SQLERRM);

END;


--EXECUTANDO PREOCEDURE
--PARAMENTROS EMPRESA ORIGEM, EMPRESA DESTINO E MATERIAL A SER COPIADO
SET SERVEROUTPUT ON

EXECUTE PROC_COPIA_MAT (9,1,1);
EXECUTE PROC_COPIA_MAT (1,9,1);
EXECUTE PROC_COPIA_MAT (1,2,99);
EXECUTE PROC_COPIA_MAT (1,2,1);
EXECUTE PROC_COPIA_MAT (1,2,2);

--SELECT * FROM MATERIAL;


 --APOS INTEGRAÇAO DE COPIA   
 INSERT INTO PED_VENDAS_ITENS VALUES (2,1,1,1,50,2500);
 INSERT INTO PED_VENDAS_ITENS VALUES (2,1,2,2,35,2500);
 INSERT INTO PED_VENDAS_ITENS VALUES (2,2,1,1,50,2500);
 INSERT INTO PED_VENDAS_ITENS VALUES (2,2,2,2,35,2500);
 INSERT INTO PED_VENDAS_ITENS VALUES (2,3,1,1,100,2500);
 INSERT INTO PED_VENDAS_ITENS VALUES (2,3,2,2,100,2500);
 INSERT INTO PED_VENDAS_ITENS VALUES (2,4,1,1,50,2500);
 INSERT INTO PED_VENDAS_ITENS VALUES (2,4,2,2,35,2500);
 
 --DELETE FROM PED_VENDAS_ITENS WHERE COD_EMPRESA=2;
 --DELETE FROM MATERIAL WHERE COD_EMPRESA=2;