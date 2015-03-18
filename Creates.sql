<<<<<<< HEAD
/***********************************************************
	DQL Select
	Schéma MRD:	"NordAir"
	Auteur:		Dominique Septembre + Charles-Edouard Beaudet - Cégep de Ste-Foy  	
***********************************************************/



/***********************************************************
	Table "PASSAGER"
***********************************************************/
CREATE TABLE PASSAGER
(
	ID_PASSAGER		NUMERIC(10,0)	NOT NULL, --SEQUENCE SEQ_ID_PASSAGER
	NOM 			VARCHAR2(15)	NOT NULL,
	PRENOM			VARCHAR2(15)	NOT NULL,
	ADRESSE			VARCHAR2(30)	NOT NULL,
	TELEPHONE		VARCHAR2(13)	NOT NULL,
	CONSTRAINT PK_ID_PASSAGER
					PRIMARY KEY(ID_PASSAGER),
	CONSTRAINT CHK_TELEPHONE
					CHECK (/*VÉRIFIER LE # DE TEL FORMAT (XXX)XXX-XXXX*/)
);

/***********************************************************
	SEQUENCE "SEQ_ID_PASSAGER"
***********************************************************/
CREATE SEQUENCE SEQ_ID_PASSAGER
			 START WITH 1
			 INCREMENT BY 1
			 MAXVALUE 999999;

/***********************************************************
	Table "RESERVATION"
***********************************************************/
CREATE TABLE RESERVATION
(
	ID_RESERVATION		NUMERIC(12,0)	NOT NULL, --SEQUENCE SEQ_ID_RESERVATION
	DATE_RESERVATION	DATE			DEFAULT GETDATE()	NOT NULL,
	ID_PASSAGER			NUMERIC(10,0)	NOT NULL,
	CONSTRAINT PK_ID_RESERVATION
					PRIMARY KEY(ID_RESERVATION),
	CONSTRAINT FK1_ID_PASSAGER
					FOREIGN KEY(ID_PASSAGER)
					REFERENCES PASSAGER (ID_PASSAGER)
);

/***********************************************************
	SEQUENCE "SEQ_ID_RESERVATION"
***********************************************************/
CREATE SEQUENCE SEQ_ID_RESERVATION
			 START WITH 1
			 INCREMENT BY 1
			 MAXVALUE 999999;

/***********************************************************
	Table "AVION"
***********************************************************/
CREATE TABLE AVION
(
	ID_AVION		NUMERIC(3,0)	NOT NULL,
	APPEL_AVION		VARCHAR2(4)		NOT NULL,
	NOMBRE_PLACE	NUMERIC(3,0)	NOT NULL,
	CONSTRAINT PK_ID_AVION
					PRIMARY KEY(ID_AVION),
	CONSTRAINT U1_APPEL_AVION
					UNIQUE(APPEL_AVION)
);

/***********************************************************
	SEQUENCE "SEQ_ID_AVION"
***********************************************************/
CREATE SEQUENCE SEQ_ID_AVION
			 START WITH 1
			 INCREMENT BY 1
			 MAXVALUE 999999;

/***********************************************************
	Table "VOL"
***********************************************************/
CREATE TABLE VOL
(
	ID_VOL	NUMERIC(3,0)	NOT NULL,
	NO_VOL	NUMERIC(4,0)	NOT NULL,
	NOTES	VARCHAR2(125)	NULL,
	CONSTRAINT PK_ID_VOL
					PRIMARY KEY(ID_VOL),
	CONSTRAINT U1_NO_VOL
					UNIQUE(NO_VOL)
);

/***********************************************************
	SEQUENCE "SEQ_ID_VOL"
***********************************************************/
CREATE SEQUENCE SEQ_ID_VOL
			 START WITH 1
			 INCREMENT BY 1
			 MAXVALUE 999999;