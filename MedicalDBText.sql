DROP TABLE "S423AHME"."Medicine" PURGE;

DROP TABLE "S423AHME"."Appointments" PURGE;

DROP TABLE "S423AHME"."Patient" PURGE;

DROP TABLE "S423AHME"."Staff" PURGE;

DROP TABLE "S423AHME"."Prescription" PURGE;

DROP TABLE "S423AHME"."Treatments" PURGE;


CREATE TABLE "S423AHME"."Medicine"
(
Medicine_ID INT NOT NULL PRIMARY KEY,
Medicine_Name VARCHAR2(33) NOT NULL,
Medicine_Company VARCHAR2(22) NOT NULL UNIQUE,
Medicine_Type VARCHAR2(22)
);

INSERT INTO "S423AHME"."Medicine"
VALUES (3577642, 'Tylenol', 'Teva', 'Pill');

INSERT INTO "S423AHME"."Medicine"
VALUES (1114290, 'Sukunas Finger', 'Ryomen Sukuna', 'Cursed Object');
        
INSERT INTO "S423AHME"."Medicine"
VALUES (1714988, 'Rumble Ball', 'Tony Tony Chopper', 'Capsule');

INSERT INTO "S423AHME"."Medicine"
VALUES (5968302, 'Ibuprofen', 'Advil', 'Pill');

INSERT INTO "S423AHME"."Medicine"
VALUES (0000555, 'Aspirin', 'Bayer', 'Pill');


commit;

SELECT * FROM "S423AHME"."Medicine";

SELECT * FROM "Medicine" WHERE Medicine_Type = 'Pill' AND Medicine_ID >= 1111111;

DROP VIEW "DangerousMedicines";
CREATE VIEW "DangerousMedicines" AS 
SELECT Medicine_Name, Medicine_Company
FROM "S423AHME"."Medicine" WHERE Medicine_ID = 1114290 OR Medicine_ID = 1714988;
SELECT * FROM "DangerousMedicines";


CREATE TABLE "S423AHME"."Appointments"
(
HealthCard_Number VARCHAR2(15) NOT NULL PRIMARY KEY,
Patient_Name VARCHAR2(35) NOT NULL UNIQUE,
Appointment_Date TIMESTAMP,
Outcomes VARCHAR(25)
);

INSERT INTO "S423AHME"."Appointments"
VALUES ('9090-766-534-JT', 'Bob', TIMESTAMP'1997-01-31 09:26:50.12','Success');

INSERT INTO "S423AHME"."Appointments"
VALUES ('0938-534-877-WD', 'Monkey D Luffy', TIMESTAMP'2017-03-13 12:32:09.53','Success');

INSERT INTO "S423AHME"."Appointments"
VALUES ('7231-096-576-MQ', 'Jill Harolds', TIMESTAMP'2022-05-16 19:55:23.44','Success');

INSERT INTO "S423AHME"."Appointments"
VALUES ('4901-632-013-AS', 'Donald Reagen', TIMESTAMP'1985-07-18 03:15:55.21','Failure');

commit;

SELECT * FROM "S423AHME"."Appointments";

SELECT * FROM "S423AHME"."Appointments" ORDER BY Appointment_Date DESC;

SELECT Outcomes FROM "S423AHME"."Appointments" WHERE Outcomes = 'Success';





CREATE TABLE "S423AHME"."Patient"
(
HealthCard_Number VARCHAR2(15) NOT NULL PRIMARY KEY,
Patient_Name VARCHAR2(33),
Phone_Number VARCHAR2(22),
Date_ofBirth DATE NOT NULL,
InsuranceCompany_Name VARCHAR(25),
Address VARCHAR2(60)
);

INSERT INTO "S423AHME"."Patient"
VALUES ('8097-194-293-PL', 'Mindy West','647-727-1337',date'1980-04-01','Desjardins','35 Honey Drive, Sudbury, CA');

