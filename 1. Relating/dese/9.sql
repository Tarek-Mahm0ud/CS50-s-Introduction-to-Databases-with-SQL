select d.name from districts d
join expenditures e on e.district_id = d.id
order by e.pupils 
limit 1;
