SELECT bk.starttime AS start,
  fc.name AS name
FROM cd.facilities fc
  INNER JOIN cd.bookings bk ON bk.facid = fc.facid
WHERE fc.name LIKE 'Tennis Court%'
  AND bk.starttime >= '2012-09-21'
  AND bk.starttime < '2012-09-22'
ORDER BY bk.starttime;