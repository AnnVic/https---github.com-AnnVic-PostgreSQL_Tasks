SELECT lpad(zipcode::text, 5, '0') AS zip
from cd.members
ORDER BY zip;