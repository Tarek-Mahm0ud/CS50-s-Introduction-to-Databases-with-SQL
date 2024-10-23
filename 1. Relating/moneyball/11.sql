SELECT p."first_name" , p."last_name" , s."salary" / pr."H" AS "dollars per hit"
FROM "players" p JOIN "salaries" s ON p."id" = s."player_id"
JOIN "performances" pr ON s."player_id" = pr."player_id" AND s."year" = pr."year"
WHERE s."year" = '2001' AND pr."H" != '0'
ORDER BY "dollars per hit" , "first_name" , "last_name"
LIMIT '10';
