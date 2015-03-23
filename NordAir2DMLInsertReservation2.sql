/* **********************************************************
	Script DML  : peuplement des tables PASSAGER, RESERVATION et RESERVATION_ENVOLEE
				  PARTIE 2
	Fichier MRD : "NordAir" VERSION 2
	Auteur	    : Sylvie Monjal 
				  D�partement d'informatique
				  C�gep de Sainte-Foy
********************************************************** */

/* AVANT L'EX�CUTION DE CE SCRIPT No 2:
	- EX�CUTEZ LE SCRIPT No 1 "Vacances-NordAir2DMLInsertTReservation1.sql" */

/* APR�S L'EX�CUTION DE CE SCRIPT No 2:
	- N'OUBLIEZ PAS DE FAIRE UN COMMIT " */

SAVEPOINT RESERVATION2;
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Duval',
		 'Philippe', 
		 '4547 St-Jules',
		 '(418)555-3234' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-04-13','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '02A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-16', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'A'
		AND
		VOL.NO_VOL = 1822;
---
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Lapierre',
		 'Guillaume', 
		 '1110 Rene',
		 '(418)555-3232' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-04-18','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '02B'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-16', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'A'
		AND
		VOL.NO_VOL = 1822;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '03C'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-16', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'D'
		AND
		VOL.NO_VOL = 1823;
---
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Poussier',
		 'Genevieve', 
		 '12345 Germain',
		 '(418)555-3245' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-04-22','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '03C'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-13', 'yyyy-mm-dd')
		AND
		(SEGMENT.ORDRE_SEGMENT = 'C')
		AND
		VOL.NO_VOL = 1923;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '04D'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-16', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'B'
		AND
		VOL.NO_VOL = 1822;
---
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Mallet',
		 'Sylvain', 
		 '31 Royale',
		 '(418)555-5532' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-04-11','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '05A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-16', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'A'
		AND
		VOL.NO_VOL = 1822; 
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '06B'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-17', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'B'
		AND
		VOL.NO_VOL = 1923;
---       
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Saucier',
		 'Jean-Francois', 
		 '10235 St-Laurent',
		 '(418)555-4643' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-04-20','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '07A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-16', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'A'
		AND
		VOL.NO_VOL = 1822;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '07A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-16', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'B'
		AND
		VOL.NO_VOL = 1822;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '07A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-16', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'C'
		AND
		VOL.NO_VOL = 1822;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '07A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-16', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'D'
		AND
		VOL.NO_VOL = 1822;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '04C'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-19', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'A'
		AND
		VOL.NO_VOL = 1923;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '04C'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-19', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'B'
		AND
		VOL.NO_VOL = 1923;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '04C'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-19', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'C'
		AND
		VOL.NO_VOL = 1923;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '04D'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-20', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'D'
		AND
		VOL.NO_VOL = 1923;
---
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Lagace',
		 'Mathieu', 
		 '2021 Levesque',
		 '(418)555-5778' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-04-20','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '02A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-18', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'D'
		AND
		VOL.NO_VOL = 1822;
---     
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Blanchette',
		 'Marc', 
		 '4340 Elzear',
		 '(418)555-3667' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-05-01','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '08A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-19', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'A'
		AND
		VOL.NO_VOL = 1923;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '03A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-19', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'D'
		AND
		VOL.NO_VOL = 1822;
---
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Aspiros',
		 'Charles', 
		 '12B duFort',
		 '(418)555-3265' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-05-01','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '03A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-17', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'D'
		AND
		VOL.NO_VOL = 1822;
---    
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Picard',
		 'Maxime', 
		 '1229 Jeanne d''Arc',
		 '(418)555-4573' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-05-02','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '01A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-18', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'C'
		AND
		VOL.NO_VOL = 1922;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '08A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-18', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'D'
		AND
		VOL.NO_VOL = 1922;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '06A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-19', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'A'
		AND
		VOL.NO_VOL = 1923;
---   
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Richard',
		 'Jean-Francois', 
		 '4451 St-Cyrille',
		 '(418)555-3746' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-05-03','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '02A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-19', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'B'
		AND
		VOL.NO_VOL = 1823;
---      
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Dube',
		 'Jason', 
		 '1044 Principale',
		 '(418)555-9878' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-05-04','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '01A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-19', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'A'
		AND
		VOL.NO_VOL = 1923;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '09D'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-20', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'D'
		AND
		VOL.NO_VOL = 1822;
---
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Lapointe-Girard',
		 'etienne', 
		 '4440 Beausejour',
		 '(418)555-4987' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-05-05','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '07C'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-13', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT IN ('A','B','C')
		AND
		VOL.NO_VOL = 1923;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '02A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-18', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'B'
		AND
		VOL.NO_VOL = 1822;
