SELECT 
    JOIN_YR, COUNT(JOIN_YR)
FROM
    (SELECT 
        MEMBER_ID, YEAR(MIN(JOINED)) JOIN_YR
    FROM
        GRP_MEMBER
    GROUP BY MEMBER_ID) YR
GROUP BY JOIN_YR
ORDER BY JOIN_YR DESC;

set sql_safe_updates = 0;

UPDATE grp_member 
SET 
    city = 'chicago'
WHERE
    city IN ('East Chicago' , 'West Chicago',
        'North Chicago',
        'Chicago Heights',
        'Chicago Ridge');

UPDATE grp_member 
SET 
    city = 'San Francisco'
WHERE
    city = 'South San Francisco';

UPDATE grp_member 
SET 
    city = 'New York'
WHERE
    city = 'West New York';
 SET SQL_SAFE_UPDATE = 1;
SELECT 
    JOIN_YR, COUNT(JOIN_YR)
FROM
    (SELECT 
        MEMBER_ID, YEAR(MIN(JOINED)) JOIN_YR
    FROM
        GRP_MEMBER
    WHERE
        city = 'Chicago'
    GROUP BY MEMBER_ID) YR
GROUP BY JOIN_YR
ORDER BY JOIN_YR DESC;

SELECT 
    JOIN_YR, COUNT(JOIN_YR)
FROM
    (SELECT 
        MEMBER_ID, YEAR(MIN(JOINED)) JOIN_YR
    FROM
        GRP_MEMBER
    WHERE
        city = 'San Francisco'
    GROUP BY MEMBER_ID) YR
GROUP BY JOIN_YR
ORDER BY JOIN_YR DESC;

SELECT 
    JOIN_YR, COUNT(JOIN_YR)
FROM
    (SELECT 
        MEMBER_ID, YEAR(MIN(JOINED)) JOIN_YR
    FROM
        GRP_MEMBER
    WHERE
        city = 'New York'
    GROUP BY MEMBER_ID) YR
GROUP BY JOIN_YR
ORDER BY JOIN_YR DESC;

SELECT 
    JOIN_MONTH, COUNT(JOIN_MONTH)
FROM
    (SELECT 
        MEMBER_ID, MONTH(MIN(JOINED)) JOIN_MONTH
    FROM
        GRP_MEMBER
    WHERE
        YEAR(joined) = 2017
    GROUP BY MEMBER_ID) MONTH
GROUP BY JOIN_MONTH
ORDER BY JOIN_MONTH;
-- -- -- -- 
SELECT 
    member_id, YEAR(MIN(joined)) Join_Yr
FROM
    grp_member
WHERE
    city = 'san francisco';

SELECT 
    MEMBER_ID, YEAR(MIN(JOINED)) JOIN_YR
FROM
    GRP_MEMBER
WHERE
    city = 'San Francsico'
GROUP BY MEMBER_ID;