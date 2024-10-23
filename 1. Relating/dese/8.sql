select d.name, e.pupils from districts d
join expenditures e on e.district_id = d.id;
