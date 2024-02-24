--ACTIVE CITIES--
1. /*WHAT CITIES HAVE ACTIVE MEMBERS? */

SELECT DISTINCT
    city
FROM
    GRP_MEMBER
WHERE
    MEMBER_STATUS = 'ACTIVE';

/*  
San Francisco
New York
Chicago
West New York
West Chicago
South San Francisco
North Chicago
Chicago Heights
East Chicago
Chicago Ridge */

2. /*ARE THERE ANY CITIES LISTED IN THE CITY TABLE WITH NO ACTIVE MEMBERS? IF SO, WHAT STATE ARE THOSE CITIES IN? */

SELECT DISTINCT
    CITY, STATE
FROM
    CITY
WHERE
    CITY NOT IN (SELECT DISTINCT
            city
        FROM
            GRP_MEMBER
        WHERE
            MEMBER_STATUS = 'ACTIVE');

/* 
'New York Mills', 'NY'
'New York Mills', 'MN'
'Chicago Park', 'CA'
*/

--GROUPS--
1. /*HOW MANY GROUPS ARE CURRENTLY OPEN, WATING FOR APPROVAL, AND/OR CLOSED? */

SELECT 
    join_mode, COUNT(*)
FROM
    grp
GROUP BY join_mode;

/* 
open	3602
approval 723
closed	15 */

--CATEGORIES--
1. /* WHAT ARE THE FIVE CATEGORIES THAT CONTAIN THE MOST GROUPS? WHAT ARE THE FIVE CATEGORIES THAT CONTAIN THE LEAST NUMBER OF GROUPS? */

SELECT 
    G.CATEGORY_ID, C.CATEGORY_NAME, COUNT(*)
FROM
    GRP G
        JOIN
    CATEGORY C ON G.CATEGORY_ID = C.CATEGORY_ID
GROUP BY G.CATEGORY_ID
ORDER BY COUNT(*) DESC
LIMIT 5;

/* 
34	Tech	911
2	Career & Business	790
31	Socializing	320
14	Health & Wellbeing	218
16	Language & Ethnic Identity	166 */

/* FIVE CATEGORIES THAT CONTAIN LEAST NUMBER OF GROUPS */
SELECT 
    G.CATEGORY_ID, C.CATEGORY_NAME, COUNT(*)
FROM
    GRP G
        JOIN
    CATEGORY C ON G.CATEGORY_ID = C.CATEGORY_ID
GROUP BY G.CATEGORY_ID
ORDER BY COUNT(*)
LIMIT 5;

/* 24	Paranormal	4
3	Cars & Motorcycles	15
29	Sci-Fi & Fantasy	16
17	Lifestyle	26
15	Hobbies & Crafts	32 */


MEMBERS
1. /*HOW MANY MEMBERS ARE THERE? */

SELECT 
    COUNT(DISTINCT member_id)
FROM
    grp_member;
/* '39980' */

2. /*WHAT PERCENTAGE OF MEMBERS ARE IN CHICAGO? */
SELECT 
    COUNT(DISTINCT member_id)
FROM
    grp_member
WHERE
    city = 'Chicago';
    
SELECT 
    (SELECT 
            COUNT(DISTINCT member_id)
        FROM
            grp_member
        WHERE
            city = 'Chicago') / (SELECT 
            COUNT(DISTINCT member_id)
        FROM
            grp_member) AS CHICAGO_PERCENTAGE;
            
/*'0.2119' */

            













