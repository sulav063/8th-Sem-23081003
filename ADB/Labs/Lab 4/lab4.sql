--SELECT LAST_NAME,
--       HIRE_DATE,
--       TO_CHAR(HIRE_DATE, 'DAY') AS DAY
--FROM HR.EMPLOYEES;


--SELECT LAST_NAME,
--NVL(TO_CHAR(COMMISSION_PCT), 'No Commission') AS COMM
--FROM HR.EMPLOYEES;


--SELECT LAST_NAME,
--       JOB_ID,
--       CASE JOB_ID
--            WHEN 'AD_PRES' THEN 'A'
--            WHEN 'ST_MAN' THEN 'B'
--            WHEN 'IT_PROG' THEN 'C'
--            WHEN 'SA_REP' THEN 'D'
--            WHEN 'ST_CLERK' THEN 'E'
--            ELSE 'O'
--       END AS GRADE
--FROM HR.EMPLOYEES;



SELECT LAST_NAME,
       JOB_ID,
       DECODE(JOB_ID,
              'AD_PRES','A',
              'ST_MAN','B',
              'IT_PROG','C',
              'SA_REP','D',
              'ST_CLERK','E',
              'O') AS GRADE
FROM HR.EMPLOYEES;














