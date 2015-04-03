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
