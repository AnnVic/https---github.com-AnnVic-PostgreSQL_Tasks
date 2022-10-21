SELECT facid,
  sum(slots) AS "total"
FROM cd.bookings
GROUP BY facid
ORDER BY total DESC
LIMIT 1;