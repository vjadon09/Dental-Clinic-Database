CREATE TABLE "S423AHME"."Staff"
(
ID_Number INT NOT NULL,
Staff_ID INT NOT NULL,
Staff_Name VARCHAR2(35) NOT NULL UNIQUE,
Staff_Role VARCHAR2(55) NOT NULL,
Date_ofBirth DATE NOT NULL,
PRIMARY KEY (ID_Number),
REFERENCES Staff(Employee_ID)
);

INSERT INTO "S423AHME"."Staff"
VALUES (2946577, 'Wendell Bender','Dentist',date'1995-07-26');

commit;

SELECT * FROM "S423AHME"."Staff";

DROP TABLE "S423AHME"."Staff" PURGE;
