select * from tab;

-- employees 테이블 전체 내용 조회
SELECT * FROM employees;

-- employees 테이블 first_name, last_name, job_id 만 조회
SELECT first_name, last_name, job_id FROM employees;

-- 사원번호가 176인 사람의 LAST_NAME과 부서번호 조회
SELECT LAST_NAME, DEPARTMENT_ID FROM employees WHERE EMPLOYEE_ID = 176;

-- 연봉이 12000 이상 되는 직원들의 LAST_NAME 및 연봉 조회
SELECT LAST_NAME, SALARY * 12 FROM employees WHERE (SALARY * 12)>= 12000;

-- 연봉이 5000에서 12000의 범위 이외의 사람들의 LAST_NAME 및 연봉 조회
SELECT LAST_NAME, SALARY * 12 FROM employees WHERE 5000> SALARY * 12 OR SALARY * 12 > 12000;