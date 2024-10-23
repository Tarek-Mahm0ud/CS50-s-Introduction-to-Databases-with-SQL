create view "total" as
select sum("families") "families", sum("households") "households", sum("population") "population",
sum("male") "male", sum("female") "female" from "census";
