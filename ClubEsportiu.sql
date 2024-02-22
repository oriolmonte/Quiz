
DROP TABLE seccio CASCADE CONSTRAINTS;
DROP TABLE monitor CASCADE CONSTRAINTS;
DROP TABLE activitat CASCADE CONSTRAINTS;
DROP TABLE inscripcio CASCADE CONSTRAINTS;
DROP TABLE soci CASCADE CONSTRAINTS;
DROP TABLE monitor_activitat CASCADE CONSTRAINTS;

CREATE TABLE soci(
    soci_id NUMBER(11),
    nom VARCHAR2(100),
    data_naix DATE,
    mail VARCHAR2(100),
    telf NUMBER(20) UNIQUE,
    compte_corrent VARCHAR2(30) UNIQUE ,

    CONSTRAINT pk_socis PRIMARY KEY(soci_id)
);

COMMENT ON COLUMN soci.soci_id 
IS 'id de taula soci';
COMMENT ON COLUMN soci.nom 
IS 'nom del soci';
COMMENT ON COLUMN soci.data_naix
IS 'data naixement soci';
COMMENT ON COLUMN soci.mail
IS 'e-mail del soci';
COMMENT ON COLUMN soci.telf 
IS 'telefon del soci';
COMMENT ON COLUMN soci.compte_corrent
IS 'numero de compte del soci';

CREATE TABLE seccio(
    seccio_id NUMBER(11),
    nom VARCHAR2(50),
    descripcio VARCHAR2(500),

    CONSTRAINT pk_seccio_id PRIMARY KEY(seccio_id)
);
COMMENT ON COLUMN seccio.seccio_id
IS 'id de la seccio';
COMMENT ON COLUMN seccio.nom 
IS 'nom de la seccio';
COMMENT ON COLUMN seccio.descripcio
IS 'Breu descripcio de la funcio de la seccio del club';

CREATE TABLE monitor(
    monitor_id VARCHAR2(9),
    nom VARCHAR2(50),
    cognom VARCHAR2(50),
    mail VARCHAR2(50) UNIQUE,
    telf VARCHAR2(20) NOT NULL,
    compte_corrent VARCHAR(50),
    seccio_id NUMBER(11),
    responsable_id VARCHAR2(9),

    CONSTRAINT pk_monitor_id PRIMARY KEY(monitor_id),
    CONSTRAINT fk_monitor_seccio_id FOREIGN KEY(seccio_id)
                                    REFERENCES seccio(seccio_id),

    CONSTRAINT fk_monitor_responsable_id FOREIGN KEY (responsable_id)
                                         REFERENCES monitor(monitor_id)
);
COMMENT ON COLUMN monitor.monitor_id 
IS 'id de taula monitor';
COMMENT ON COLUMN monitor.nom 
IS 'nom del monitor';
COMMENT ON COLUMN monitor.mail
IS 'e-mail del monitor';
COMMENT ON COLUMN monitor.telf 
IS 'telefon del monitor';
COMMENT ON COLUMN monitor.compte_corrent
IS 'numero de compte del monitor';
COMMENT ON COLUMN monitor.seccio_id
IS 'la seccio on esta destinat el monitor';
COMMENT ON COLUMN monitor.responsable_id
IS 'el id del monitor responsable de aquest monitor';


CREATE TABLE activitat(
    activitat_id NUMBER(11),
    nom VARCHAR2(50),
    descripcio VARCHAR2(500),
    preu NUMBER(5,2),
    data_inici DATE,
    data_fi DATE,
    seccio_id NUMBER(11),

    CONSTRAINT pk_activitat_id PRIMARY KEY(activitat_id),

    CONSTRAINT fk_seccio_id FOREIGN KEY(seccio_id)
                                    REFERENCES seccio(seccio_id)
);           
COMMENT ON COLUMN activitat.activitat_id
IS 'id de la taula';
COMMENT ON COLUMN activitat.nom 
IS 'nom de la activitat';
COMMENT ON COLUMN activitat.descripcio
IS 'descripcio de la activitat';
COMMENT ON COLUMN activitat.preu
IS 'preu de la activitat';
COMMENT ON COLUMN activitat.data_inici
IS 'la data de inici de la activitat';
COMMENT ON COLUMN activitat.data_fi
IS 'la data de inici de la activitat';
COMMENT ON COLUMN activitat.seccio_id
IS 'la seccio a la que pertany';

