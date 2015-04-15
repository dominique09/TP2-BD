/*===========================================================
	DQL Select
	Sch�ma MRD:	"NordAir"
	Auteur:		Dominique Septembre & Charles-Edouard Beaudet - C�gep de Ste-Foy  	
===========================================================*/
SET LINESIZE 300;
SET ECHO ON;
SPOOL 'C:\SPOOL.txt';
/*============================================================================
	1.
	Produire la liste des (segments de) vols de la compagnie NordAir au d�part 
	de la C�te-Nord (municipalit�s de Baie-Comeau, Havre Saint-Pierre et Sept-Iles)
	comprenant dans l'ordre: le no de vol (VOL); le nom de la ville de
	l'a�roport de d�part (D�PART); l'heure de d�part, sous le format
	hh24:mi (�); le nom de la ville de l'a�roport de destination (ARRIV�E),
	la dur�e estim�e du vol, sous le format hh24:mi (DUR�E) 
	Cette liste est tri�e par ville de d�part, heure de d�part puis ville 
	de destination. 
============================================================================*/
SELECT --TEST�E ET APPROUV�
	VOL.NO_VOL AS "VOL",
	AER_DEPART.NOM_VILLE AS "DEPART",
	TO_CHAR(SEGMENT.HEURE_DEPART,'HH24:MI') AS "A",
	AER_DESTINATION.NOM_VILLE AS "ARRIVEE",
	SUBSTR((SELECT FORMAT_NUMERIC_TO_HOUR(SEGMENT.DUREE_VOL) FROM DUAL),1,30) AS "DUREE"
FROM
	SEGMENT
		INNER JOIN AEROPORT AER_DEPART
			ON SEGMENT.AEROPORT_DEPART = AER_DEPART.ID_AEROPORT
		INNER JOIN AEROPORT AER_DESTINATION
			ON SEGMENT.AEROPORT_DESTINATION = AER_DESTINATION.ID_AEROPORT
		INNER JOIN VOL
			ON SEGMENT.ID_VOL = VOL.ID_VOL
WHERE
	SEGMENT.AEROPORT_DEPART IN (SELECT ID_AEROPORT 
								FROM AEROPORT 
								WHERE NOM_VILLE = 'BAIE-COMEAU' OR 
									  NOM_VILLE = 'HAVRE SAINT-PIERRE' OR
									  NOM_VILLE = 'SEPT-ILE')
ORDER BY				
	AER_DEPART.NOM_VILLE,
	SEGMENT.HEURE_DEPART,
	AER_DESTINATION.NOM_VILLE;

/*============================================================================
	2.
	Produire la liste des vols pr�vus pour la p�riode du 13 au 19 mai 2015.
	Pour chacun, indiquer dans l'ordre: la date du vol, sous le 
	format YYYY-MM-DD (DATE), le num�ro du vol (VOL), le nombre de places
	dans l'avion (NB SIEGES), le nombre de si�ges encore disponibles pour 
	l'ensemble du vol (sur tous les segments) (DISPONIBLES).
	Cette liste est tri�e par date puis par vol. 
============================================================================*/
SELECT DISTINCT--TEST�E ET APPROUV�
	TO_CHAR(ENVOLEE.DATE_ENVOLEE,'YYYY-MM-DD') AS "DATE VOL",
	VOL.NO_VOL AS "VOL",
	AVION.NOMBRE_PLACES AS "NB SIEGES",
	AVION.NOMBRE_PLACES -(SELECT GET_NUMBER_OF_OCCUPIED_PLACE(VOL.ID_VOL, TO_CHAR(ENVOLEE.DATE_ENVOLEE,'DD-MM-YYYY')) FROM DUAL) AS "DISPONIBLES" 
FROM
	ENVOLEE
		INNER JOIN AVION
			ON ENVOLEE.ID_AVION = AVION.ID_AVION
		INNER JOIN SEGMENT
			ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
				INNER JOIN VOL
					ON SEGMENT.ID_VOL = VOL.ID_VOL
WHERE
	ENVOLEE.DATE_ENVOLEE BETWEEN TO_DATE('13-05-2015','DD-MM-YYYY') AND
								 TO_DATE('19-05-2015','DD-MM-YYYY')
