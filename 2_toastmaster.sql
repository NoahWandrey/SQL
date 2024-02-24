-- All Events that include "Toastmaster" -- 
SELECT 
    event_name
FROM
    event
WHERE
    lower(event_name) LIKE '%oastmaster%';

-- "Toastmaster" events alongside City --
SELECT 
    event_name, city.city
FROM
    event
        JOIN
    grp ON event.group_id = grp.group_id
    join city on grp.city_id = city.city_id;
    
-- Number of Toastmaster events per city -- 
SELECT 
    COUNT(event_name) Number_of_Events, city
FROM
    event
        JOIN
    venue_ ON event.venue_id = venue_.venue_id
WHERE
    event_name LIKE '%oastmaster%'
GROUP BY city;


