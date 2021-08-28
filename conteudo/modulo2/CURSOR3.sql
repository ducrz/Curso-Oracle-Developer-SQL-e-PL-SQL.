SET SERVEROUTPUT ON
DECLARE
-- Declaracao de variaveis
viDFunc HR.EMPLOYEES.EMPLOYEE_ID%type;
vNome HR.EMPLOYEES.FIRST_NAME%type;
VSalario HR.EMPLOYEES.SALARY%type;
v_posicao int default 0;
-- Declaracao de cursores
CURSOR cs_salario is
 SELECT a.EMPLOYEE_ID,a.FIRST_NAME,a.SALARY
FROM HR.EMPLOYEES a
order by a.salary desc;
BEGIN
-- Abre cursor se ainda nao estiver aberto
IF NOT cs_salario%ISOPEN THEN
OPEN cs_salario;
END IF;
-- Executa um loop 
LOOP
-- Extrai dados o registro corrente do cursor e avanca para o proximo
FETCH cs_salario INTO  viDFunc,vNome,VSalario;

-- Sai do Loop quando nao houver mais registros para processar
EXIT WHEN cs_salario%NOTFOUND;
-- Imprime dados extraidos na tela
v_posicao:=v_posicao+1;
dbms_output.put_line(v_posicao||' - '||viDFunc||' - '||vNome||' - '||VSalario);
END LOOP;
-- Fechar cursor
CLOSE cs_salario;
END;