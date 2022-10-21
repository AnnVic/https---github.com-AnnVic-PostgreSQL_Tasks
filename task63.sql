WITH monthly_bookings AS (
    SELECT fc.name AS "name",
        date_trunc('month', bk.starttime) AS "month",
        sum(slots * 0.5) AS "hours"
    FROM cd.bookings bk
        INNER JOIN cd.facilities fc ON fc.facid = bk.facid
    GROUP BY fc.name,
        month
)
SELECT name,
    month,
    round(
        100 * hours / (
            extract(
                DAY
                FROM (month + interval '1 month') - month
            ) * 12.5
        )::numeric,
        1
    ) AS "utilisation"
FROM monthly_bookings
ORDER BY name,
    month;