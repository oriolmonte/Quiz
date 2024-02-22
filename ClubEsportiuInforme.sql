
ALTER TABLE soci ADD(
    estat NUMBER(1),
    CONSTRAINT ck_estat
            CHECK(estat=0 OR estat=1)                                

);
SELECT column_name 
FROM user_cons_columns 
WHERE (table_name = 'SOCI' OR table_name ='SECCIO' OR table_name = 'MONITOR' OR table_name ='ACTIVITAT' OR table_name ='INSCRIPCIO' OR table_name ='MONITOR_ACTIVITAT') AND constraint_type = 'P'

SELECT constraint_name, constraint_type
FROM user_constraints
WHERE (table_name = 'SOCI' OR table_name ='SECCIO' OR table_name = 'MONITOR' OR table_name ='ACTIVITAT' OR table_name ='INSCRIPCIO' OR table_name ='MONITOR_ACTIVITAT') AND constraint_type IN ('C','U')

SELECT constraint_name, constraint_type
FROM user_constraints
WHERE (table_name = 'SOCI' OR table_name ='SECCIO' OR table_name = 'MONITOR' OR table_name ='ACTIVITAT' OR table_name ='INSCRIPCIO' OR table_name ='MONITOR_ACTIVITAT') AND constraint_type IN ('R')

DROP TABLE seccio CASCADE CONSTRAINTS

alter table "WKSP_WSOMONTE"."SOCI" disable constraint
PK_SOCIS;

INSERT INTO soci
(soci_id, nom)
VALUES
(5, 'Pepito');

INSERT INTO soci
(soci_id, nom)
VALUES
(5, 'Menganito');

alter table "WKSP_WSOMONTE"."SOCI" enable constraint
PK_SOCIS;

