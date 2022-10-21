SELECT date_trunc('month', starttime) AS month,
    count(*) AS count
FROM cd.bookings
GROUP BY month
ORDER BY month;