CREATE TABLE inscripcio(
    soci_id NUMBER(11),
    activitat_id NUMBER(11),
    data_inscripcio DATE NOT NULL,
    pagament NUMBER(1)NOT NULL,

    CONSTRAINT pk_inscripcio_seccio_id_activitat_id PRIMARY KEY(soci_id,activitat_id),

    CONSTRAINT fk_inscripcio_soci_id FOREIGN KEY(soci_id)
                                    REFERENCES soci(soci_id),
                                    
    CONSTRAINT fk_inscripcio_activitat_id FOREIGN KEY(activitat_id)
                                    REFERENCES activitat(activitat_id),

    CONSTRAINT ck_pagament
            CHECK(pagament=0 OR pagament=1)                                
);
COMMENT ON COLUMN inscripcio.soci_id 
IS 'id del soci que fa la inscripcio';
COMMENT ON COLUMN inscripcio.activitat_id
IS 'id de la activitat a la qual esta inscrit';
COMMENT ON COLUMN inscripcio.data_inscripcio
IS 'la data quan es realitza la inscripcio';
COMMENT ON COLUMN inscripcio.pagament
IS 'si esta pagada o no';


CREATE TABLE monitor_activitat(
    monitor_id VARCHAR2(9),
    activitat_id NUMBER(11),

    CONSTRAINT pk_monitor_activitat_monitor_id_activitat_id PRIMARY KEY(monitor_id,activitat_id),

    CONSTRAINT fk_monitor_activitat_monitor FOREIGN KEY(monitor_id)
                                    REFERENCES monitor(monitor_id),

    CONSTRAINT fk_monitor_activitat_activitat_id FOREIGN KEY(activitat_id)
                                    REFERENCES activitat(activitat_id)

);
COMMENT ON COLUMN monitor_activitat.monitor_id
IS 'clau forana de monitor';
COMMENT ON COLUMN monitor_activitat.activitat_id
IS 'clau forana de activitat';

DROP TABLE seccio CASCADE CONSTRAINTS;
DROP TABLE monitor CASCADE CONSTRAINTS;
DROP TABLE activitat CASCADE CONSTRAINTS;
DROP TABLE inscripcio CASCADE CONSTRAINTS;
DROP TABLE soci CASCADE CONSTRAINTS;
DROP TABLE monitor_activitat CASCADE CONSTRAINTS;

CREATE TABLE soci(
    soci_id NUMBER(11),
    nom VARCHAR2(100),
    data_naix DATE,
    mail VARCHAR2(100),
    telf NUMBER(20) UNIQUE,
    compte_corrent VARCHAR2(30) UNIQUE ,

    CONSTRAINT pk_socis PRIMARY KEY(soci_id)
);

COMMENT ON COLUMN soci.soci_id 
IS 'id de taula soci';
COMMENT ON COLUMN soci.nom 
IS 'nom del soci';
COMMENT ON COLUMN soci.data_naix
IS 'data naixement soci';
COMMENT ON COLUMN soci.mail
IS 'e-mail del soci';
COMMENT ON COLUMN soci.telf 
IS 'telefon del soci';
COMMENT ON COLUMN soci.compte_corrent
IS 'numero de compte del soci';

CREATE TABLE seccio(
    seccio_id NUMBER(11),
    nom VARCHAR2(50),
    descripcio VARCHAR2(500),

    CONSTRAINT pk_seccio_id PRIMARY KEY(seccio_id)
);
COMMENT ON COLUMN seccio.seccio_id
IS 'id de la seccio';
COMMENT ON COLUMN seccio.nom 
IS 'nom de la seccio';
COMMENT ON COLUMN seccio.descripcio
IS 'Breu descripcio de la funcio de la seccio del club';

