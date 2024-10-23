WITH "least_expensive_per_hit" AS (
    SELECT p."player_id"
    FROM "performances" p
    JOIN "salaries" s ON p."player_id" = s."player_id" AND p."year" = s."year"
    WHERE p."year" = '2001' AND p."H" > '0'
    ORDER BY (s."salary" / p."H") ASC
    LIMIT '10'
),
"least_expensive_per_rbi" AS (
    SELECT p."player_id"
    FROM "performances" p
    JOIN "salaries" s ON p."player_id" = s."player_id" AND p."year" = s."year"
    WHERE p."year" = '2001' AND p."RBI" > '0'
    ORDER BY (s."salary" / p."RBI") ASC
    LIMIT '10'
)
SELECT pl."first_name", pl."last_name"
FROM "players" pl
WHERE pl."id" IN (
    SELECT "player_id" FROM "least_expensive_per_hit"
    INTERSECT
    SELECT "player_id" FROM "least_expensive_per_rbi"
)
ORDER BY pl."last_name" ASC, pl."first_name" ASC;
