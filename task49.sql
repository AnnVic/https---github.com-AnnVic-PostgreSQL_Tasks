SELECT firstname,
  surname,
  hours,
  RANK() OVER(
    ORDER BY hours DESC
  )
FROM (
    SELECT firstname,
      surname,
      round(sum(bk.slots) * 0.5, -1) AS hours
    FROM cd.bookings bk
      INNER JOIN cd.members mb ON bk.memid = mb.memid
    GROUP BY mb.memid
  ) AS new
ORDER BY rank,
  surname,
  firstname;