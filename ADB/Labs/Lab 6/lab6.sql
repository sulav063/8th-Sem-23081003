--SELECT l.location_id,
--       l.street_address,
--       l.city,
--       l.state_province,
--       c.country_name
--FROM HR.locations l
--INNER JOIN HR.countries c
--ON l.country_id = c.country_id;


--SELECT e.last_name,
--       e.department_id,
--       d.department_name
--FROM HR.employees e
--INNER JOIN HR.departments d
--ON e.department_id = d.department_id;

SELECT e.last_name,
       e.job_id,
       e.department_id,
       d.department_name,
       l.city
FROM HR.employees e
INNER JOIN HR.departments d
ON e.department_id = d.department_id
INNER JOIN HR.locations l
ON d.location_id = l.location_id
WHERE l.city = 'Toronto';

















