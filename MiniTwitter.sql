DROP TABLE usuari CASCADE CONSTRAINTS;
DROP TABLE missatge CASCADE CONSTRAINTS;
DROP TABLE usuari_followers CASCADE CONSTRAINTS;
DROP TABLE usuari_block CASCADE CONSTRAINTS;
DROP TABLE usuari_missatge CASCADE CONSTRAINTS;

CREATE TABLE usuari(
    email VARCHAR2(30),
    contrassenya VARCHAR2(30) NOT NULL,
    pais VARCHAR2(30),
    data_naix DATE,
    data_alta DATE DEFAULT SYSDATE,
    actiu NUMBER(1) DEFAULT 1,

    CONSTRAINT pk_email PRIMARY KEY(email),
    CONSTRAINT ck_usuari_actiu
               CHECK(actiu = 0 OR actiu = 1)
);

CREATE TABLE missatge(
    missatge_id NUMBER(20),
    contingut VARCHAR2(300) NOT NULL,
    estat NUMBER(1),
    usuari_propietari VARCHAR2(30),

    CONSTRAINT pk_missatge_id PRIMARY KEY(missatge_id),
    CONSTRAINT fk_usuari_propietari FOREIGN KEY(usuari_propietari)
                                    REFERENCES usuari(email)
);

CREATE TABLE usuari_followers(
    email_usuari VARCHAR2(30),
    email_follower VARCHAR2(30),

    CONSTRAINT pk_usuari_followers PRIMARY KEY(email_usuari,email_follower),
    CONSTRAINT fk_email_usuari FOREIGN KEY(email_usuari)
                                REFERENCES usuari(email),
    CONSTRAINT fk_email_follower FOREIGN KEY (email_follower)
                                REFERENCES usuari(email)
);

CREATE TABLE usuari_block(
    email_usuari VARCHAR2(30),
    email_blocked VARCHAR2(30),

    CONSTRAINT pk_usuari_blocking PRIMARY KEY(email_usuari,email_blocked),
    CONSTRAINT fk_email_usuari_blocking FOREIGN KEY(email_usuari)
                                REFERENCES usuari(email),
    CONSTRAINT fk_email_blocked FOREIGN KEY (email_blocked)
                                REFERENCES usuari(email)
);

CREATE TABLE usuari_missatge(
    usuari_missatge_id NUMBER(20),
    usuari_email VARCHAR2(30),

    CONSTRAINT pk_usuari_missatge PRIMARY KEY(usuari_missatge_id,usuari_email),
    CONSTRAINT fk_usuari_missatge FOREIGN KEY(usuari_missatge_id)
                                              REFERENCES missatge(missatge_id),
    CONSTRAINT fk_usuari_email FOREIGN KEY (usuari_email)
                                              REFERENCES usuari(email)
);
 