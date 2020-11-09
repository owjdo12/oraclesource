select * from tab;

-- employees 테이블 전체 내용 조회
SELECT * FROM employees;

-- employees 테이블 first_name, last_name, job_id 만 조회
SELECT first_name, last_name, job_id FROM employees;

-- 사원번호가 176인 사람의 LAST_NAME과 부서번호 조회
SELECT LAST_NAME, DEPARTMENT_ID FROM employees WHERE EMPLOYEE_ID = 176;

-- 연봉이 12000 이상 되는 직원들의 LAST_NAME 및 연봉 조회
SELECT LAST_NAME, SALARY FROM employees WHERE SALARY>= 12000;

-- 연봉이 5000에서 12000의 범위 이외의 사람들의 LAST_NAME 및 연봉 조회
SELECT LAST_NAME, SALARY FROM employees WHERE 5000> SALARY OR SALARY <12000;

-- 20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서번호를 안파벳순으로 조회
SELECT LAST_NAME, department_id FROM employees WHERE department_id IN(20, 50) ORDER BY LAST_NAME;

-- 커미션을 버는 모든 사원들의 LAST_NAME, 연봉, 커미션 조회. 단, 연봉의 역순 및 커미션의 역순으로 결과출력
SELECT LAST_NAME, SALARY, COMMISSION_PCT FROM employees WHERE commission_pct >0 ORDER BY salary DESC, commission_pct DESC;

-- 연봉이 2500, 3500, 7000이 아니며, 직업이 SA_REP 이나 ST_CLERK인 사람들 조회
SELECT * FROM employees WHERE salary NOT IN(2500, 3500, 7000) AND job_id IN('SA_REP', 'ST_CLERK');

-- 2008/2/20 ~ 2008/05/01 사이에 고용된 사원들의 LASE_NAME, 사원번호, 고용일자 조회. 단, 고용일자 내림차순으로 정렬하여 출력
SELECT LAST_NAME, employee_id, hire_date FROM employees WHERE hire_date>'2008/02/20' and hire_date<'2008/05/01' ORDER BY hire_date DESC;

-- 2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로 오름차순으로 정렬하여 출력
select last_name, hire_date from employees where hire_date>='2004-01-01' and hire_date <= '2004-12-31' order by hire_date;

-- 연봉이 5000에서 1200범위에 있고, 20 OR 50번 부서에 근무하는 사람들의 연봉을 조회하여 오름차순으로 보여주기(LAST_NAME, SALARY)
SELECT last_name, salary FROM employees WHERE department_id IN(20, 50) AND salary BETWEEN 5000 AND 12000 ORDER BY salary;

--2004년도애 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로 오름차순 정렬하여 출력
SELECT last_name, hire_date FROM employees WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-31' ORDER BY hire_date;

-- 연봉이 5000~12000 범위 이외의 사람들의 last_name, salary 조회
SELECT last_name, salary FROM employees WHERE salary NOT BETWEEN 5000 AND 12000;

--2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로 오름차순 정렬하여 출력
SELECT last_name, hire_date FROM employees WHERE hire_date LIKE '2004%' ORDER BY hire_date;

--LAST_NAME에 u가 포함되는 사원들의 사번 및 last_name 조회
SELECT employee_id, last_name FROM employees WHERE last_name LIKE '%u%'; 

-- last_name 에 네번째 글자가 a인 사람들의 last_name 조회
SELECT last_name FROM employees WHERE last_name LIKE '___a%'; 

-- last_name에 a 혹은 e 글자가 있는 사원들의 last_name을 조회하여 last_name 기준으로 오름차순 정렬
SELECT last_name FROM employees WHERE last_name LIKE '%a%' or last_name LIKE '%e%' ORDER BY last_name;

