SELECT name,
        rank
FROM (
                SELECT fc.name AS name,
                        RANK() OVER(
                                ORDER BY sum(
                                                CASE
                                                        WHEN memid = 0 then slots * fc.guestcost
                                                        ELSE slots * fc.membercost
                                                END
                                        ) DESC
                        ) AS rank
                FROM cd.bookings bk
                        INNER JOIN cd.facilities fc ON fc.facid = bk.facid
                GROUP BY fc.name
        ) AS new
WHERE rank <= 3
ORDER BY rank;