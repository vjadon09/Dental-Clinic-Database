CREATE TABLE "S423AHME"."Medicine"
( 
Medicine_ID INT NOT NULL PRIMARY KEY,
Medicine_Name VARCHAR2(11) NOT NULL,
Medicine_Company VARCHAR2(22) NOT NULL UNIQUE,
Medicine_Type VARCHAR2(22)
);

INSERT INTO "S423AHME"."Medicine"
VALUES (3577642, 'Tylenol', 'Teva', 'Pill');

commit;

SELECT * FROM "S423AHME"."Medicine";
