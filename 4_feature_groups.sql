-- Groups by Rating -- 
SELECT 
    CASE
        WHEN rating BETWEEN 1 AND 1.99 THEN '1 Star'
        WHEN rating BETWEEN 2 AND 2.99 THEN '2 Star'
        WHEN rating BETWEEN 3 AND 3.99 THEN '3 Star'
        WHEN rating BETWEEN 4 AND 4.99 THEN '4 Star'
        WHEN rating = 5 THEN '5 Star'
        ELSE 'No Rating'
    END AS rating_scale,
    COUNT(rating)
FROM
    grp
GROUP BY rating_scale
ORDER BY rating_scale DESC;

SELECT 
    city, members, group_name
FROM
    grp
        JOIN
    city ON grp.city_id = city.city_id
WHERE
    rating = 5
ORDER BY members DESC
LIMIT 20;

SELECT 
    city, members, group_name
FROM
    grp
        JOIN
    city ON grp.city_id = city.city_id
WHERE
    rating = 5
ORDER BY members
LIMIT 50;