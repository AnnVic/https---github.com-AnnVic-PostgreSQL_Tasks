SELECT memid,
  regexp_replace(telephone, '[-() ]', '', 'g') AS telephone
FROM cd.members
ORDER BY memid;