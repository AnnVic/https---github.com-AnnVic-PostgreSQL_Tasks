solution 1
SELECT DISTINCT firstname,
   surname
FROM cd.members
WHERE memid IN (
      SELECT recommendedby
      FROM cd.members
   )
ORDER BY surname,
   firstname;
solution 2
SELECT DISTINCT mb.firstname,
   mb.surname
FROM cd.members mb
   INNER JOIN cd.members mbr ON mb.memid = mbr.recommendedby
ORDER BY mb.surname,
   mb.firstname;