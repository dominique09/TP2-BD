/***********************************************************
	PL SQL FONCTION/PROCÉDURES
	Schéma MRD:	"NordAir"
	Auteur:		Dominique Septembre + Charles-Edouard Beaudet - Cégep de Ste-Foy  	
***********************************************************/

/***********************************************************
Fonction pour convertir les minutes (numéric) en hh:mm
***********************************************************/

CREATE OR REPLACE
	FUNCTION FORMAT_NUMERIC_TO_HOUR(P_NUMERIC IN NUMERIC) RETURN VARCHAR2(5)
AS
	V_HOUR VARCHAR2(5);
BEGIN
	IF(P_NUMERIC < 60) THEN
		("00:" || P_NUMERIC) INTO V_HOUR;
	END IF;
	RETURN V_HOUR;	
END FORMAT_NUMERIC_TO_HOUR;
/