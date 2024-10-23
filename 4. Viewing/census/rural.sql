create VIEW "rural" as
select * from "census" where "locality" like "%Rural%";
