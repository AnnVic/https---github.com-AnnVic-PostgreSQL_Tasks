SELECT date_trunc('month', test.day + interval '1 month') - date_trunc('day', test.day) AS "remaining"
FROM (
    SELECT timestamp '2012-02-11 01:00:00' AS day
  ) AS test;