SELECT row_number() OVER() AS row_number,
  firstname,
  surname
FROM cd.members
ORDER BY joindate;