INSERT INTO cd.facilities (
        facid,
        name,
        membercost,
        guestcost,
        initialoutlay,
        monthlymaintenance
    )
SELECT (
        SELECT max(facid) + 1
        FROM cd.facilities
    ),
    'Spa',
    20,
    30,
    100000,
    800;