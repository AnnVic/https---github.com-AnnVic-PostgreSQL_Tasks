SELECT mb.surname,
   mb.firstname,
   mb.memid,
   min(bk.starttime) AS starttime
FROM cd.members mb
   INNER JOIN cd.bookings bk ON mb.memid = bk.memid
WHERE starttime >= '2012-09-01'
GROUP BY mb.memid,
   mb.surname,
   mb.firstname
ORDER BY mb.memid;