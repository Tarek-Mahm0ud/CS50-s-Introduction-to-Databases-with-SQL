select city, count(city) from schools where type='Public School'
group by city
order by count(city) desc,city
limit 10;
