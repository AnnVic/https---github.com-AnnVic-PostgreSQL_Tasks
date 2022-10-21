solution 1
SELECT *
FROM cd.facilities
WHERE facid IN (1, 5);
solution 2
SELECT *
FROM cd.facilities
WHERE name LIKE '%2%';