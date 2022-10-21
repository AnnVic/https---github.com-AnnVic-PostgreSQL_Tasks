SELECT fc.name,
    sum(
        CASE
            WHEN bk.memid = 0 THEN fc.guestcost * bk.slots
            ELSE fc.membercost * bk.slots
        END
    ) AS revenue
FROM cd.facilities fc
    INNER JOIN cd.bookings bk ON fc.facid = bk.facid
GROUP BY fc.name
ORDER BY revenue;