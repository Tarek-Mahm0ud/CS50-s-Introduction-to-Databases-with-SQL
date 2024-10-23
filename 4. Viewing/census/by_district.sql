create view "by_district" as
select "district",
sum("families") "families", sum("households") "households", sum("population") "population",
sum("male") "male", sum("female") "female" from "census"
group by "district";
