CREATE TABLE "S423AHME"."GeneralInfo"
( 
ID_Number INT NOT NULL PRIMARY KEY,
General_Name VARCHAR2(33) NOT NULL UNIQUE,
Date_ofBirth VARCHAR2(22) NOT NULL UNIQUE,
Phone_Number VARCHAR2(22) NOT NULL UNIQUE
);

INSERT INTO "S423AHME"."GeneralInfo"
VALUES (3577642, 'Tylenol', 'Teva', 'Pill');

commit;

SELECT * FROM "S423AHME"."GeneralInfo";

DROP TABLE "S423AHME"."GeneralInfo" PURGE;
