select d.name, e.per_pupil_expenditure, s.exemplary
from districts d
join expenditures e on e.district_id = d.id
join staff_evaluations s on s.district_id = d.id
where d.type = 'Public School District' AND
    e.per_pupil_expenditure > (
        select avg(per_pupil_expenditure)
        from expenditures
    ) AND
    s.exemplary > (
        select avg(exemplary)
        from staff_evaluations
    )
order by s.exemplary desc, e.per_pupil_expenditure desc;