---
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Mercier',
		 'Nicolas', 
		 '222 Dupont',
		 '(418)555-1232' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-05-06','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '01A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-19', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'C'
		AND
		VOL.NO_VOL = 1823;
---
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Aubert',
		 'Vincent', 
		 '1233 Albert',
		 '(418)555-3765' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-05-05','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '01A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-16', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'D'
		AND
		VOL.NO_VOL = 1922;
---
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Ouellet',
		 'Remi', 
		 '9857 St-Louis',
		 '(418)555-6335' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-05-04','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '05D'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-13', 'yyyy-mm-dd')
		AND
		(SEGMENT.ORDRE_SEGMENT = 'A' OR SEGMENT.ORDRE_SEGMENT = 'B')
		AND
		VOL.NO_VOL = 1923;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '01A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-17', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'C'
		AND
		VOL.NO_VOL = 1923;
---
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Ouellette',
		 'Pierre', 
		 '4851 duRoy',
		 '(418)555-8730' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-05-03','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '08D'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-13', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT IN ('A','B','C')
		AND
		VOL.NO_VOL = 1923;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '03A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-18', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'B'
		AND
		VOL.NO_VOL = 1822;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '01B'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-20', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'C'
		AND
		VOL.NO_VOL = 1923;
---
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Pelletier',
		 'Nathalie', 
		 '3654C duCarre',
		 '(418)555-3277' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-05-02','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '01B'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-18', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'A'
		AND
		VOL.NO_VOL = 1922;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '06C'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-20', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'B'
		AND
		VOL.NO_VOL = 1922;
---
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Tremblay',
		 'Sebastien', 
		 '3656D duCarre',
		 '(418)555-3367' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-05-02','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '10C'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-13', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT IN ('A','B','C','D')
		AND
		VOL.NO_VOL = 1923;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '01D'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-18', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'A'
		AND
		VOL.NO_VOL = 1822;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '06D'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-20', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'B'
		AND
		VOL.NO_VOL = 1822;
---
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Talbot',
		 'Remi', 
		 '4654D duRectangle',
		 '(418)555-3867' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-05-02','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '10D'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-13', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT IN ('A','B','C','D')
		AND
		VOL.NO_VOL = 1923;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '02A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-18', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'A'
		AND
		VOL.NO_VOL = 1822;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '07B'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-20', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'B'
		AND
		VOL.NO_VOL = 1822;
---
INSERT INTO
	PASSAGER
		(ID_PASSAGER,
		 NOM,
		 PRENOM,
		 ADRESSE,
		 TELEPHONE)
	VALUES
		(SEQ_ID_PASSAGER.NEXTVAL, 
		 'Rouillard',
		 'Guy', 
		 '75B, de LaLiberte',
		 '(418)555-3067' );      
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-05-02','yyyy-mm-dd'),
		 SEQ_ID_PASSAGER.CURRVAL);
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '03A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-18', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'A'
		AND
		VOL.NO_VOL = 1822;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '08B'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-20', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'B'
		AND
		VOL.NO_VOL = 1822;
---
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	VALUES
		(SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-05-02','yyyy-mm-dd'),
		 (SELECT ID_PASSAGER FROM PASSAGER WHERE NOM = 'Barbeau' AND PRENOM = 'Isabelle'));
INSERT INTO
	RESERVATION
		(ID_RESERVATION,
		 DATE_RESERVATION,
		 ID_PASSAGER)
	SELECT
		 SEQ_ID_RESERVATION.NEXTVAL,
		 TO_DATE('2015-05-02','yyyy-mm-dd'),
		 ID_PASSAGER
	FROM
		 PASSAGER
	WHERE
		 NOM = 'Barbeau'AND PRENOM = 'Isabelle';
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '03A'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-15', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'C'
		AND
		VOL.NO_VOL = 1822;
INSERT INTO
	RESERVATION_ENVOLEE
		(ID_RESERV_ENVOLEE,
		 ID_RESERVATION,
		 ID_ENVOLEE,
		 CODE_SIEGE)
	SELECT
		 SEQ_ID_RESERV_ENVOLEE.NEXTVAL,
		 SEQ_ID_RESERVATION.CURRVAL,
		 ENVOLEE.ID_ENVOLEE,
		 '08B'
	FROM
		ENVOLEE
			INNER JOIN SEGMENT
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN VOL
						ON SEGMENT.ID_VOL = VOL.ID_VOL
	WHERE
		ENVOLEE.DATE_ENVOLEE = TO_DATE('2015-05-16', 'yyyy-mm-dd')
		AND
		SEGMENT.ORDRE_SEGMENT = 'B'
		AND
		VOL.NO_VOL = 1823;