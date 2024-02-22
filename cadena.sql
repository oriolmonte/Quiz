DROP TABLE locals CASCADE CONSTRAINTS;
DROP TABLE taules CASCADE CONSTRAINTS;
DROP TABLE empleats CASCADE CONSTRAINTS;
DROP TABLE reserves CASCADE CONSTRAINTS;
DROP TABLE taula_reserva CASCADE CONSTRAINTS;

CREATE TABLE empleats(
    dni VARCHAR2(9),
    nom VARCHAR2(20),
    cognom VARCHAR2(20),

    CONSTRAINT pk_empleats PRIMARY KEY (dni)
);

CREATE TABLE locals(
    id NUMBER(11),
    adreca VARCHAR2(50),
    horari_obertura VARCHAR2(50),
    aforament_maxim NUMBER(4),
    empleat_encarregat VARCHAR2(9),

    CONSTRAINT pk_locals PRIMARY KEY (id),
    CONSTRAINT fk_locals_encarregat FOREIGN KEY (empleat_encarregat)
                                    REFERENCES empleats(dni)

);

ALTER TABLE empleats ADD(
    local_id NUMBER(11),
    CONSTRAINT fk_empleats_local FOREIGN KEY (local_id)
                                 REFERENCES locals(id)
);

CREATE TABLE taula( 
    local_id NUMBER(11),
    numero NUMBER(5),
    capacitat NUMBER(4),

    CONSTRAINT pk_taula PRIMARY KEY(local_id,numero),
    CONSTRAINT fk_local_id_taula FOREIGN KEY(local_id)
                                 REFERENCES locals(id)
);

CREATE TABLE reserva(
    reserva_id NUMBER(11),
    datareserva DATE,
    hora TIMESTAMP,
    nom VARCHAR2(50),
    telefon NUMBER(11),

    CONSTRAINT pk_reserva PRIMARY KEY(reserva_id)
);

CREATE TABLE taula_reservada(
    local_id NUMBER(11),
    numero NUMBER(5),
    reserva_id NUMBER(11),

    CONSTRAINT pk_taula_reservada PRIMARY KEY (reserva_id,local_id,numero),
    CONSTRAINT fk_taula_reservada_local_id FOREIGN KEY (local_id)
                                            REFERENCES locals(id),
    CONSTRAINT fk_taula_reservada_numero FOREIGN KEY (numero)
                                            REFERENCES taula(numero),
    CONSTRAINT fk_taula_reservada_reserva_id FOREIGN KEY (reserva_id)
                                            REFERENCES reserva(reserva_id)
                                            
)