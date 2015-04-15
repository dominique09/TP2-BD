SQL>  /*==============================================================================
SQL>  A.	Produire la liste de toutes les contraintes d'int‚grit‚ r‚f‚rentielle
SQL> 	(cl‚s ‚trangŠres). Pour chaque contrainte d'int‚grit‚ r‚f‚rentielle,
SQL> 	indiquer dans l'ordre : nom de la table enfant (TABLE ENFANT),
SQL> 	nom de la contrainte ‚trangŠre (CLE ETRANGERE), nom de la
SQL> 	contrainte primaire r‚f‚r‚e (CLE PRIMAIRE), nom de la table parent r‚f‚r‚e
SQL> 	(TABLE PARENT), la rŠgle d'action d‚finie pour la suppression (ON DELETE),
SQL> 	Trier par table enfant puis par contrainte r‚f‚rentielle.
SQL> ================================================================================*/
SQL> SELECT
  2  	UC.TABLE_NAME AS "TABLE ENFANT",
  3  	SUBSTR(UC.CONSTRAINT_NAME,0,15) AS "CLE ETRANGERE",
  4  	SUBSTR(UC.R_CONSTRAINT_NAME,0,15) AS "CLE PRIMAIRE",
  5  	(SELECT TABLE_NAME FROM USER_CONSTRAINTS WHERE CONSTRAINT_NAME = UC.R_CONSTRAINT_NAME) AS "TABLE PARENT",
  6  	UC.DELETE_RULE AS "ON DELETE"
  7  FROM
  8  	USER_CONSTRAINTS UC
  9  WHERE
 10  	UC.CONSTRAINT_TYPE = 'R'
 11  ORDER BY
 12  	"TABLE ENFANT",
 13  	"CLE ETRANGERE";

TABLE ENFANT                   CLE ETRANGERE   CLE PRIMAIRE    TABLE PARENT                   ON DELETE                                                                                                 
------------------------------ --------------- --------------- ------------------------------ ---------                                                                                                 
ENVOLEE                        FK1_AVION       PK_ID_AVION     AVION                          NO ACTION                                                                                                 
ENVOLEE                        FK2_PILOTE      PK_ID_PILOTE    PILOTE                         NO ACTION                                                                                                 
ENVOLEE                        FK3_SEGMENT     PK_ID_SEGMENT   SEGMENT                        NO ACTION                                                                                                 
RESERVATION                    FK1_PASSAGER    PK_ID_PASSAGER  PASSAGER                       NO ACTION                                                                                                 
RESERVATION_ENVOLEE            FK1_RESERVATION PK_ID_RESERVATI RESERVATION                    NO ACTION                                                                                                 
RESERVATION_ENVOLEE            FK2_ENVOLEE     PK_ID_ENVOLEE   ENVOLEE                        NO ACTION                                                                                                 
SEGMENT                        FK1_ID_VOL      PK_ID_VOL       VOL                            NO ACTION                                                                                                 
SEGMENT                        FK2_DEPART      PK_ID_AEROPORT  AEROPORT                       NO ACTION                                                                                                 
SEGMENT                        FK3_DESTINATION PK_ID_AEROPORT  AEROPORT                       NO ACTION                                                                                                 

9 rows selected.

SQL> 
SQL>  /*==============================================================================
SQL>  B.	Produire la liste de tous les index non uniques, avec les colonnes qui les
SQL> 	composent. Pour chaque index, indiquer dans l'ordre : nom de la table (TABLE),
SQL> 	nom de l'index (INDEX), type de l'index (TYPE), nom de la colonne
SQL> 	(COLONNE), position de la colonne dans l'index (POSITION),
SQL> 	ordre du tri : afficher ® ASCENDANT ¯ ou ® DESCENDANT ¯ (ORDRE).
SQL> 	Trier par nom table, nom index puis position de la colonne
SQL> ================================================================================*/
SQL> SELECT
  2  	SUBSTR(UI.TABLE_NAME,0,20) AS "TABLE",
  3  	UI.INDEX_NAME AS "NOM",
  4  	UI.INDEX_TYPE AS "TYPE",
  5  	SUBSTR(UIC.COLUMN_NAME,0,20) AS "COLONNE",
  6  	UIC.COLUMN_POSITION AS "POSITION"
  7  FROM
  8  	USER_INDEXES UI
  9  		INNER JOIN USER_IND_COLUMNS UIC
 10  			ON UI.INDEX_NAME = UIC.INDEX_NAME
 11  WHERE
 12  	UI.UNIQUENESS = 'NONUNIQUE'
 13  ORDER BY
 14  	"TABLE",
 15  	"NOM",
 16  	"POSITION" ASC;

TABLE                NOM                            TYPE                        COLONNE                POSITION                                                                                         
-------------------- ------------------------------ --------------------------- -------------------- ----------                                                                                         
ENVOLEE              IDX_ENVOLEE                    NORMAL                      DATE_ENVOLEE                  1                                                                                         
PASSAGER             IDX_PASSAGER                   NORMAL                      NOM                           1                                                                                         
PASSAGER             IDX_PASSAGER                   NORMAL                      PRENOM                        2                                                                                         
PILOTE               IDX_PILOTE                     NORMAL                      NOM                           1                                                                                         
PILOTE               IDX_PILOTE                     NORMAL                      PRENOM                        2                                                                                         
SEGMENT              IDX_SEGMENT                    NORMAL                      HEURE_DEPART                  1                                                                                         

6 rows selected.

SQL> 
SQL> SPOOL OFF;
