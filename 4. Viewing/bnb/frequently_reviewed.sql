CREATE VIEW "frequently_reviewed" AS
SELECT "l"."id" , "l"."property_type" , "l"."host_name" , COUNT("r"."id")
FROM "listings" AS "l" JOIN "reviews" AS "r"
ON "l"."id" = "r"."listing_id"
GROUP BY("r"."listing_id")
ORDER BY COUNT("r"."id") DESC
LIMIT '100';
