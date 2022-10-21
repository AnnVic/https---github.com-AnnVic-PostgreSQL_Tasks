SELECT (
    SELECT count(*)
    FROM cd.members
  ) AS count,
  firstname,
  surname
FROM cd.members
ORDER BY joindate;