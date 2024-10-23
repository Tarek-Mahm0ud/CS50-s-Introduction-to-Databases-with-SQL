select s.name from schools s
join districts d on d.id=s.district_id
where d.name ='Cambridge';
