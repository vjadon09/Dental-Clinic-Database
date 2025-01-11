CREATE TABLE "S423AHME"."Patient"
( 
HealthCard_Number INT NOT NULL PRIMARY KEY,
Patient_Name VARCHAR2(33),
Phone_Number VARCHAR2(22),
Date_ofBirth DATE NOT NULL,
InsuranceCompany_Name VARCHAR(25),
Address VARCHAR2(60)
);

INSERT INTO "S423AHME"."Patient"
VALUES (104595039, 'Randy Orton','647-727-1337',date'1980-04-01','MoonWatch','35 Honey Drive, New York, US');

commit;

SELECT * FROM "S423AHME"."Patient";

DROP TABLE "S423AHME"."Patient" PURGE;
