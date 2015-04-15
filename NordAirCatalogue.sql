/*===========================================================
	DDL Catalogue
	Sch�ma MRD:	"NordAir"
	Auteur:		Dominique Septembre & Charles-Edouard Beaudet - C�gep de Ste-Foy  	
===========================================================*/

SET LINESIZE 200;
SET ECHO ON;
SPOOL 'C:\SPOOL.txt';
 /*==============================================================================
 A.	Produire la liste de toutes les contraintes d�int�grit� r�f�rentielle 
	(cl�s �trang�res). Pour chaque contrainte d�int�grit� r�f�rentielle, 
	indiquer dans l�ordre : nom de la table enfant (TABLE ENFANT),
	nom de la contrainte �trang�re (CLE ETRANGERE), nom de la
	contrainte primaire r�f�r�e (CLE PRIMAIRE), nom de la table parent r�f�r�e 
	(TABLE PARENT), la r�gle d�action d�finie pour la suppression (ON DELETE), 
	Trier par table enfant puis par contrainte r�f�rentielle. 
================================================================================*/
SELECT
	UC.TABLE_NAME AS "TABLE ENFANT",
	SUBSTR(UC.CONSTRAINT_NAME,0,15) AS "CLE ETRANGERE",
	SUBSTR(UC.R_CONSTRAINT_NAME,0,15) AS "CLE PRIMAIRE",
	(SELECT TABLE_NAME FROM USER_CONSTRAINTS WHERE CONSTRAINT_NAME = UC.R_CONSTRAINT_NAME) AS "TABLE PARENT",
	UC.DELETE_RULE AS "ON DELETE"
FROM
	USER_CONSTRAINTS UC
WHERE
	UC.CONSTRAINT_TYPE = 'R'
ORDER BY
	"TABLE ENFANT",
	"CLE ETRANGERE";
	
 /*==============================================================================
 B.	Produire la liste de tous les index non uniques, avec les colonnes qui les 
	composent. Pour chaque index, indiquer dans l�ordre : nom de la table (TABLE),
	nom de l�index (INDEX), type de l�index (TYPE), nom de la colonne 
	(COLONNE), position de la colonne dans l�index (POSITION),
	ordre du tri : afficher � ASCENDANT � ou � DESCENDANT � (ORDRE).
	Trier par nom table, nom index puis position de la colonne 
================================================================================*/
SELECT
	SUBSTR(UI.TABLE_NAME,0,20) AS "TABLE",
	UI.INDEX_NAME AS "NOM",
	UI.INDEX_TYPE AS "TYPE",
	SUBSTR(UIC.COLUMN_NAME,0,20) AS "COLONNE",
	UIC.COLUMN_POSITION AS "POSITION"
FROM
	USER_INDEXES UI
		INNER JOIN USER_IND_COLUMNS UIC
			ON UI.INDEX_NAME = UIC.INDEX_NAME
WHERE
	UI.UNIQUENESS = 'NONUNIQUE'
ORDER BY 
	"TABLE",
	"NOM",
	"POSITION" ASC;
	
SPOOL OFF;