INSERT INTO "S423AHME"."Patient"
VALUES ('4189-180-239-ED', 'Jack Jones','647-333-5197',date'1998-10-14','SunLife','3380 Beach Bay, Toronto, CA');

INSERT INTO "S423AHME"."Patient"
VALUES ('5692-102-102-MD', 'Yuji Itadori','647-859-0193',date'2003-03-20','SunLife','JP');

INSERT INTO "S423AHME"."Patient"
VALUES ('0938-534-877-WD', 'Monkey D Luffy','647-632-9984',date'1997-05-05','SunLife','Foosha Village, Dawn Island');

INSERT INTO "S423AHME"."Patient"
VALUES ('9090-766-534-JT', 'Bob','416-145-3012',date'1973-12-17','Blue Cross Canada','Burnview Crescent, Toronto, CA');

INSERT INTO "S423AHME"."Patient"
VALUES ('7231-096-576-MQ', 'Jill Harolds','416-335-3012',date'1984-07-28','Manulife','Falmouth Avenue, Toronto, CA');

INSERT INTO "S423AHME"."Patient"
VALUES ('4901-632-013-AS', 'Donald Reagen','718-965-3535',date'1911-02-06','Allstate','Falmouth Avenue, Toronto, US');

INSERT INTO "S423AHME"."Patient"
VALUES ('9710-984-233-YM', 'Jougo','647-859-0193',date'2013-09-30','Desjardins','JP');


commit;

SELECT * FROM "S423AHME"."Patient";

SELECT * FROM "S423AHME"."Patient" ORDER BY Date_ofBirth ASC;

SELECT Healthcard_Number, Patient_Name, InsuranceCompany_Name FROM "S423AHME"."Patient" WHERE InsuranceCompany_Name = 'SunLife';

DROP VIEW "PatientInsuranceCo";
CREATE VIEW "PatientInsuranceCo" AS 
SELECT Patient_Name, HealthCard_Number
FROM "S423AHME"."Patient" WHERE InsuranceCompany_Name = 'SunLife';
SELECT * FROM "PatientInsuranceCo";






CREATE TABLE "S423AHME"."Staff"
(
Staff_ID INT NOT NULL PRIMARY KEY,
Staff_Name VARCHAR2(35) NOT NULL UNIQUE,
Staff_Role VARCHAR2(55) NOT NULL,
Date_ofBirth DATE NOT NULL
);

INSERT INTO "S423AHME"."Staff"
VALUES (4545667, 'Wendell Bender','Dentist',date'1995-07-26');

INSERT INTO "S423AHME"."Staff"
VALUES (1048228, 'Gregory House','Dentist',date'1959-06-11');

INSERT INTO "S423AHME"."Staff"
VALUES (4018590, 'Pam Beesly','Receptionist',date'1979-03-25');

INSERT INTO "S423AHME"."Staff"
VALUES (1482859, 'Doc Q','Dentist',date'1965-10-18');

INSERT INTO "S423AHME"."Staff"
VALUES (1355964, 'Gojo Satoru','Dentist',date'1989-12-07');

INSERT INTO "S423AHME"."Staff"
VALUES (1038579, 'Josuke Higashikata','Dentist',date'1983-12-18');

commit;

SELECT * FROM "S423AHME"."Staff";

SELECT DISTINCT Staff_ID FROM "Staff";


DROP VIEW "StaffOnStandby";
CREATE VIEW "StaffOnStandby" AS 
SELECT Staff_Name, Staff_Role
FROM "S423AHME"."Staff" WHERE Staff_Name = 'Gregory House' OR Staff_Name = 'Josuke Higashikata';
SELECT * FROM "StaffOnStandby";



