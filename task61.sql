SELECT starttime,
  starttime + slots *(interval '30 minutes') AS endtime
FROM cd.bookings
ORDER BY endtime DESC,
  starttime DESC
LIMIT 10;