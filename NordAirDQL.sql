/*===========================================================
	DQL Select
	Schéma MRD:	"NordAir"
	Auteur:		Dominique Septembre & Charles-Edouard Beaudet - Cégep de Ste-Foy  	
===========================================================*/

/*============================================================================
	1.
	Produire la liste des (segments de) vols de la compagnie NordAir au départ 
	de la Côte-Nord (municipalités de Baie-Comeau, Havre Saint-Pierre et Sept-Iles)
	comprenant dans l'ordre: le no de vol (VOL); le nom de la ville de
	l'aéroport de départ (DÉPART); l'heure de départ, sous le format
	hh24:mi (À); le nom de la ville de l'aéroport de destination (ARRIVÉE),
	la durée estimée du vol, sous le format hh24:mi (DURÉE) 
	Cette liste est triée par ville de départ, heure de départ puis ville 
	de destination. 
============================================================================*/
SELECT --À TESTER
	VOL.NO_VOL AS "VOL",
	AER_DEPART.NOM_VILLE AS "DEPART",
	TO_CHAR(SEGMENT.HEURE_DEPART,'HH24:MI') AS "A",
	AER_DESTINATION.NOM_VILLE AS "ARRIVEE",
	(SELECT FORMAT_NUMERIC_TO_HOUR(SEGMENT.DUREE_VOL) FROM DUAL) AS "DUREE"
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
	Produire la liste des vols prévus pour la période du 13 au 19 mai 2015.
	Pour chacun, indiquer dans l'ordre: la date du vol, sous le 
	format YYYY-MM-DD (DATE), le numéro du vol (VOL), le nombre de places
	dans l'avion (NB SIEGES), le nombre de sièges encore disponibles pour 
	l'ensemble du vol (sur tous les segments) (DISPONIBLES).
	Cette liste est triée par date puis par vol. 
============================================================================*/
SELECT DISTINCT--À TESTER
	TO_DATE(ENVOLEE.DATE_ENVOLEE,'YYYY-MM-DD') AS "DATE VOL",
	VOL.NO_VOL AS "VOL",
	AVION.NOMBRE_PLACES AS "NB SIEGES",
	(SELECT GET_NUMBER_OF_AVAILABLE_PLACE(VOL.ID_VOL) FROM DUAL) AS "DISPONIBLES" 
FROM
	ENVOLEE
		INNER JOIN AVION
			ON ENVOLEE.ID_AVION = AVION.ID_AVION
		INNER JOIN SEGMENT
			ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT AND
			ENVOLEE.DATE_ENVOLEE BETWEEN TO_DATE('13-05-2015','DD-MM-YYYY') AND
								 TO_DATE('19-05-2015','DD-MM-YYYY')
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
	Produire la liste des passagers pour les vols de la période du 13 au 19 
	mai 2015.  Cette liste comporte les informations suivantes dans l'ordre:
	la date du vol, sous le format YYYY-MM-DD (DEPART), le numéro du vol (VOL), 
	le nom et le prénom du passager (PASSAGER),le nom de la ville de l'aéroport
	initial de départ pour le passager (DE), le nom de la ville de l'aéroport
	de la destination finale (terminale) pour le passager (A). 
	Cette liste est triée par date d'envolée, puis par vol, par segment initial 
	(ordre du segment) et par segment d’arrivée (ordre du segment), et 
	finalement par nom et prénom des passagers
============================================================================*/
			

