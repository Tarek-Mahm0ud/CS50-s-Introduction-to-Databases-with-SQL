select name from schools s
join graduation_rates g on s.id=g.school_id
where g.graduated=100;