CREATE TABLE "S423AHME"."Prescription"
(
HealthCard_Number VARCHAR2(15) NOT NULL PRIMARY KEY,
Patient_Name VARCHAR2(25) NOT NULL UNIQUE,
FamilyDoctor_Name VARCHAR2(55) NOT NULL,
Medicine_Name VARCHAR(25),
Dosage VARCHAR2(55) NOT NULL,
Consumption_StartDate DATE NOT NULL,
Consumption_Intervals VARCHAR2(20) NOT NULL,
Consumption_EndDate DATE NOT NULL
);

INSERT INTO "S423AHME"."Prescription"
VALUES ('0938-534-877-WD', 'Monkey D Luffy','Doc Q','Bad Apple','300 g',date'2002-03-25', 'Eat Once', date'2002-03-25');

INSERT INTO "S423AHME"."Prescription"
VALUES ('9710-984-233-YM', 'Jougo','Gojo Satoru','Yowai Mo','350 mg',date'2020-11-14', 'Once every 6 hours', date'2021-01-01');

INSERT INTO "S423AHME"."Prescription"
VALUES ('8097-194-293-PL', 'Mindy West','Wendell Bender','Ibuprofen','450 mg',date'2022-09-15', 'Once every 4 hours', date'2022-09-29');



commit;

SELECT * FROM "S423AHME"."Prescription";

SELECT * FROM "Prescription" WHERE Dosage = '350 mg';


CREATE TABLE "S423AHME"."Treatments"
(
HealthCard_Number VARCHAR (15) NOT NULL,
Treatment_Name VARCHAR2(33) NOT NULL,
Treatment_Cost INT NOT NULL,
Treatment_Duration VARCHAR2(32),
Treatment_Date DATE NOT NULL,
Treatment_ID INT NOT NULL,
Treatment_Notes VARCHAR2(33),
Num_Treats INT NOT NULL
);

INSERT INTO "S423AHME"."Treatments"
VALUES ('5692-102-102-MD', 'Cavity Filling', '250', '1 hour', '2018-04-14', '9870434', 'Flossing really helps!', 1);

INSERT INTO "S423AHME"."Treatments"
VALUES ('5692-102-102-MD', 'Braces', '2500', '1 hour', '2018-04-14', '9870447', 'Do not eat hard foods!', 2);

INSERT INTO "S423AHME"."Treatments"
VALUES ('4189-180-239-ED', 'Wisdom Teeth Removal', '550', '2 hours', '2022-06-11', '9965037', 'Send an invoice to SunLife', 1);

INSERT INTO "S423AHME"."Treatments"
VALUES ('5692-102-102-MD', 'Braces', '2500', '1 hour', '2022-03-27', '9152980', 'N/A', 1);

commit;

SELECT * FROM "S423AHME"."Treatments" ORDER BY Treatment_Date ASC;

SELECT Treatment_Date, COUNT (Treatment_ID) AS Num_Treats FROM "S423AHME"."Treatments" GROUP BY Treatment_Date;


SELECT
"Patient".HealthCard_Number,
"Patient".Phone_Number,
"Appointments".Appointment_Date
FROM "S423AHME"."Patient"
INNER JOIN "S423AHME"."Appointments" 
ON "Patient".Patient_Name = "Appointments".Patient_Name
ORDER BY "Appointments".Appointment_Date DESC;


SELECT
"Patient".Patient_Name,
"Prescription".FamilyDoctor_Name,
"Prescription".Consumption_StartDate
FROM "S423AHME"."Patient"
INNER JOIN "S423AHME"."Prescription" 
ON "Prescription".Patient_Name = "Patient".Patient_Name
INNER JOIN "S423AHME"."Staff" 
ON "Staff".Staff_Name = "Prescription".FamilyDoctor_Name
ORDER BY "Prescription".Consumption_StartDate ASC;

SELECT
"Patient".HealthCard_Number,
"Treatments".Treatment_Name,
"Treatments".Treatment_Date,
"Treatments".Treatment_ID
FROM "S423AHME"."Treatments"
INNER JOIN "S423AHME"."Patient" 
ON "Treatments".HealthCard_Number = "Patient".HealthCard_Number;
