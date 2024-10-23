-- *** The Lost Letter ***

select "type", "address" from "addresses" where  "id" in (
    select "to_address_id" from "packages" where "contents" = 'Congratulatory letter' and "from_address_id" in (
        select "id" from  "addresses" where "address" = '900 Somerville Avenue'
    )
);

-- *** The Devious Delivery ***

select type 'Answers' from addresses where id = (
    select address_id from scans where action = 'Drop' and package_id = (
        select id from packages where from_address_id is null
    )
)

union

select contents from packages where id = (
    select id from packages where from_address_id is null
);

-- *** The Forgotten Gift ***

--content--

select contents from packages where from_address_id =(
    select id from addresses where address = '109 Tileston Street'
);

+----------+
| contents |
+----------+
| Flowers  |
+----------+

--name--

select name from drivers where id =(
    select driver_id from scans where package_id = (
        select id from packages where from_address_id =(
            select id from addresses where address = '109 Tileston Street'
        )
    )
    order by timestamp desc
    limit 1
);
+-------+
| name  |
+-------+
| Mikel |
+-------+
