CREATE TABLE "S423AHME"."Appointments"
( 
HealthCard_Number INT NOT NULL PRIMARY KEY,
Patient_Name VARCHAR2(25) NOT NULL UNIQUE,
Appointment_Date TIMESTAMP,
Outcomes VARCHAR(25)
);

INSERT INTO "S423AHME"."Appointments"
VALUES (1, 'Bob', TIMESTAMP'1997-01-31 09:26:50.12','Success');

commit;

SELECT * FROM "S423AHME"."Appointments";

DROP TABLE "S423AHME"."Appointments" PURGE;
