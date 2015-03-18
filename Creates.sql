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
	ID_PASSAGER		NUMERIC(10;0)	NOT NULL, --SEQUENCE SEQ_ID_PASSAGER
	NOM 			VARCHAR2(15)	NOT NULL,
	PRENOM			VARCHAR2(15)	NOT NULL,
	ADRESSE			VARCHAR2(30)	NOT NULL,
	TELEPHONE		VARCHAR2(13)	NOT NULL,
	CONSTRAINTS PK_ID_PASSAGER
			PRIMARY KEY(ID_PASSAGER)
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
	ID_RESERVATION		NUMERIC(12;0)	NOT NULL, --SEQUENCE SEQ_ID_RESERVATION
	DATE_RESERVATION	DATE			NOT NULL,
	ID_PASSAGER			NUMERIC(10;0)	NOT NULL,
	CONSTRAINTS PK_ID_RESERVATION
			PRIMARY KEY(ID_RESERVATION),
	CONSTRAINTS FK1_ID_PASSAGER
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
	Table "RESERVATION"
***********************************************************/