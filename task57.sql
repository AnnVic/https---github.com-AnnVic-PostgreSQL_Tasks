solution 1
SELECT to_char(timestamp '2012-08-31', 'dd');
solution 2
SELECT extract(
        DAY
        FROM timestamp '2012-08-31'
    );