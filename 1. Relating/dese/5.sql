select city , count(city) from schools where type = 'Public School'
group by city
having count(city) <= 3
order by count(city) desc,city;

