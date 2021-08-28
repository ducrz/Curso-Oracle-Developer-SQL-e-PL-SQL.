SET SERVEROUTPUT ON
DECLARE
-- Declaracao de variaveis
viDFunc HR.EMPLOYEES.EMPLOYEE_ID%type;
vNome HR.EMPLOYEES.FIRST_NAME%type;
VSalario HR.EMPLOYEES.SALARY%type;
-- Declaracao de cursores
CURSOR cs_salario_top_10 is
    SELECT a.EMPLOYEE_ID,a.FIRST_NAME,a.SALARY
FROM HR.EMPLOYEES a
order by a.salary desc;
BEGIN
-- Abre cursor
OPEN cs_salario_top_10;
-- Executa um loop com 10 ciclos
FOR i IN 1..10 LOOP
-- Extrai dados o registro corrente do cursor e avanca para o proximo
FETCH cs_salario_top_10 INTO viDFunc,vNome,VSalario;
-- Imprime dados extraidos na tela
dbms_output.put_line(viDFunc||' - '||vNome||' - '||VSalario);
END LOOP;
--fecha cursor
close cs_salario_top_10;
END;
/