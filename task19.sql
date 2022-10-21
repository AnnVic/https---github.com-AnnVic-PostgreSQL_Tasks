SELECT DISTINCT mb.firstname || ' ' || mb.surname AS member,
	fc.name AS facility
FROM cd.members mb
	INNER JOIN cd.bookings bk ON mb.memid = bk.memid
	INNER JOIN cd.facilities fc ON bk.facid = fc.facid
WHERE fc.name LIKE 'Tennis Court%'
ORDER BY member,
	facility;