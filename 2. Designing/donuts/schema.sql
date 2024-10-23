CREATE TABLE "Ingredients" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "price_per_unit" NUMERIC NOT NULL
);

CREATE TABLE "Dounts" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
     "gluten_free" BOOLEAN NOT NULL,
    "price_per_unit" NUMERIC NOT NULL
);

CREATE TABLE "Ingredients_of_Dounts" (
    "ingredient_id" INTEGER,
    "dount_id" INTEGER,
    FOREIGN KEY("ingredient_id") REFERENCES "Ingredients"("id"),
    FOREIGN KEY("dount_id") REFERENCES "Dounts"("id"),
    PRIMARY KEY ("ingredient_id" ,  "dount_id")
);

CREATE TABLE "Orders" (
    "id" INTEGER PRIMARY KEY,
    "order_number" INTEGER NOT NULL,
    "customer_id" INTEGER,
    FOREIGN KEY ("customer_id") REFERENCES "Customers"("id")
);

CREATE TABLE Orders_Donuts (
    "order_id" INTEGER,
    "donut_id" INTEGER,
    FOREIGN KEY ("order_id") REFERENCES "Orders"("id"),
    FOREIGN KEY ("donut_id") REFERENCES "Donuts"("id"),
    PRIMARY KEY ("order_id","donut_id")
);
CREATE TABLE "Customers" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL
);
