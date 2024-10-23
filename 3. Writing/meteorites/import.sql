create table "temp" (
    "name" text NOT NULL,
    "id" INTEGER PRIMARY KEY,
    "nametype" text,
    "class" text NOT NULL,
    "mass" REAL,
    "discovery" TEXT check("discovery" = 'Fell' OR  "discovery"= 'Found'),
    "year" REAL ,
    "lat" REAL ,
    "long" REAL
);

.import --csv meteorites.csv temp

UPDATE "temp"
SET "mass" = NULL
WHERE "mass" = '' OR "mass" IS NULL;

UPDATE "temp"
SET "year" = NULL
WHERE "year" = '' OR "year" IS NULL;

UPDATE "temp"
SET "lat" = NULL
WHERE "lat" = '' OR "lat" IS NULL;

UPDATE "temp"
SET "long" = NULL
WHERE "long" = '' OR "long" IS NULL;


UPDATE "temp"
SET
	"mass" = ROUND("mass", 2),
	"lat" = ROUND("lat", 2),
	"long" = ROUND("long", 2);

DELETE FROM "temp"
WHERE
	"nametype" = 'Relict';

CREATE TABLE
	"meteorites" AS
SELECT
	ROW_NUMBER() OVER (
		ORDER BY
			"year",
			"name"
	) AS
    "id",
	"name",
	"class",
	"mass",
	"discovery",
	"year",
	"lat",
	"long"
FROM
	"temp";

