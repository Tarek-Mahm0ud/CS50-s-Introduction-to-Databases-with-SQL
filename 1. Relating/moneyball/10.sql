SELECT p."first_name" , p."last_name" , s."salary" , pr."HR" , s."year"
FROM "players" p JOIN "salaries" s ON p."id" = s."player_id"
JOIN "performances" pr ON s."player_id" = pr."player_id" AND s."year" = pr."year"
ORDER BY p."id" , s."year" DESC , pr."HR" DESC , s."salary" DESC;
