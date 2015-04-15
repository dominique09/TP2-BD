SQL> /*============================================================================
SQL> 	1.
SQL> 	Produire la liste des (segments de) vols de la compagnie NordAir au d‚part
SQL> 	de la C“te-Nord (municipalit‚s de Baie-Comeau, Havre Saint-Pierre et Sept-Iles)
SQL> 	comprenant dans l'ordre: le no de vol (VOL); le nom de la ville de
SQL> 	l'a‚roport de d‚part (DPART); l'heure de d‚part, sous le format
SQL> 	hh24:mi (·); le nom de la ville de l'a‚roport de destination (ARRIVE),
SQL> 	la dur‚e estim‚e du vol, sous le format hh24:mi (DURE)
SQL> 	Cette liste est tri‚e par ville de d‚part, heure de d‚part puis ville
SQL> 	de destination.
SQL> ============================================================================*/
SQL> SELECT --TESTE ET APPROUV
  2  	VOL.NO_VOL AS "VOL",
  3  	AER_DEPART.NOM_VILLE AS "DEPART",
  4  	TO_CHAR(SEGMENT.HEURE_DEPART,'HH24:MI') AS "A",
  5  	AER_DESTINATION.NOM_VILLE AS "ARRIVEE",
  6  	SUBSTR((SELECT FORMAT_NUMERIC_TO_HOUR(SEGMENT.DUREE_VOL) FROM DUAL),1,30) AS "DUREE"
  7  FROM
  8  	SEGMENT
  9  		INNER JOIN AEROPORT AER_DEPART
 10  			ON SEGMENT.AEROPORT_DEPART = AER_DEPART.ID_AEROPORT
 11  		INNER JOIN AEROPORT AER_DESTINATION
 12  			ON SEGMENT.AEROPORT_DESTINATION = AER_DESTINATION.ID_AEROPORT
 13  		INNER JOIN VOL
 14  			ON SEGMENT.ID_VOL = VOL.ID_VOL
 15  WHERE
 16  	SEGMENT.AEROPORT_DEPART IN (SELECT ID_AEROPORT
 17  								FROM AEROPORT
 18  								WHERE NOM_VILLE = 'BAIE-COMEAU' OR
 19  									  NOM_VILLE = 'HAVRE SAINT-PIERRE' OR
 20  									  NOM_VILLE = 'SEPT-ILE')
 21  ORDER BY
 22  	AER_DEPART.NOM_VILLE,
 23  	SEGMENT.HEURE_DEPART,
 24  	AER_DESTINATION.NOM_VILLE;

       VOL DEPART               A     ARRIVEE              DUREE                                                                                                                                                                                                                                            
---------- -------------------- ----- -------------------- ------------------------------                                                                                                                                                                                                                   
      1822 BAIE-COMEAU          07:00 SEPT-ILES            01:00                                                                                                                                                                                                                                            
      1923 BAIE-COMEAU          08:30 MONT-JOLI            00:45                                                                                                                                                                                                                                            
      1922 BAIE-COMEAU          18:30 SEPT-ILES            01:00                                                                                                                                                                                                                                            
      1823 BAIE-COMEAU          20:00 MONT-JOLI            00:45                                                                                                                                                                                                                                            
      1923 HAVRE SAINT-PIERRE   05:30 GASPE                00:40                                                                                                                                                                                                                                            
      1823 HAVRE SAINT-PIERRE   17:00 GASPE                00:40                                                                                                                                                                                                                                            

6 rows selected.

