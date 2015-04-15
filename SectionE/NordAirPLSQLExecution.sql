SQL> /*===========================================================
SQL> Fonction pour convertir les minutes (num‚ric) en hh:mm
SQL> ===========================================================*/
SQL> --A)
SQL> CREATE OR REPLACE
  2  	FUNCTION FORMAT_NUMERIC_TO_HOUR(p_minutes IN NUMERIC) RETURN VARCHAR2
  3  AS
  4  	v_minutes NUMERIC;
  5  	v_hours NUMERIC;
  6  	v_format_hour VARCHAR2(5);
  7  BEGIN
  8  	v_minutes := MOD(p_minutes, 60);
  9  	v_hours := TRUNC(p_minutes / 60, 0);
 10  	IF(v_hours < 10) THEN
 11  		v_format_hour := '0' || v_hours || ':';
 12  	ELSE
 13  		v_format_hour := v_hours || ':';
 14  	END IF;
 15  	IF(v_minutes < 10) THEN
 16  		v_format_hour := v_format_hour || '0' || v_minutes;
 17  	ELSE
 18  		v_format_hour := v_format_hour|| v_minutes;
 19  	END IF;
 20  	RETURN v_format_hour;
 21  END FORMAT_NUMERIC_TO_HOUR;
 22  /

Function created.

SQL> SHOW ERRORS FUNCTION FORMAT_NUMERIC_TO_HOUR;
No errors.
SQL> 
SQL> --B)
SQL> 
SQL> SELECT
  2  	PILOTE.NO_PILOTE,
  3  	PILOTE.NOM,
  4  	PILOTE.PRENOM,
  5  	SUBSTR(FORMAT_NUMERIC_TO_HOUR(minutes_vol_pilote(PILOTE.NO_PILOTE,TO_DATE('13-05-2015','DD-MM-YYYY'),TO_DATE('19-05-2015','DD-MM-YYYY'))),0,20) AS HEURES
  6  FROM
  7  	PILOTE
  8  WHERE
  9  	PILOTE.NO_PILOTE IN (22, 34);

 NO_PILOTE NOM             PRENOM          HEURES                                                                                                                                                       
---------- --------------- --------------- --------------------                                                                                                                                         
        22 LAVIGNE         ROGER           23:40                                                                                                                                                        
        34 LATRIMOUILLE    ANDRE           17:45                                                                                                                                                        

SQL> 
SQL> /*=============================================================================
SQL> Fonction qui retourne le nombre de minutes de vol d'un pilote entre deux date
SQL> ==============================================================================*/
SQL> --A)
SQL> SET SERVEROUTPUT ON SIZE 30000;
SQL> 
SQL> CREATE OR REPLACE
  2  	FUNCTION minutes_vol_pilote(p_no_pilote IN NUMERIC, p_date_debut IN DATE, p_date_fin IN DATE) RETURN NUMERIC
  3  AS
  4  	v_nb_minutes NUMERIC;
  5  	v_pilote_existe NUMERIC;
  6  	e_no_pilote_invalide EXCEPTION;
  7  	e_dates_invalide EXCEPTION;
  8  BEGIN
  9  	SELECT COUNT(NO_PILOTE) INTO v_pilote_existe FROM PILOTE WHERE NO_PILOTE = p_no_pilote;
 10  	IF(v_pilote_existe = 0) THEN
 11  		RAISE e_no_pilote_invalide;
 12  	END IF;
 13  	IF(p_date_fin < p_date_debut) THEN
 14  		RAISE e_dates_invalide;
 15  	END IF;
 16  	SELECT
 17  		NVL(SUM(SEGMENT.DUREE_VOL),0) AS "NB MIN VOLS"
 18  	INTO
 19  		v_nb_minutes
 20  	FROM
 21  		PILOTE
 22  			LEFT OUTER JOIN ENVOLEE
 23  				ON ENVOLEE.ID_PILOTE = PILOTE.ID_PILOTE
 24  				LEFT OUTER JOIN SEGMENT
 25  					ON SEGMENT.ID_SEGMENT = ENVOLEE.ID_SEGMENT
 26  	WHERE
 27  		PILOTE.NO_PILOTE = p_no_pilote AND(
 28  		PILOTE.ID_PILOTE NOT IN (SELECT ID_PILOTE FROM ENVOLEE) OR
 29  		ENVOLEE.DATE_ENVOLEE BETWEEN p_date_debut AND
 30  									 p_date_fin);
 31  	RETURN v_nb_minutes;
 32  	EXCEPTION
 33  		WHEN e_no_pilote_invalide THEN
 34  			DBMS_OUTPUT.PUT_LINE('PILOTE ' || p_no_pilote || ' INEXISTANT');
 35  			RETURN -1;
 36  		WHEN e_dates_invalide THEN
 37  			DBMS_OUTPUT.PUT_LINE('DATES INVALIDES');
 38  			RETURN -1;
 39  
 40  END minutes_vol_pilote;
 41  /

