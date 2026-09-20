--SELECT department_id
--FROM HR.EMPLOYEES
--MINUS
--SELECT department_id
--FROM HR.EMPLOYEES
--WHERE job_id = 'ST_CLERK';

SELECT employee_id, job_id
FROM HR.EMPLOYEES
INTERSECT
SELECT employee_id, job_id
FROM HR.JOB_HISTORY;





