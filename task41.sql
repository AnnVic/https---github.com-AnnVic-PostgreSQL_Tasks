SELECT *
FROM (
        SELECT fc.name,
            sum(
                CASE
                    WHEN bk.memid = 0 THEN bk.slots * fc.guestcost
                    ELSE bk.slots * fc.membercost
                END
            ) AS revenue
        FROM cd.facilities AS fc
            INNER JOIN cd.bookings AS bk ON fc.facid = bk.facid
        GROUP BY fc.name
    ) AS c
WHERE c.revenue < 1000
ORDER BY c.revenue;