ORDER BY
	"DATE VOL",
	VOL.NO_VOL;

/*============================================================================
	3.
	Produire la liste des passagers pour les vols de la p�riode du 13 au 19 
	mai 2015.  Cette liste comporte les informations suivantes dans l'ordre:
	la date du vol, sous le format YYYY-MM-DD (DEPART), le num�ro du vol (VOL), 
	le nom et le pr�nom du passager (PASSAGER),le nom de la ville de l'a�roport
	initial de d�part pour le passager (DE), le nom de la ville de l'a�roport
	de la destination finale (terminale) pour le passager (A). 
	Cette liste est tri�e par date d'envol�e, puis par vol, par segment initial 
	(ordre du segment) et par segment d�arriv�e (ordre du segment), et 
	finalement par nom et pr�nom des passagers
============================================================================*/
SELECT
	DATA_TABLE.DATE_DEPART AS "DEPART",
	DATA_TABLE.NO_VOL AS "VOL",
	DATA_TABLE.PASSAGER_NOM AS "PASSAGER",
	DEP_ARPT.NOM_VILLE AS "DE",
	ARR_ARPT.NOM_VILLE AS "A"
FROM
	(SELECT
		TO_CHAR(ENVOLEE.DATE_ENVOLEE, 'YYYY-MM-DD') AS "DATE_DEPART",
		VOL.NO_VOL AS "NO_VOL",
		VOL.ID_VOL,
		PASSAGER.NOM || ', ' || PASSAGER.PRENOM AS "PASSAGER_NOM",
		MIN(SEGMENT.ORDRE_SEGMENT) AS "MIN_SEGEMNT",
		MAX(SEGMENT.ORDRE_SEGMENT) AS "MAX_SEGMENT"
	FROM
		PASSAGER
			INNER JOIN RESERVATION
				ON RESERVATION.ID_PASSAGER = PASSAGER.ID_PASSAGER
				INNER JOIN RESERVATION_ENVOLEE
					ON RESERVATION_ENVOLEE.ID_RESERVATION = RESERVATION.ID_RESERVATION
					INNER JOIN ENVOLEE
						ON ENVOLEE.ID_ENVOLEE = RESERVATION_ENVOLEE.ID_ENVOLEE
						INNER JOIN SEGMENT
							ON SEGMENT.ID_SEGMENT = ENVOLEE.ID_SEGMENT
							INNER JOIN VOL
								ON VOL.ID_VOL = SEGMENT.ID_VOL
	HAVING
		ENVOLEE.DATE_ENVOLEE BETWEEN TO_DATE('13-05-2015','DD-MM-YYYY') AND
									 TO_DATE('19-05-2015','DD-MM-YYYY')
	GROUP BY
		RESERVATION.ID_RESERVATION,
		VOL.NO_VOL,
		VOL.ID_VOL,
		PASSAGER.NOM,
		PASSAGER.PRENOM,
		ENVOLEE.DATE_ENVOLEE) DATA_TABLE
	INNER JOIN SEGMENT SEGMENT_DEPART
		ON SEGMENT_DEPART.ORDRE_SEGMENT = DATA_TABLE.MIN_SEGEMNT
		AND SEGMENT_DEPART.ID_VOL = DATA_TABLE.ID_VOL
		INNER JOIN AEROPORT DEP_ARPT
			ON DEP_ARPT.ID_AEROPORT = SEGMENT_DEPART.AEROPORT_DEPART
	INNER JOIN SEGMENT SEGMENT_ARRIVEE
		ON SEGMENT_ARRIVEE.ORDRE_SEGMENT = DATA_TABLE.MAX_SEGMENT
		AND SEGMENT_ARRIVEE.ID_VOL = DATA_TABLE.ID_VOL
		INNER JOIN AEROPORT ARR_ARPT
			ON ARR_ARPT.ID_AEROPORT = SEGMENT_ARRIVEE.AEROPORT_DESTINATION
ORDER BY
	"DEPART",
	"VOL",
	DATA_TABLE.MIN_SEGEMNT,
	DATA_TABLE.MAX_SEGMENT,
	"PASSAGER";

SPOOL OFF;