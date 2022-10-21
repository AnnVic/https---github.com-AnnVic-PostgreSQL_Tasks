SELECT DISTINCT mb.firstname || ' ' || mb.surname AS member,
  (
    SELECT mem.firstname || ' ' || mem.surname AS recommender
    FROM cd.members mem
    WHERE mem.memid = mb.recommendedby
  )
FROM cd.members mb
ORDER BY member,
  recommender;