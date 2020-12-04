--------------------------------------------------------------------------------
 
-- SETUP DE CRIACAO DO DATABASE

--------------------------------------------------------------------------------

-- VARIAVEIS
DEFINE P_SCHEMA     = UNI_USER;

DEFINE P_TS_DADOS   = UNI_D;


alter session set "_ORACLE_SCRIPT"=true;

-- TABLESPACES
CREATE TABLESPACE &P_TS_DADOS DATAFILE '&P_TS_DADOS..DBF' SIZE 10M AUTOEXTEND ON NEXT 10M;



-- USUARIOS
CREATE USER &P_SCHEMA IDENTIFIED BY unisenha DEFAULT TABLESPACE &P_TS_DADOS QUOTA UNLIMITED ON &P_TS_DADOS;

GRANT CREATE SESSION TO &P_SCHEMA;

-----------------------------------------------------------------------------------


CREATE TABLE &P_SCHEMA..TB_EXEMPLO (
	COD_EXEMPLO NUMBER(*, 0) NOT NULL,
	DESCRICAO VARCHAR2(200) NOT NULL, 
	VALUE DOUBLE PRECISION NOT NULL
);
