SELECT extract(
    MONTH
    FROM d1
  ) AS month,
  days.d2 - days.d1 AS length
FROM (
    SELECT generate_series(
        timestamp '2012-01-01',
        timestamp '2012-12-01',
        '1 month'
      ) AS d1,
      generate_series(
        timestamp '2012-02-01',
        timestamp '2013-01-01',
        '1 month'
      ) AS d2
  ) AS days;