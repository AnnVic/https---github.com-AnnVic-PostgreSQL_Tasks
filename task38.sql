solution 1
SELECT count(memid)
FROM cd.members
WHERE memid IN (
    SELECT memid
    FROM cd.bookings
  );
solution 2
SELECT count(DISTINCT memid)
FROM cd.bookings;