create table "passengers"(
    "pass_id" INTEGER ,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER,
    PRIMARY KEY("pass_id")
);

create table "check_in"(
    "pass_id" INTEGER,
    "arrive_time" TEXT NOT NULL ,
    "arrive_date" TEXT NOT NULL ,
    "flight_id" INTEGER,
    "flight_name" TEXT,
    PRIMARY KEY("pass_id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("flight_number")
);


create table "airlines"(
    "air_id" INTEGER ,
    "air_name" TEXT NOT NULL UNIQUE,
    "concourses" TEXT check ("concourses" in ('A','B','C','D','E','F','T')),
    PRIMARY KEY("air_id")
);

create table "flights" (
    "flight_number" integer not null,
    "air_id" INTEGER ,
    "flight_name" TEXT,
    "from_code" TEXT,
    "to_code" TEXT,
    "departure_date" TEXT NOT NULL,
    "departure_time" TEXT NOT NULL,
    "arrival_date" TEXT NOT NULL,
    "arrival_time" TEXT NOT NULL,
    FOREIGN KEY("air_id") REFERENCES "airlines"("air_id")
);