SQL> 
SQL> /*============================================================================
SQL> 	2.
SQL> 	Produire la liste des vols pr‚vus pour la p‚riode du 13 au 19 mai 2015.
SQL> 	Pour chacun, indiquer dans l'ordre: la date du vol, sous le
SQL> 	format YYYY-MM-DD (DATE), le num‚ro du vol (VOL), le nombre de places
SQL> 	dans l'avion (NB SIEGES), le nombre de siŠges encore disponibles pour
SQL> 	l'ensemble du vol (sur tous les segments) (DISPONIBLES).
SQL> 	Cette liste est tri‚e par date puis par vol.
SQL> ============================================================================*/
SQL> SELECT DISTINCT--TESTE ET APPROUV
  2  	TO_CHAR(ENVOLEE.DATE_ENVOLEE,'YYYY-MM-DD') AS "DATE VOL",
  3  	VOL.NO_VOL AS "VOL",
  4  	AVION.NOMBRE_PLACES AS "NB SIEGES",
  5  	AVION.NOMBRE_PLACES -(SELECT GET_NUMBER_OF_OCCUPIED_PLACE(VOL.ID_VOL, TO_CHAR(ENVOLEE.DATE_ENVOLEE,'DD-MM-YYYY')) FROM DUAL) AS "DISPONIBLES"
  6  FROM
  7  	ENVOLEE
  8  		INNER JOIN AVION
  9  			ON ENVOLEE.ID_AVION = AVION.ID_AVION
 10  		INNER JOIN SEGMENT
 11  			ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
 12  				INNER JOIN VOL
 13  					ON SEGMENT.ID_VOL = VOL.ID_VOL
 14  WHERE
 15  	ENVOLEE.DATE_ENVOLEE BETWEEN TO_DATE('13-05-2015','DD-MM-YYYY') AND
 16  								 TO_DATE('19-05-2015','DD-MM-YYYY')
 17  ORDER BY
 18  	"DATE VOL",
 19  	VOL.NO_VOL;

DATE VOL          VOL  NB SIEGES DISPONIBLES                                                                                                                                                                                                                                                                
---------- ---------- ---------- -----------                                                                                                                                                                                                                                                                
2015-05-13       1822         48          44                                                                                                                                                                                                                                                                
2015-05-13       1823         48          47                                                                                                                                                                                                                                                                
2015-05-13       1922         32          31                                                                                                                                                                                                                                                                
2015-05-13       1923         32          25                                                                                                                                                                                                                                                                
2015-05-14       1822         48          47                                                                                                                                                                                                                                                                
2015-05-14       1823         48          48                                                                                                                                                                                                                                                                
2015-05-14       1922         32          32                                                                                                                                                                                                                                                                
2015-05-14       1923         32          31                                                                                                                                                                                                                                                                
2015-05-15       1822         48          47                                                                                                                                                                                                                                                                
2015-05-15       1823         48          48                                                                                                                                                                                                                                                                
2015-05-15       1922         32          30                                                                                                                                                                                                                                                                

DATE VOL          VOL  NB SIEGES DISPONIBLES                                                                                                                                                                                                                                                                
---------- ---------- ---------- -----------                                                                                                                                                                                                                                                                
2015-05-15       1923         32          32                                                                                                                                                                                                                                                                
2015-05-16       1822         48          44                                                                                                                                                                                                                                                                
2015-05-16       1823         48          46                                                                                                                                                                                                                                                                
2015-05-16       1922         32          31                                                                                                                                                                                                                                                                
2015-05-16       1923         32          29                                                                                                                                                                                                                                                                
2015-05-17       1822         48          47                                                                                                                                                                                                                                                                
2015-05-17       1823         48          48                                                                                                                                                                                                                                                                
2015-05-17       1922         32          32                                                                                                                                                                                                                                                                
2015-05-17       1923         32          31                                                                                                                                                                                                                                                                
2015-05-18       1822         48          45                                                                                                                                                                                                                                                                
2015-05-18       1823         48          47                                                                                                                                                                                                                                                                

DATE VOL          VOL  NB SIEGES DISPONIBLES                                                                                                                                                                                                                                                                
---------- ---------- ---------- -----------                                                                                                                                                                                                                                                                
2015-05-18       1922         32          30                                                                                                                                                                                                                                                                
2015-05-18       1923         32          32                                                                                                                                                                                                                                                                
2015-05-19       1822         48          47                                                                                                                                                                                                                                                                
2015-05-19       1823         48          47                                                                                                                                                                                                                                                                
2015-05-19       1922         32          32                                                                                                                                                                                                                                                                
2015-05-19       1923         32          28                                                                                                                                                                                                                                                                

28 rows selected.

