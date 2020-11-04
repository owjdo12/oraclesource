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
SELECT LAST_NAME, SALARY FROM employees WHERE 5000> SALARY OR SALARY 12000;

-- 20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서번호를 안파벳순으로 조회
SELECT LAST_NAME, department_id FROM employees WHERE department_id IN(20, 50) ORDER BY LAST_NAME;

-- 커미션을 버는 모든 사원들의 LAST_NAME, 연봉, 커미션 조회. 단, 연봉의 역순 및 커미션의 역순으로 결과출력
SELECT LAST_NAME, SALARY, COMMISSION_PCT FROM employees WHERE commission_pct >0 ORDER BY salary DESC, commission_pct DESC;

-- 연봉이 2500, 3500, 7000이 아니며, 직업이 SA_REP 이나 ST_CLERK인 사람들 조회
SELECT * FROM employees WHERE salary NOT IN(2500, 3500, 7000) AND job_id IN('SA_REP', 'ST_CLERK');

-- 2008/2/20 ~ 2008/05/01 사이에 고용된 사원들의 LASE_NAME, 사원번호, 고용일자 조회. 단, 고용일자 내림차순으로 정렬하여 출력
SELECT LAST_NAME, employee_id, hire_date FROM employees WHERE hire_date>'2008/02/20' and hire_date<'2008/05/01' ORDER BY hire_date DESC;

-- 2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로 오름차순으로 정렬하여 출력
SELECT LAST_NAME, hire_date FROM employees ORDER BY hire_date;