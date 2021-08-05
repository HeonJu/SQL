--문제1.
--매니저가 있는 직원은 몇 명입니까? 아래의 결과가 나오도록 쿼리문을 작성하세요
--매니저 아이디가 널인 직원 뺴라
Manager_id
SELECT count(Manager_id) haveMgrCount
FROM employees
WHERE manager_id IS NOT NULL;

--Q2
SELECT MAX(salary) 최고임금, MIN(salary) 최저임금,
MAX(salary) - MIN(salary ) "최고임금 - 최저임금"
FROM employees;

--Q3
SELECT TO_CHAR(MAX(hire_date), 'YYYY"년" MM"월" DD"일"')
FROM employees;

--Q4
SELECT department_id,
avg(salary), max(salary), min(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id DESC;

--Q5
SELECT job_id, ROUND(AVG(salary)), 
MIN(salary), MAX(salary)
FROM employees
GROUP BY job_id
ORDER BY MIN(salary) DESC, AVG(salary) ASC;

--Q6 (포맷이 정해졌다 TO_CHAR
SELECT TO_CHAR(MIN(hire_date), 'yyyy-mm-dd-day')
FROM employees;

--Q7
SELECT department_id,
AVG(salary),
MIN(salary),
AVG(salary) - MIN(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) - MIN(salary) < 2000 --HAVING은 집계 이후
ORDER BY AVG(salary) - MIN(salary) DESC;

--Q8
SELECT job_id,
MAX(salary) - MIN(salary) as diff
FROM employees
GROUP BY job_id
ORDER BY diff DESC;

--Q9
SELECT manager_id, ROUND(AVG(salary)), 
MIN(salary), MAX(salary)
FROM employees
WHERE hire_date >= '05/01/01'
GROUP BY manager_id
HAVING AVG(salary) >= 5000
ORDER BY AVG(salary) DESC;

--Q10
SELECT employee_id, salary
CASE WHEN hire_date <= '02/12/31' 'THEN' '창립멤버'
     WHEN hire_date <= '03/12/31' 'THEN' '03년 입사'
     WHEN hire_date <= '04/12/31' 'THEN' '04년 입사'
     ELSE '상장이후 입사'
  END optDate,
  hite_date
FROM employees
ORDER BY hire_date;