SQL> 
SQL> /*============================================================================
SQL> 	3.
SQL> 	Produire la liste des passagers pour les vols de la p‚riode du 13 au 19
SQL> 	mai 2015.  Cette liste comporte les informations suivantes dans l'ordre:
SQL> 	la date du vol, sous le format YYYY-MM-DD (DEPART), le num‚ro du vol (VOL),
SQL> 	le nom et le pr‚nom du passager (PASSAGER),le nom de la ville de l'a‚roport
SQL> 	initial de d‚part pour le passager (DE), le nom de la ville de l'a‚roport
SQL> 	de la destination finale (terminale) pour le passager (A).
SQL> 	Cette liste est tri‚e par date d'envol‚e, puis par vol, par segment initial
SQL> 	(ordre du segment) et par segment d'arriv‚e (ordre du segment), et
SQL> 	finalement par nom et pr‚nom des passagers
SQL> ============================================================================*/
SQL> SELECT
  2  	DATA_TABLE.DATE_DEPART AS "DEPART",
  3  	DATA_TABLE.NO_VOL AS "VOL",
  4  	DATA_TABLE.PASSAGER_NOM AS "PASSAGER",
  5  	DEP_ARPT.NOM_VILLE AS "DE",
  6  	ARR_ARPT.NOM_VILLE AS "A"
  7  FROM
  8  	(SELECT
  9  		TO_CHAR(ENVOLEE.DATE_ENVOLEE, 'YYYY-MM-DD') AS "DATE_DEPART",
 10  		VOL.NO_VOL AS "NO_VOL",
 11  		VOL.ID_VOL,
 12  		PASSAGER.NOM || ', ' || PASSAGER.PRENOM AS "PASSAGER_NOM",
 13  		MIN(SEGMENT.ORDRE_SEGMENT) AS "MIN_SEGEMNT",
 14  		MAX(SEGMENT.ORDRE_SEGMENT) AS "MAX_SEGMENT"
 15  	FROM
 16  		PASSAGER
 17  			INNER JOIN RESERVATION
 18  				ON RESERVATION.ID_PASSAGER = PASSAGER.ID_PASSAGER
 19  				INNER JOIN RESERVATION_ENVOLEE
 20  					ON RESERVATION_ENVOLEE.ID_RESERVATION = RESERVATION.ID_RESERVATION
 21  					INNER JOIN ENVOLEE
 22  						ON ENVOLEE.ID_ENVOLEE = RESERVATION_ENVOLEE.ID_ENVOLEE
 23  						INNER JOIN SEGMENT
 24  							ON SEGMENT.ID_SEGMENT = ENVOLEE.ID_SEGMENT
 25  							INNER JOIN VOL
 26  								ON VOL.ID_VOL = SEGMENT.ID_VOL
 27  	HAVING
 28  		ENVOLEE.DATE_ENVOLEE BETWEEN TO_DATE('13-05-2015','DD-MM-YYYY') AND
 29  									 TO_DATE('19-05-2015','DD-MM-YYYY')
 30  	GROUP BY
 31  		RESERVATION.ID_RESERVATION,
 32  		VOL.NO_VOL,
 33  		VOL.ID_VOL,
 34  		PASSAGER.NOM,
 35  		PASSAGER.PRENOM,
 36  		ENVOLEE.DATE_ENVOLEE) DATA_TABLE
 37  	INNER JOIN SEGMENT SEGMENT_DEPART
 38  		ON SEGMENT_DEPART.ORDRE_SEGMENT = DATA_TABLE.MIN_SEGEMNT
 39  		AND SEGMENT_DEPART.ID_VOL = DATA_TABLE.ID_VOL
 40  		INNER JOIN AEROPORT DEP_ARPT
 41  			ON DEP_ARPT.ID_AEROPORT = SEGMENT_DEPART.AEROPORT_DEPART
 42  	INNER JOIN SEGMENT SEGMENT_ARRIVEE
 43  		ON SEGMENT_ARRIVEE.ORDRE_SEGMENT = DATA_TABLE.MAX_SEGMENT
 44  		AND SEGMENT_ARRIVEE.ID_VOL = DATA_TABLE.ID_VOL
 45  		INNER JOIN AEROPORT ARR_ARPT
 46  			ON ARR_ARPT.ID_AEROPORT = SEGMENT_ARRIVEE.AEROPORT_DESTINATION
 47  ORDER BY
 48  	"DEPART",
 49  	"VOL",
 50  	DATA_TABLE.MIN_SEGEMNT,
 51  	DATA_TABLE.MAX_SEGMENT,
 52  	"PASSAGER";

