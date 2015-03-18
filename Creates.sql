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
	ID_AVION		NUMERIC(3,0)	NOT NULL, --SEQUENCE SEQ_ID_AVION
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
	ID_VOL	NUMERIC(3,0)	NOT NULL, --SEQUENCE SEQ_ID_VOL
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
			 
/***********************************************************
	Table "AEROPORT"
***********************************************************/
CREATE TABLE AEROPORT
(
	ID_AEROPORT		NUMERIC(3,0)	NOT NULL, --SEQUENCE SEQ_ID_AEROPORT
	ACR_AEROPORT	VARCHAR2(3)		NOT NULL,
	NOM_VILLE		VARCHAR2(20)	NOT NULL,
	CONSTRAINT PK_ID_AEROPORT
					PRIMARY KEY(ID_AEROPORT),
	CONSTRAINT U1_ACR_AEROPORT
					UNIQUE (ACR_AEROPORT)
);

/***********************************************************
	SEQUENCE "SEQ_ID_AEROPORT"
***********************************************************/
CREATE SEQUENCE SEQ_ID_AEROPORT
			 START WITH 1
			 INCREMENT BY 1
			 MAXVALUE 999999;

/***********************************************************
	Table "PILOTE"
***********************************************************/
CREATE TABLE PILOTE
(
	ID_PILOTE	NUMERIC(3,0)	NOT NULL, --SEQUENCE SEQ_ID_PILOTE
	NO_PILOTE	NUMERIC(4,0)	NOT NULL,
	NOM			VARCHAR2(15)	NOT NULL,
	PRENOM		VARCHAR2(15)	NOT NULL,
	ADRESSE		VARCHAR2(30)	NOT NULL,
	TELEPHONE	VARCHAR2(13)	NOT NULL,
	CONSTRAINT PK_ID_PILOTE
					PRIMARY KEY(ID_PILOTE),
	CONSTRAINT U1_NO_PILOTE
					UNIQUE (NO_PILOTE)
);

/***********************************************************
	SEQUENCE "SEQ_ID_PILOTE"
***********************************************************/
CREATE SEQUENCE SEQ_ID_PILOTE
			 START WITH 1
			 INCREMENT BY 1
			 MAXVALUE 999999;

/***********************************************************
	Table "SEGMENT"
***********************************************************/
CREATE TABLE SEGMENT
(
	ID_SEGMENT				NUMERIC(4,0)	NOT NULL,
	ORDRE_SEGMENT			CHAR(1)			NOT NULL,
	ID_VOL					NUMERIC(3,0)	NOT NULL,
	AEROPORT_DEPART			NUMERIC(3,0)	NOT NULL,
	AEROPORT_DESTINATION	NUMERIC(3,0)	NOT NULL,
	DUREE_VOL				NUMERIC(3,0)	NOT NULL,
	HEURE_DEPART			DATE			NOT NULL,
	CONSTRAINT PK_ID_SEGMENT
					PRIMARY KEY(ID_SEGMENT),
	CONSTRAINT U1_ID_VOL
					UNIQUE(ID_VOL)
	CONSTRAINT FK1_ID_VOL
					FOREIGN KEY(ID_VOL),
					REFERENCES VOL (ID_VOL),
	CONSTRAINT FK2_DEPART
					FOREIGN KEY(ID_AEROPORT)
					REFERENCES AEROPORT (ID_AEROPORT),
	CONSTRAINT FK3_DESTINATION
					FOREIGN KEY(ID_AEROPORT)
					REFERENCES AEROPORT (ID_AEROPORT)
);

/***********************************************************
	SEQUENCE "SEQ_ID_SEGMENT"
***********************************************************/
CREATE SEQUENCE SEQ_ID_SEGMENT
			 START WITH 1
			 INCREMENT BY 1
			 MAXVALUE 999999;