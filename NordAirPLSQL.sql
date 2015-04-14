/*===========================================================
	PL SQL FONCTION/PROCÉDURES
	Schéma MRD:	"NordAir"
	Auteur:		Dominique Septembre + Charles-Edouard Beaudet - Cégep de Ste-Foy  	
===========================================================*/

/*===========================================================
Fonction pour convertir les minutes (numéric) en hh:mm
===========================================================*/
--A)
SHOW ERRORS FUNCTION FORMAT_NUMERIC_TO_HOUR;

CREATE OR REPLACE
	FUNCTION FORMAT_NUMERIC_TO_HOUR(p_minutes IN NUMERIC) RETURN VARCHAR2
AS
	v_minutes NUMERIC;	
	v_hours NUMERIC;
	v_format_hour VARCHAR2(5);
BEGIN
	v_minutes := MOD(p_minutes, 60);
	v_hours := TRUNC(p_minutes / 60, 0);
	IF(v_hours < 10) THEN
		v_format_hour := '0' || v_hours || ':';
	ELSE
		v_format_hour := v_hours || ':';
	END IF;
	IF(v_minutes < 10) THEN
		v_format_hour := v_format_hour || '0' || v_minutes;
	ELSE
		v_format_hour := v_format_hour|| v_minutes;
	END IF;
	RETURN v_format_hour;	
END FORMAT_NUMERIC_TO_HOUR;
/

--B)
SELECT
	PILOTE.NO_PILOTE,
	PILOTE.NOM,
	PILOTE.PRENOM,
	SUBSTR(FORMAT_NUMERIC_TO_HOUR(minutes_vol_pilote(PILOTE.NO_PILOTE,TO_DATE('13-05-2015','DD-MM-YYYY'),TO_DATE('19-05-2015','DD-MM-YYYY'))),0,20) AS HEURES
FROM	
	PILOTE
WHERE
	PILOTE.NO_PILOTE IN (22, 34);

/*=============================================================================
Fonction qui retourne le nombre de minutes de vol d'un pilote entre deux date
==============================================================================*/
--A)
SET SERVEROUTPUT ON SIZE 30000;
SHOW ERRORS FUNCTION minutes_vol_pilote;

CREATE OR REPLACE
	FUNCTION minutes_vol_pilote(p_no_pilote IN NUMERIC, p_date_debut IN DATE, p_date_fin IN DATE) RETURN NUMERIC
AS
	v_nb_minutes NUMERIC;
	v_pilote_existe NUMERIC;
	e_no_pilote_invalide EXCEPTION;
	e_dates_invalide EXCEPTION;
BEGIN	
	SELECT COUNT(NO_PILOTE) INTO v_pilote_existe FROM PILOTE WHERE NO_PILOTE = p_no_pilote;
	IF(v_pilote_existe = 0) THEN
		RAISE e_no_pilote_invalide;
	END IF;	
	IF(p_date_fin < p_date_debut) THEN
		RAISE e_dates_invalide;
	END IF;
	SELECT
		NVL(SUM(SEGMENT.DUREE_VOL),0) AS "NB MIN VOLS"
	INTO	
		v_nb_minutes
	FROM 
		PILOTE
			LEFT OUTER JOIN ENVOLEE
				ON ENVOLEE.ID_PILOTE = PILOTE.ID_PILOTE
				LEFT OUTER JOIN SEGMENT
					ON SEGMENT.ID_SEGMENT = ENVOLEE.ID_SEGMENT
	WHERE
		PILOTE.NO_PILOTE = p_no_pilote AND(
		PILOTE.ID_PILOTE NOT IN (SELECT ID_PILOTE FROM ENVOLEE) OR
		ENVOLEE.DATE_ENVOLEE BETWEEN p_date_debut AND
									 p_date_fin);
	RETURN v_nb_minutes;								 
	EXCEPTION	
		WHEN e_no_pilote_invalide THEN
			DBMS_OUTPUT.PUT_LINE('PILOTE ' || p_no_pilote || ' INEXISTANT');
			RETURN -1;
		WHEN e_dates_invalide THEN
			DBMS_OUTPUT.PUT_LINE('DATES INVALIDES');
			RETURN -1;
			
END minutes_vol_pilote;
/
--B)
SELECT
	PILOTE.NO_PILOTE,
	PILOTE.NOM,
	PILOTE.PRENOM,
	minutes_vol_pilote(PILOTE.NO_PILOTE,TO_DATE('13-05-2015','DD-MM-YYYY'),TO_DATE('19-05-2015','DD-MM-YYYY')) AS MINUTES
FROM	
	PILOTE
WHERE
	PILOTE.NO_PILOTE IN (22, 34);
	
--C)
SELECT minutes_vol_pilote(14,TO_DATE('13-05-2015','DD-MM-YYYY'),TO_DATE('19-05-2015','DD-MM-YYYY')) FROM DUAL;
SELECT minutes_vol_pilote(22,TO_DATE('29-05-2015','DD-MM-YYYY'),TO_DATE('19-05-2015','DD-MM-YYYY')) FROM DUAL;

/*=================================================================
Fonction pour avoir le nombre de places occupées maximal d'un vol
==================================================================*/
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