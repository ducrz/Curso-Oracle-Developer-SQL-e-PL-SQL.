-- Exemplo mostras quantidade de  funcionarios na tabela EMPLOYEES
set SERVEROUTPUT ON;
DECLARE
-- Declaracao de variaveis
vCount INTEGER;
BEGIN
-- Recuperar quantidade de Funcionarios cadastrados
SELECT count(*)
INTO vCount
FROM HR.EMPLOYEES;
-- Imprimir, na tela, a quantidade de Funcionarios cadastrados
dbms_output.put_line('Existem '||to_char(vCount)||' Funcionarios cadastrados.');
EXCEPTION
/* Se ocorrer qualquer erro, informar o usuario que nao foi possivel
verificar a quantidade de produtos cadastrados */
WHEN OTHERS THEN
dbms_output.put_line('Nao foi possivel verificar a quantidade de'||
'Funcionarios cadastrados.');
END;
/

-- Exemplo print de data

DECLARE
    V_HOJE date default sysdate;
BEGIN
    -- IMPRIME A DATA
    DBMS_OUTPUT.PUT_LINE('HOJE e '||V_HOJE);
END;

--CONTANDO DIAS DE VIDA
DECLARE
  V_DATA_NASC DATE :='03/07/89';
  V_HOJE DATE default sysdate;
  V_DIAS INT;
  BEGIN
    V_DIAS:=V_HOJE-V_DATA_NASC;
    DBMS_OUTPUT.PUT_LINE('ESTOU VIVO A  '||V_DIAS||' DIAS');
  END;
  

    
    
  

