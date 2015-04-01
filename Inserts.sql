/*===============================================================================
     Table PILOTE : 4 Pilotes
/*===============================================================================*/
INSERT INTO
	PILOTE
		(ID_PILOTE,
		NO_PILOTE,
		NOM,
		PRENOM,
		ADRESSE,
		TELEPHONE)
	VALUES
		(SEQ_ID_PILOTE.NEXTVAL,
		22,
		'LAVIGNE',
		'ROGER',
		'44 DUROCHER',
		'418-666-3333');
INSERT INTO
	PILOTE
		(ID_PILOTE,
		NO_PILOTE,
		NOM,
		PRENOM,
		ADRESSE,
		TELEPHONE)
	VALUES
		(SEQ_ID_PILOTE.NEXTVAL,
		34,
		'LATRIMOUILLE',
		'ANDRE',
		'5353 MONFORT',
		'540-555-3344');
INSERT INTO
	PILOTE
		(ID_PILOTE,
		NO_PILOTE,
		NOM,
		PRENOM,
		ADRESSE,
		TELEPHONE)
	VALUES
		(SEQ_ID_PILOTE.NEXTVAL,
		55,
		'LAVERTU',
		'MARIE',
		'5353 MONFORT',
		'540-555-3344');
INSERT INTO
	PILOTE
		(ID_PILOTE,
		NO_PILOTE,
		NOM,
		PRENOM,
		ADRESSE,
		TELEPHONE)
	VALUES
		(SEQ_ID_PILOTE.NEXTVAL,
		61,
		'GENEST',
		'CLAUDINE',
		'1722 CRESENT, APP 3',
		'514-555-1234');
/*===============================================================================
     Table AVION : 2 Avions
/*===============================================================================*/
INSERT INTO
	AVION(
		ID_AVION,
		APPEL_AVION,
		NOMBRE_PLACE)
	VALUES
		(SEQ_ID_AVION.NEXTVAL,
		'CADM',
		32);
INSERT INTO
	AVION(
		ID_AVION,
		APPEL_AVION,
		NOMBRE_PLACE)
	VALUES
		(SEQ_ID_AVION.NEXTVAL,
		'COPA',
		48);
/*===============================================================================
     Table AEROPORT : 6 Aeroports
/*===============================================================================*/
INSERT INTO
	AEROPORT(
		ID_AEROPORT,
		ACR_AEROPORT,
		NOM_VILLE)
	VALUES
		(SEQ_ID_AEROPORT.NEXTVAL,
		'QSI',
		'SEPT-ILES');
INSERT INTO
	AEROPORT(
		ID_AEROPORT,
		ACR_AEROPORT,
		NOM_VILLE)
	VALUES
		(SEQ_ID_AEROPORT.NEXTVAL,
		'QGA',
		'GASPE');
INSERT INTO
	AEROPORT(
		ID_AEROPORT,
		ACR_AEROPORT,
		NOM_VILLE)
	VALUES
		(SEQ_ID_AEROPORT.NEXTVAL,
		'QRY',
		'RIMOUSKI');
INSERT INTO
	AEROPORT(
		ID_AEROPORT,
		ACR_AEROPORT,
		NOM_VILLE)
	VALUES
		(SEQ_ID_AEROPORT.NEXTVAL,
		'QBC',
		'BAIE-COMEAU');
INSERT INTO
	AEROPORT(
		ID_AEROPORT,
		ACR_AEROPORT,
		NOM_VILLE)
	VALUES
		(SEQ_ID_AEROPORT.NEXTVAL,
		'QMJ',
		'MONT-JOLI');
INSERT INTO
	AEROPORT(
		ID_AEROPORT,
		ACR_AEROPORT,
		NOM_VILLE)
	VALUES
		(SEQ_ID_AEROPORT.NEXTVAL,
		'QHP',
		'HAVRE SAINT-PIERRE');
/*===============================================================================
     Table VOL : 4 Vols
/*===============================================================================*/
INSERT INTO
	VOL(ID_VOL,
		NO_VOL,
		NOTES)
	VALUES
		(SEQ_ID_VOL.NEXTVAL,
		1822,
		NULL);
INSERT INTO
	VOL(ID_VOL,
		NO_VOL,
		NOTES)
	VALUES
		(SEQ_ID_VOL.NEXTVAL,
		1823,
		NULL);
INSERT INTO
	VOL(ID_VOL,
		NO_VOL,
		NOTES)
	VALUES
		(SEQ_ID_VOL.NEXTVAL,
		1922,
		NULL);
INSERT INTO
	VOL(ID_VOL,
		NO_VOL,
		NOTES)
	VALUES
		(SEQ_ID_VOL.NEXTVAL,
		1923,
		NULL);
/*===============================================================================
     Table PASSAGER : ## Passagers
/*===============================================================================*/
		