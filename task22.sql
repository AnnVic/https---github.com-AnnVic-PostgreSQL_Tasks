SELECT member,
	facility,
	cost
FROM (
		SELECT mb.firstname || ' ' || mb.surname AS member,
			fc.name AS facility,
			CASE
				WHEN mb.memid = 0 THEN bk.slots * fc.guestcost
				ELSE bk.slots * fc.membercost
			END AS cost
		FROM cd.members mb
			INNER JOIN cd.bookings bk ON mb.memid = bk.memid
			INNER JOIN cd.facilities fc ON bk.facid = fc.facid
		WHERE date(bk.starttime) = '2012-09-14'
	) AS book
WHERE cost > 30
ORDER BY cost DESC;