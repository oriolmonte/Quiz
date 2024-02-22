DROP TABLE gos CASCADE CONSTRAINTS;
DROP TABLE registre CASCADE CONSTRAINTS;
DROP TABLE raca CASCADE CONSTRAINTS;

CREATE TABLE gos(
    id NUMBER(11),
    nom VARCHAR2(20),
    raca_id NUMBER(11),

    CONSTRAINT pk_gos PRIMARY KEY (id),
    CONSTRAINT fk_raca_id FOREIGN KEY (raca_id)
                          REFERENCES raca(id)
);
CREATE TABLE raca(
    id NUMBER(11),
    nom VARCHAR2(20),
    CONSTRAINT pk_raca PRIMARY KEY (id)
);
CREATE TABLE registre(
    gos_id NUMBER(11),
    data_entrada DATE,
    data_sortida DATE,
    descripcio VARCHAR2(500),

    CONSTRAINT pk_registre PRIMARY KEY(gos_id,data_entrada),
    CONSTRAINT fk_gos_id FOREIGN KEY (gos_id) 
                         REFERENCES gos(id)
);

