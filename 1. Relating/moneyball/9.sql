SELECT t."name" , AVG(s."salary") AS "average salary"
FROM "teams" t JOIN "salaries" s
ON t."id" = s."team_id"
WHERE s."year" = '2001'
GROUP BY s."team_id"
ORDER BY s."salary"
LIMIT '5';