-- last_name에 a 와 e 글자가 있는 사원들의 last_name을 조회하여 last_name 기준으로 오름차순 정렬
~~~~~~~`SELECT last_name FROM employees WHERE last_name LIKE '%a%e%' last_name AND LIKE '%e%a%' ORDER BY last_name;

-- IS NULL 연습
-- 매니저가 없는 사람들의 LAST_NAME, JOB_ID 조회
SELECT last_name, job_id FROM employees WHERE manager_id IS NULL;

-- ST_CLERK인 JOB_ID를 가진 사원이 없는 부서 ID조회. 부서번호가 NULL인 값 제외
SELECT DISTINCT department_id FROM employees WHERE job_id NOT IN('ST_CLERK') AND department_id IS NOT NULL;

-- COMMISSION_PCT가 NULL 이 아닌 사원들 중에서 COMMSSION = SALARY * COMMISSION_PCT를 구하여 EMPLOYEE_ID, FIRST_NAME, JOB_ID와 같이 조회
SELECT department_id, first_name, job_id, SALARY * COMMISSION_PCT AS commission FROM employees WHERE commission_pct IS NOT NULL;

-- [실습]문자열 함수
-- 1.first_name이 Curtis인 사람의 first_name, last_name, email, phone_number, job_id를 조회한다. 단 job_id의 결과는 소문자로 출력되도록
SELECT first_name, last_name, email, phone_number, LOWER(job_id) FROM employees WHERE first_name = 'Curtis';

-- 2. 부서번호가 70,80,90인 사람들의 employee_id, first_name, hire_date, job_id를 조회한다. 단, job_id가 it_prog인 사원의 경우 프로그래머로 변경하여 출력한다.
SELECT employee_id, first_name, hire_date, REPLACE(job_id, 'IT_PROG', '프로그래머') FROM employees WHERE department_id IN (60, 70, 80, 90);

-- 3. job_id가 ad_pres, pu_clerk인 사원들의 employee_id, first_name, last_name, department-id, job_id를 조회하시오. 단, 사원명은 first_name과 last_name을 연결하여 출력한다.
SELECT employee_id, CONCAT(first_name,CONCAT(' ',last_name)) department_id, job_id FROM employees WHERE job_id IN('ad_pres', 'pu_clerk');


--실습
--부서80의 각사원에 대해 적용가능한 세율을 표시하시오
SELECT last_name, salary, CASE WHEN salary<2000 THEN 0 
                                WHEN (salary<4000) THEN 0.09
                                WHEN (salary<6000) THEN 0.2
                                WHEN (salary<8000) THEN 0.3
                                WHEN (salary<10000) THEN 0.4
                                WHEN (salary<12000) THEN 0.42
                                WHEN (salary<14000) THEN 0.44
                                ELSE 0.45 END as tax_rate FROM employees WHERE department_id = 80;
--0~1,999 :0%, 2000~3999: 9%, 4000~5999: 20%, 6000~7999: 30%, 8000~9999: 40%, 10000~11999: 42%, 12000~13999: 44%, 14000이상: 45%
SELECT last_name, salary, DECODE(TRUNC(salary/2000,0),0,0.00, 
                                                    1, 0.09,
                                                    2,0.20,
                                                    3,0.30,
                                                    4,0.40,
                                                    5,0.42,
                                                    6,0.44,
                                                    0.45) as TAX_RATE FROM employees WHERE department_id = 80;
                                                
--다중행함수 연습
--회사 내의 최대 연봉 및 최소 연봉차이를 조회
SELECT MAX(salary)-MIN(salary) FROM employees;
--매니저로 근무하는 사원들의 인원수 조회
SELECT COUNT(DISTINCT manager_id) FROM employees;
--부서별 직원의 수를 구하여 부서번호의 오름차순으로 출력
SELECT department_id, COUNT(employee_id) FROM employees GROUP BY department_id ORDER BY department_id;
-- 부서별 급여의 평균연봉을 출력하고, 평균연봉은 정수만 나오도록 한다. 부서번호별 오름차순으로 정렬
SELECT department_id, ROUND(AVG(SALARY)) FROM employees GROUP BY department_id ORDER BY department_id;
--동일한 직업을 가진 사원수를 조회
SELECT COUNT(employee_id), job_id FROM employees GROUP BY job_id;

--JOIN실습
--자신의 담당 매니저의 고용일보다 빠른 입사자를 찾아 HIRE_DATE, LAST_NAME, MANAGER_ID 출력 =37행
SELECT E.HIRE_DATE, E.LAST_NAME, E.MANAGER_ID FROM EMPLOYEES E, EMPLOYEES M
WHERE M.employee_id=e.manager_id AND e.hire_date<M.HIRE_DATE; 

--도시이름이 T로 시작하는 지역에 사는 사원들의 사번, LAST_NAME, 부서번호 조회
--(EMPLOYEES의 DEPT_ID와 DEPT의 DEPT_ID연결 후 DEPT의 LOCATION_ID->LACATIONS의 LOCATION_ID 3번조인 =2행
SELECT EMPLOYEE_ID, E.LAST_NAME, D.DEPARTMENT_ID FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE e.department_id=D.DEPARTMENT_ID AND D.LOCATION_ID=l.location_id AND L.CITY LIKE 'T%';

--위치 ID가 1700인 동일한 사원들의 EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, SALARY 조회
--(EMPLOYEES와 DEPARTMENTS 조인) =18행
SELECT EMPLOYEE_ID, LAST_NAME, E.DEPARTMENT_ID, SALARY FROM EMPLOYEES E, DEPARTMENTS D
WHERE e.department_id = D.DEPARTMENT_ID AND D.LOCATION_ID=1700;

-- DEPARTMENT_NAME, LOCATION_ID, 각 부서별 사원수, 각 부서별 평균 연봉 조회
--(EMPLOYEES, DEPARTMENT 조인)=11행
------------------------------------------------------
SELECT D.DEPARTMENT_NAME, D.LOCATION_ID, COUNT(E.JOB_ID), FLOOR(AVG(E.SALARY))
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--EXECUTIVE 부서에 근무하는 모든 사원들의 DEPARTMENT_ID, LAST_NAME, JOB_ID 조회
--(EMPLOYEES, DEPARTMENT 조인)
SELECT DEPARTMENT_ID, LAST_NAME, JOB_ID FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.DEPARTMENT_ID=E.DEPARTMENT_ID;

--기존의 직업을 여전히 가지고있는 사원들의 사번 빛 JOB_ID 조회
--(EMPLOYEES, JOB_HISTORY 조인)


--각 사원별 소속 부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 사원이 존재하는 모든 사원들의 LAST_NAME을 조회
--(EMPLOYEES SELF JOIN)//이름 띄어쓰기
SELECT E1.EMPLOYEE_ID, E1.FIRST_NAME||' '||E1.LAST_NAME AS NAME
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.DEPARTMENT_ID = E2.DEPARTMENT_ID AND E1.HIRE_DATE < E2.HIRE_DATE AND E1.SALARY<E2.SALARY;

-- 서브쿼리 실습
--회사전체 평균 연봉보다 더 많이 받는 사원들의 LAST_NAME, SALARY 조회
SELECT LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

-- LAST_NAME에 u가 포함되는 사원들과 동일 부서에 근무하는 사원들의 EMPLOYEE_ID, LAST_NAME 조회
SELECT EMPLOYEE_ID, LAST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME LIKE '%u%');

--NOT EXISTS 연산자를 사용하여 매니저가 아닌 사원이름을 조회
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES E1 
WHERE NOT EXISTS(SELECT DISTINCT MANAGER_ID FROM EMPLOYEES E2 
WHERE E1.EMPLOYEE_ID=E2.MANAGER_ID);

SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES E1 
WHERE e1.employee_id NOT IN(SELECT DISTINCT MANAGER_ID FROM EMPLOYEES E2 
WHERE E1.EMPLOYEE_ID=E2.MANAGER_ID);

