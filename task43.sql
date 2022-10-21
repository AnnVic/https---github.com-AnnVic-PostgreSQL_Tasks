SELECT facid,
   EXTRACT(
      MONTH
      FROM starttime
   ) AS month,
   sum(slots) AS slots
FROM cd.bookings
WHERE extract(
      YEAR
      FROM starttime
   ) = 2012
GROUP BY rollup(facid, month)
ORDER BY facid,
   month;