SELECT "t"."name" FROM "teams" AS "t" WHERE "t"."id" IN (
    SELECT "p"."team_id" FROM "performances" AS "p"
    WHERE "p"."player_id" IN (
        SELECT "pl"."id" FROM "players" AS "pl"
        WHERE "pl"."first_name" = 'Satchel'
        AND "pl"."last_name" = 'Paige'
    )
);
