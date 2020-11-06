-- sum: 합계
SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal) FROM emp;

-- count: 개수
SELECT COUNT(*) FROM emp;
SELECT COUNT(sal), COUNT(DISTINCT sal), COUNT(ALL sal) FROM emp;
-- 부서번호가 30번인 직원 수
SELECT COUNT(*) FROM emp WHERE deptno=30;

-- MAX(최대값), MIN(최소값)
SELECT MAX(SAL), MIN(SAL) FROM emp;
-- 부서번호가 20인 사원의 입사일 중 가장 최근 입사일 구하기
SELECT MAX(HIREDATE) FROM emp WHERE deptno=20;

-- AVERAGE: 평균
SELECT AVG(SAL) FROM emp;
SELECT AVG(SAL) FROM emp WHERE deptno=30;
SELECT AVG(DISTINCT SAL) FROM emp;

-- GROUP BY : 결과값을 원하는 열로 묶어 출력
SELECT deptno, AVG(SAL) FROM emp GROUP BY deptno;
-- 부서번호별 추가수당 평균 구하기
SELECT deptno, AVG(COMM) FROM emp GROUP BY deptno;
-- 부서번호, 직책별 급여 평균
SELECT deptno, AVG(SAL), JOB FROM emp GROUP BY deptno, job ORDER BY deptno, job;
-- group by 절에 포함 안되는 열을 select에 포함하면 안됨
SELECT ename, deptno, AVG(sal) FROM emp GROUP BY deptno;