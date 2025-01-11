CREATE TABLE "S423AHME"."Prescription"
( 
HealthCard_Number INT NOT NULL PRIMARY KEY,
Patient_Name VARCHAR2(25) NOT NULL UNIQUE,
FamilyDoctor_Name VARCHAR2(55) NOT NULL,
Medicine_Name VARCHAR(25),
Dosage VARCHAR2(55) NOT NULL,
Consumption_StartDate DATE NOT NULL,
Consumption_Intervals VARCHAR2(20) NOT NULL,
Consumption_EndDate DATE NOT NULL
);

INSERT INTO "S423AHME"."Prescription"
VALUES (104595039, 'Alexander','Dr. Kureha','One Piece','200 mg',date'2021-09-23', 'Once every 4 hours', date'2021-11-13');

commit;

SELECT * FROM "S423AHME"."Prescription";
DROP TABLE "S423AHME"."Prescription" PURGE;
