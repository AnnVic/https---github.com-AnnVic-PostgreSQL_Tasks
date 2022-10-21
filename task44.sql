SELECT fc.facid,
  fc.name,
  round(sum(bk.slots) * 0.5, 2) AS "Total Hours"
FROM cd.facilities fc
  INNER JOIN cd.bookings bk ON fc.facid = bk.facid
GROUP BY fc.facid
ORDER BY fc.facid;