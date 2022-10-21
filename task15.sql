SELECT bk.starttime
FROM cd.bookings bk
  INNER JOIN cd.members mb ON mb.memid = bk.memid
WHERE mb.firstname = 'David'
  AND mb.surname = 'Farrell';