DEPART            VOL PASSAGER                         DE                   A                                                                                                                                                                                                                               
---------- ---------- -------------------------------- -------------------- --------------------                                                                                                                                                                                                            
2015-05-13       1822 Barbeau, Isabelle                MONT-JOLI            BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-13       1822 Berthiaume, Jonny                MONT-JOLI            BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-13       1822 BrindAmour, Jean-Francois        MONT-JOLI            BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-13       1822 Desjardins, Francois             MONT-JOLI            HAVRE SAINT-PIERRE                                                                                                                                                                                                              
2015-05-13       1822 Bolduc, Sebastien                BAIE-COMEAU          SEPT-ILES                                                                                                                                                                                                                       
2015-05-13       1822 Mercier, David                   BAIE-COMEAU          SEPT-ILES                                                                                                                                                                                                                       
2015-05-13       1823 Berthiaume, Jonny                BAIE-COMEAU          MONT-JOLI                                                                                                                                                                                                                       
2015-05-13       1922 Nadeau, Michel                   GASPE                HAVRE SAINT-PIERRE                                                                                                                                                                                                              
2015-05-13       1923 Fortin, Mathieu                  HAVRE SAINT-PIERRE   SEPT-ILES                                                                                                                                                                                                                       
2015-05-13       1923 Ouellet, Remi                    HAVRE SAINT-PIERRE   SEPT-ILES                                                                                                                                                                                                                       
2015-05-13       1923 Gregoire, Pierre-Luc             HAVRE SAINT-PIERRE   BAIE-COMEAU                                                                                                                                                                                                                     

DEPART            VOL PASSAGER                         DE                   A                                                                                                                                                                                                                               
---------- ---------- -------------------------------- -------------------- --------------------                                                                                                                                                                                                            
2015-05-13       1923 Lapointe-Girard, etienne         HAVRE SAINT-PIERRE   BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-13       1923 Ouellette, Pierre                HAVRE SAINT-PIERRE   BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-13       1923 Talbot, Remi                     HAVRE SAINT-PIERRE   MONT-JOLI                                                                                                                                                                                                                       
2015-05-13       1923 Tremblay, Sebastien              HAVRE SAINT-PIERRE   MONT-JOLI                                                                                                                                                                                                                       
2015-05-13       1923 Poussier, Genevieve              SEPT-ILES            BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-13       1923 Tremblay, Vincent                SEPT-ILES            BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-14       1822 Harnois, Stephane J.             GASPE                HAVRE SAINT-PIERRE                                                                                                                                                                                                              
2015-05-14       1923 BrindAmour, Jean-Francois        GASPE                SEPT-ILES                                                                                                                                                                                                                       
2015-05-15       1822 Barbeau, Isabelle                SEPT-ILES            GASPE                                                                                                                                                                                                                           
2015-05-15       1922 Fortin, Mathieu                  SEPT-ILES            HAVRE SAINT-PIERRE                                                                                                                                                                                                              
2015-05-15       1922 Cote, Mathieu                    GASPE                HAVRE SAINT-PIERRE                                                                                                                                                                                                              

DEPART            VOL PASSAGER                         DE                   A                                                                                                                                                                                                                               
---------- ---------- -------------------------------- -------------------- --------------------                                                                                                                                                                                                            
2015-05-16       1822 Duval, Philippe                  MONT-JOLI            BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-16       1822 Lapierre, Guillaume              MONT-JOLI            BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-16       1822 Mallet, Sylvain                  MONT-JOLI            BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-16       1822 Saucier, Jean-Francois           MONT-JOLI            HAVRE SAINT-PIERRE                                                                                                                                                                                                              
2015-05-16       1822 Poussier, Genevieve              BAIE-COMEAU          SEPT-ILES                                                                                                                                                                                                                       
2015-05-16       1822 Fortin, Jean-Philippe            GASPE                HAVRE SAINT-PIERRE                                                                                                                                                                                                              
2015-05-16       1823 Barbeau, Isabelle                GASPE                SEPT-ILES                                                                                                                                                                                                                       
2015-05-16       1823 Jobin, Samuel                    GASPE                SEPT-ILES                                                                                                                                                                                                                       
2015-05-16       1823 Lapierre, Guillaume              BAIE-COMEAU          MONT-JOLI                                                                                                                                                                                                                       
2015-05-16       1922 Aubert, Vincent                  GASPE                HAVRE SAINT-PIERRE                                                                                                                                                                                                              
2015-05-16       1923 Fortin, Jean-Philippe            HAVRE SAINT-PIERRE   GASPE                                                                                                                                                                                                                           

