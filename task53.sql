WITH daily_totals AS (
    SELECT date(bk.starttime) AS dt,
        SUM(
            CASE
                bk.memid
                WHEN 0 THEN bk.slots * fc.guestcost
                ELSE bk.slots * fc.membercost
            END
        ) AS revenue
    FROM cd.bookings AS bk
        INNER JOIN cd.facilities AS fc ON bk.facid = fc.facid
    GROUP BY dt
),
rolling AS (
    SELECT date(series.date) AS dt,
        (
            AVG(daily_totals.revenue) OVER (
                ORDER BY daily_totals.dt ROWS 14 PRECEDING
            )
        ) AS revenue
    FROM generate_series(
            DATE '2012-07-18',
            DATE '2012-08-31',
            '1 day'
        ) AS series
        INNER JOIN daily_totals ON series.date = daily_totals.dt
)
SELECT dt AS "date",
    revenue
FROM rolling
WHERE dt >= '2012-08-01';