CREATE TABLE monitor(
    monitor_id VARCHAR2(9),
    nom VARCHAR2(50),
    cognom VARCHAR2(50),
    mail VARCHAR2(50) UNIQUE,
    telf VARCHAR2(20) NOT NULL,
    compte_corrent VARCHAR(50),
    seccio_id NUMBER(11),
    responsable_id VARCHAR2(9),

    CONSTRAINT pk_monitor_id PRIMARY KEY(monitor_id),
    CONSTRAINT fk_monitor_seccio_id FOREIGN KEY(seccio_id)
                                    REFERENCES seccio(seccio_id),

    CONSTRAINT fk_monitor_responsable_id FOREIGN KEY (responsable_id)
                                         REFERENCES monitor(monitor_id)
);
COMMENT ON COLUMN monitor.monitor_id 
IS 'id de taula monitor';
COMMENT ON COLUMN monitor.nom 
IS 'nom del monitor';
COMMENT ON COLUMN monitor.mail
IS 'e-mail del monitor';
COMMENT ON COLUMN monitor.telf 
IS 'telefon del monitor';
COMMENT ON COLUMN monitor.compte_corrent
IS 'numero de compte del monitor';
COMMENT ON COLUMN monitor.seccio_id
IS 'la seccio on esta destinat el monitor';
COMMENT ON COLUMN monitor.responsable_id
IS 'el id del monitor responsable de aquest monitor';


CREATE TABLE activitat(
    activitat_id NUMBER(11),
    nom VARCHAR2(50),
    descripcio VARCHAR2(500),
    data_inici DATE,
    data_fi DATE,
    seccio_id NUMBER(11),

    CONSTRAINT pk_activitat_id PRIMARY KEY(activitat_id),

    CONSTRAINT fk_seccio_id FOREIGN KEY(seccio_id)
                                    REFERENCES seccio(seccio_id)
);           
COMMENT ON COLUMN activitat.activitat_id
IS 'id de la taula';
COMMENT ON COLUMN activitat.nom 
IS 'nom de la activitat';
COMMENT ON COLUMN activitat.descripcio
IS 'descripcio de la activitat';
COMMENT ON COLUMN activitat.data_inici
IS 'la data de inici de la activitat';
COMMENT ON COLUMN activitat.data_fi
IS 'la data de inici de la activitat';
COMMENT ON COLUMN activitat.seccio_id
IS 'la seccio a la que pertany';

CREATE TABLE inscripcio(
    soci_id NUMBER(11),
    activitat_id NUMBER(11),
    data_inscripcio DATE NOT NULL,
    pagament NUMBER(1)NOT NULL,

    CONSTRAINT pk_inscripcio_seccio_id_activitat_id PRIMARY KEY(soci_id,activitat_id),

    CONSTRAINT fk_inscripcio_soci_id FOREIGN KEY(soci_id)
                                    REFERENCES soci(soci_id),
                                    
    CONSTRAINT fk_inscripcio_activitat_id FOREIGN KEY(activitat_id)
                                    REFERENCES activitat(activitat_id),

    CONSTRAINT ck_pagament
            CHECK(pagament=0 OR pagament=1)                                
);
COMMENT ON COLUMN inscripcio.soci_id 
IS 'id del soci que fa la inscripcio';
COMMENT ON COLUMN inscripcio.activitat_id
IS 'id de la activitat a la qual esta inscrit';
COMMENT ON COLUMN inscripcio.data_inscripcio
IS 'la data quan es realitza la inscripcio';
COMMENT ON COLUMN inscripcio.pagament
IS 'si esta pagada o no';


CREATE TABLE monitor_activitat(
    monitor_id VARCHAR2(9),
    activitat_id NUMBER(11),

    CONSTRAINT pk_monitor_activitat_monitor_id_activitat_id PRIMARY KEY(monitor_id,activitat_id),

    CONSTRAINT fk_monitor_activitat_monitor FOREIGN KEY(monitor_id)
                                    REFERENCES monitor(monitor_id),

    CONSTRAINT fk_monitor_activitat_activitat_id FOREIGN KEY(activitat_id)
                                    REFERENCES activitat(activitat_id)

);