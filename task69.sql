SELECT substr(surname, 1, 1) AS letter,
    count(*)
FROM cd.members
GROUP BY letter
ORDER BY letter;