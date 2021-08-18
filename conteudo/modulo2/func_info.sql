--https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions165.htm
/*
    'LANGUAGE' - lingua;
    'LANG' - pais;
    'INSTANCE' - instancia (importante no ambiente RAC - Real Application Cluster);
    'TERMINAL' - nome do computador onde esta a correr o cliente Oracle - quando o cliente - Java (JDBC) aparece em branco;
    'SESSIONID'- numero da sessao Oracle que esta em execuçao;
*/

select 
  userenv('LANGUAGE') as LANGUAGE,
  userenv('LANG') as LANG,
  userenv('INSTANCE') as INSTANCE,
  userenv('TERMINAL') as TERMINAL,
  userenv('SESSIONID') as SESSIONID,
  userenv('CLIENT_INFO') as CLIENT_INFO
from dual;

--OUTROS PARAM
/*
AUDITED_CURSORID
AUTHENTICATION_DATA
AUTHENTICATION_TYPE
BG_JOB_ID
CLIENT_IDENTIFIER
CLIENT_INFO
CURRENT_SCHEMA
CURRENT_SCHEMAID
CURRENT_SQL
CURRENT_USER
CURRENT_USERID
DB_DOMAIN
DB_NAME
ENTRYID
EXTERNAL_NAME
FG_JOB_ID
GLOBAL_CONTEXT_MEMORY
HOST
INSTANCE
IP_ADDRESS
ISDBA
LANG
LANGUAGE
NETWORK_PROTOCOL
NLS_CALENDAR
NLS_CURRENCY
NLS_DATE_FORMAT
NLS_DATE_LANGUAGE
NLS_SORT
NLS_TERRITORY
OS_USER
PROXY_USER
PROXY_USERID
SESSION_USER
SESSION_USERID
SESSIONID
TERMINAL 
*/
--OUTRA FORMA DE USO
SELECT SYS_CONTEXT ('USERENV', 'SESSION_USER') 
   FROM DUAL;

SELECT SYS_CONTEXT ('USERENV', 'NLS_TERRITORY') 
   FROM DUAL;
   
--VERIFCANDO USUARIO E UID
select user,uid from dual;

--USUARIO CORRENTE
select *  FROM USER_USERS;

--DATABASE ATIVO
select SYS.DATABASE_NAME from dual;
 

--CONSULTA DE PARAMETROS VALIDOS.
select * from V$NLS_VALID_VALUES  
--verficando parametros

--Paramentros de instancia/
select * from NLS_INSTANCE_PARAMETERS;

--Paramentros de Base de dados/
select * from NLS_DATABASE_PARAMETERS;

--Parametros da sessao
select * from v$nls_parameters;

select * from NLS_SESSION_PARAMETERS;

-- Parametros de Linguagem da Sessao do Oracle no Padrao brasileiro:
--facilita a compatibilidade de caracteres, numericos e datas no padrao brasileiro.

Alter Session Set nls_language='BRAZILIAN PORTUGUESE';
Alter Session Set NLS_TERRITORY = 'BRAZIL';
Alter Session Set NLS_NUMERIC_CHARACTERS=',.';
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';


--Portugal
alter session set nls_territory='PORTUGAL';
alter session set nls_language='PORTUGUESE';
alter session set nls_currency='EUR';

--Padrao americano
ALTER SESSION SET NLS_LANGUAGE= 'AMERICAN';
ALTER SESSION SET NLS_TERRITORY= 'AMERICA' 
ALTER SESSION NLS_CURRENCY= '$' 
ALTER SESSION NLS_ISO_CURRENCY= 'AMERICA' 
ALTER SESSION NLS_NUMERIC_CHARACTERS= '.,' 
ALTER SESSION NLS_CALENDAR= 'GREGORIAN' 
ALTER SESSION NLS_DATE_FORMAT= 'DD-MON-RR' 
ALTER SESSION NLS_DATE_LANGUAGE= 'AMERICAN' ;