Function created.

SQL> SHOW ERRORS FUNCTION minutes_vol_pilote;
No errors.
SQL> 
SQL> --B)
SQL> SELECT
  2  	PILOTE.NO_PILOTE,
  3  	PILOTE.NOM,
  4  	PILOTE.PRENOM,
  5  	minutes_vol_pilote(PILOTE.NO_PILOTE,TO_DATE('13-05-2015','DD-MM-YYYY'),TO_DATE('19-05-2015','DD-MM-YYYY')) AS MINUTES
  6  FROM
  7  	PILOTE
  8  WHERE
  9  	PILOTE.NO_PILOTE IN (22, 34);

 NO_PILOTE NOM             PRENOM             MINUTES                                                                                                                                                   
---------- --------------- --------------- ----------                                                                                                                                                   
        22 LAVIGNE         ROGER                 1420                                                                                                                                                   
        34 LATRIMOUILLE    ANDRE                 1065                                                                                                                                                   

SQL> 
SQL> --C)
SQL> SELECT minutes_vol_pilote(14,TO_DATE('13-05-2015','DD-MM-YYYY'),TO_DATE('19-05-2015','DD-MM-YYYY')) FROM DUAL;

MINUTES_VOL_PILOTE(14,TO_DATE('13-05-2015','DD-MM-YYYY'),TO_DATE('19-05-2015','DD-MM-YYYY'))                                                                                                            
--------------------------------------------------------------------------------------------                                                                                                            
                                                                                          -1                                                                                                            

PILOTE 14 INEXISTANT                                                                                                                                                                                    
SQL> SELECT minutes_vol_pilote(22,TO_DATE('29-05-2015','DD-MM-YYYY'),TO_DATE('19-05-2015','DD-MM-YYYY')) FROM DUAL;

MINUTES_VOL_PILOTE(22,TO_DATE('29-05-2015','DD-MM-YYYY'),TO_DATE('19-05-2015','DD-MM-YYYY'))                                                                                                            
--------------------------------------------------------------------------------------------                                                                                                            
                                                                                          -1                                                                                                            

DATES INVALIDES                                                                                                                                                                                         
SQL> 
SQL> /*=================================================================================
SQL> Fonction pour avoir le nombre de places occup‚es maximal d'un vol (voir dans Select 2)
SQL> ==================================================================================*/
SQL> 
SQL> CREATE OR REPLACE
  2  	FUNCTION GET_NUMBER_OF_OCCUPIED_PLACE(P_ID_VOL IN NUMERIC, P_DATE_VOL IN VARCHAR2) RETURN NUMERIC
  3  AS
  4  	V_OCCUPIED NUMERIC;
  5  BEGIN
  6  	SELECT
  7  		NVL(MAX(COUNT(RESERVATION_ENVOLEE.CODE_SIEGE)), 0) AS "SIEGE"
  8  	INTO
  9  		V_OCCUPIED
 10  	FROM
 11  		SEGMENT
 12  			INNER JOIN ENVOLEE
 13  				ON ENVOLEE.ID_SEGMENT = SEGMENT.ID_SEGMENT
 14  					INNER JOIN RESERVATION_ENVOLEE
 15  						ON ENVOLEE.ID_ENVOLEE = RESERVATION_ENVOLEE.ID_ENVOLEE
 16  	WHERE
 17  		SEGMENT.ID_VOL = P_ID_VOL AND
 18  		TO_CHAR(ENVOLEE.DATE_ENVOLEE,'DD-MM-YYYY') = P_DATE_VOL
 19  	GROUP BY
 20  		SEGMENT.ORDRE_SEGMENT;
 21  	RETURN V_OCCUPIED;
 22  END GET_NUMBER_OF_OCCUPIED_PLACE;
 23  /

Function created.

SQL> SHOW ERRORS FUNCTION GET_NUMBER_OF_OCCUPIED_PLACE;
No errors.
SQL> 
SQL> SPOOL OFF;
