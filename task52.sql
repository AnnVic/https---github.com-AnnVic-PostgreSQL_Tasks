SELECT fc.name,
    fc.initialoutlay / (
        sum(
            bk.slots * CASE
                WHEN bk.memid = 0 THEN fc.guestcost
                ELSE fc.membercost
            END
        ) / 3 - fc.monthlymaintenance
    ) AS months
FROM cd.facilities AS fc
    INNER JOIN cd.bookings AS bk ON fc.facid = bk.facid
GROUP BY fc.facid,
    fc.name
ORDER BY fc.name;