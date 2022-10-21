solution 1
SELECT max(joindate) AS latest
FROM cd.members;
solution 2
SELECT joindate AS latest
FROM cd.members
ORDER BY joindate DESC
LIMIT 1;