DEPART            VOL PASSAGER                         DE                   A                                                                                                                                                                                                                               
---------- ---------- -------------------------------- -------------------- --------------------                                                                                                                                                                                                            
2015-05-16       1923 Fortin, Mathieu                  HAVRE SAINT-PIERRE   GASPE                                                                                                                                                                                                                           
2015-05-16       1923 Desjardins, Francois             HAVRE SAINT-PIERRE   BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-17       1822 Aspiros, Charles                 GASPE                HAVRE SAINT-PIERRE                                                                                                                                                                                                              
2015-05-17       1923 Ratte, Francois                  HAVRE SAINT-PIERRE   GASPE                                                                                                                                                                                                                           
2015-05-17       1923 Mallet, Sylvain                  GASPE                SEPT-ILES                                                                                                                                                                                                                       
2015-05-17       1923 Ouellet, Remi                    SEPT-ILES            BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-17       1923 Desjardins, Francois             BAIE-COMEAU          MONT-JOLI                                                                                                                                                                                                                       
2015-05-18       1822 Rouillard, Guy                   MONT-JOLI            BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-18       1822 Talbot, Remi                     MONT-JOLI            BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-18       1822 Tremblay, Sebastien              MONT-JOLI            BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-18       1822 Gregoire, Pierre-Luc             BAIE-COMEAU          SEPT-ILES                                                                                                                                                                                                                       

DEPART            VOL PASSAGER                         DE                   A                                                                                                                                                                                                                               
---------- ---------- -------------------------------- -------------------- --------------------                                                                                                                                                                                                            
2015-05-18       1822 Lapointe-Girard, etienne         BAIE-COMEAU          SEPT-ILES                                                                                                                                                                                                                       
2015-05-18       1822 Ouellette, Pierre                BAIE-COMEAU          SEPT-ILES                                                                                                                                                                                                                       
2015-05-18       1822 Lagace, Mathieu                  GASPE                HAVRE SAINT-PIERRE                                                                                                                                                                                                              
2015-05-18       1822 Ratte, Francois                  GASPE                HAVRE SAINT-PIERRE                                                                                                                                                                                                              
2015-05-18       1823 Dostie-Proulx, Pierre-Luc        SEPT-ILES            BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-18       1922 Dionne, Marjorie                 MONT-JOLI            BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-18       1922 Pelletier, Nathalie              MONT-JOLI            BAIE-COMEAU                                                                                                                                                                                                                     
2015-05-18       1922 Picard, Maxime                   SEPT-ILES            HAVRE SAINT-PIERRE                                                                                                                                                                                                              
2015-05-19       1822 Blanchette, Marc                 GASPE                HAVRE SAINT-PIERRE                                                                                                                                                                                                              
2015-05-19       1823 Richard, Jean-Francois           GASPE                SEPT-ILES                                                                                                                                                                                                                       
2015-05-19       1823 Mercier, Nicolas                 SEPT-ILES            BAIE-COMEAU                                                                                                                                                                                                                     

DEPART            VOL PASSAGER                         DE                   A                                                                                                                                                                                                                               
---------- ---------- -------------------------------- -------------------- --------------------                                                                                                                                                                                                            
2015-05-19       1923 Blanchette, Marc                 HAVRE SAINT-PIERRE   GASPE                                                                                                                                                                                                                           
2015-05-19       1923 Dube, Jason                      HAVRE SAINT-PIERRE   GASPE                                                                                                                                                                                                                           
2015-05-19       1923 Picard, Maxime                   HAVRE SAINT-PIERRE   GASPE                                                                                                                                                                                                                           
2015-05-19       1923 Saucier, Jean-Francois           HAVRE SAINT-PIERRE   BAIE-COMEAU                                                                                                                                                                                                                     

59 rows selected.

SQL> 
SQL> SPOOL OFF;
