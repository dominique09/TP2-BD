/***********************************************************
	PL SQL FONCTION/PROCÉDURES
	Schéma MRD:	"NordAir"
	Auteur:		Dominique Septembre + Charles-Edouard Beaudet - Cégep de Ste-Foy  	
***********************************************************/

/***********************************************************
Fonction pour convertir les minutes (numéric) en hh:mm
***********************************************************/
SHOW ERRORS FUNCTION FORMAT_NUMERIC_TO_HOUR;

CREATE OR REPLACE
	FUNCTION FORMAT_NUMERIC_TO_HOUR(P_NUMERIC IN NUMERIC) RETURN VARCHAR2
AS
	V_MINUTES NUMERIC;	
	V_HOURS NUMERIC;
	V_FORMAT_HOURS VARCHAR2(5);
BEGIN
	V_MINUTES := MOD(P_NUMERIC, 60);
	V_HOURS := TRUNC(P_NUMERIC / 60, 0);
	IF(V_HOURS < 10) THEN
		V_FORMAT_HOURS := '0' || V_HOURS || ':';
	ELSE
		V_FORMAT_HOURS := V_HOURS || ':';
	END IF;
	IF(V_MINUTES < 10) THEN
		V_FORMAT_HOURS := V_FORMAT_HOURS || '0' || V_MINUTES;
	ELSE
		V_FORMAT_HOURS := V_FORMAT_HOURS || V_MINUTES;
	END IF;
	RETURN V_FORMAT_HOURS;	
END FORMAT_NUMERIC_TO_HOUR;
/

SELECT FORMAT_NUMERIC_TO_HOUR(1453) FROM DUAL;

/*****************************************************************
Fonction pour avoir le nombre de places occupées maximal d'un vol
******************************************************************/
SHOW ERRORS FUNCTION GET_NUMBER_OF_OCCUPIED_PLACE;

CREATE OR REPLACE
	FUNCTION GET_NUMBER_OF_OCCUPIED_PLACE(P_ID_VOL IN NUMERIC, P_DATE_VOL IN VARCHAR2) RETURN NUMERIC
AS
	V_OCCUPIED NUMERIC;
BEGIN
	SELECT
		NVL(MAX(COUNT(RESERVATION_ENVOLEE.CODE_SIEGE)), 0) AS "SIEGE"
	INTO
		V_OCCUPIED
	FROM 
		SEGMENT
			INNER JOIN ENVOLEE
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
					INNER JOIN RESERVATION_ENVOLEE
						ON ENVOLEE.ID_ENVOLEE = RESERVATION_ENVOLEE.ID_ENVOLEE
	WHERE 
		SEGMENT.ID_VOL = P_ID_VOL AND
		TO_CHAR(ENVOLEE.DATE_ENVOLEE,'DD-MM-YYYY') = P_DATE_VOL
	GROUP BY
		SEGMENT.ORDRE_SEGMENT;
	RETURN V_OCCUPIED;
END GET_NUMBER_OF_OCCUPIED_PLACE;
/

SELECT GET_NUMBER_OF_OCCUPIED_PLACE(2, '14-05-2015') FROM DUAL;

/*****************************************************************************
Fonction qui retourne le nombre de minutes de vol d'un pilote entre deux date
******************************************************************************/
SHOW ERRORS FUNCTION minutes_vol_pilote;

CREATE OR REPLACE
	FUNCTION minutes_vol_pilote(p_no_pilote IN NUMERIC, p_date_début IN DATE, p_date_fin IN DATE) RETURN NUMERIC
AS
BEGIN 
	
END minutes_vol_pilote;

SELECT
	PILOTE.NO_PILOTE,
	ENVOLEE.ID_ENVOLEE,
	SEGMENT.DUREE_VOL
FROM
	PILOTE
		INNER JOIN ENVOLEE
			ON PILOTE.ID_PILOTE = ENVOLEE.ID_PILOTE
			INNER JOIN SEGMENT 
				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
WHERE
	ENVOLEE.DATE_ENVOLEE BETWEEN TO_CHAR(