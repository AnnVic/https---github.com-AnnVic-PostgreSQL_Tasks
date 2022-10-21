SELECT name,
    CASE
        WHEN class = 1 THEN 'high'
        WHEN class = 2 THEN 'average'
        ELSE 'low'
    END revenue
FROM (
        SELECT fc.name AS name,
            NTILE(3) OVER(
                ORDER BY sum(
                        CASE
                            WHEN bk.memid = 0 THEN fc.guestcost * bk.slots
                            ELSE fc.membercost * bk.slots
                        END
                    ) DESC
            ) AS class
        FROM cd.bookings bk
            INNER JOIN cd.facilities fc ON bk.facid = fc.facid
        GROUP BY fc.name
    ) AS new
ORDER BY class,
    name;