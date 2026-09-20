--SELECT employee_id,
--       last_name,
--       salary
--FROM HR.EMPLOYEES
--WHERE salary > (
--    SELECT AVG(salary)
--    FROM HR.EMPLOYEES
--)
--ORDER BY salary ASC;

--SELECT employee_id,
--       last_name
--FROM HR.EMPLOYEES
--WHERE department_id IN (
--    SELECT department_id
--    FROM HR.EMPLOYEES
--    WHERE LOWER(last_name) LIKE '%u%'
--);

SELECT e.last_name,
       e.department_id,
       e.job_id
FROM HR.EMPLOYEES e
WHERE e.department_id IN (
    SELECT d.department_id
    FROM HR.DEPARTMENTS d
    WHERE d.location_id = 1700
);














