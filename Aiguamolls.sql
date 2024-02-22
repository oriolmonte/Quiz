DROP TABLE ornitoleg CASCADE CONSTRAINTS;
DROP TABLE especie CASCADE CONSTRAINTS;
DROP TABLE avistament CASCADE CONSTRAINTS;

CREATE TABLE especie(
    id NUMBER(11),
    nom_catala VARCHAR2(100),
    nom_cientific VARCHAR2(100),

    CONSTRAINT pk_especie PRIMARY KEY (id)
)

CREATE TABLE ornitoleg(
    carnet VARCHAR2(11),
    carnet_supervisor VARCHAR2(11),
    nom VARCHAR2(50),

    CONSTRAINT pk_ornitoleg PRIMARY KEY (carnet),
    CONSTRAINT fk_carnet_supervisor_ornitoleg FOREIGN KEY (carnet_supervisor)
                                              REFERENCES ornitoleg(carnet)
)

CREATE TABLE avistament(
    especie_id NUMBER(11),
    ornitoleg_carnet VARCHAR2(11),
    data_avis DATE,
    lloc VARCHAR2(50),
    circunstancies VARCHAR2(500),
    quantitat NUMBER(10),

    CONSTRAINT pk_avistament PRIMARY KEY (especie_id,ornitoleg_carnet,data_avis),
    CONSTRAINT fk_avistament_especie_id FOREIGN KEY (especie_id)
                                        REFERENCES especie(id),
    CONSTRAINT fk_avistament_ornitoleg_carnet FOREIGN KEY (ornitoleg_carnet)
                                        REFERENCES ornitoleg(carnet)
)