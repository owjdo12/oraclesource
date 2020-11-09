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

--HAVING: GROUNP BY 절에 조건을 줄 떄 사용
--각 부서의 직책별 평균 급여를 구하되 그 평균 급여가 2000이상인 그룹만 출력
SELECT deptno, job, AVG(sal) FROM emp GROUP BY deptno, job HAVING AVG(sal) >= 2000;
--EMP테이블의 부서별 직책의 평균 급여가 500이상인 사원들의 부서번호, 직책, 부서별직책의 평균 급여 출력
SELECT deptno, job, AVG(sal) FROM emp 
GROUP BY deptno, job 
HAVING AVG(sal) >= 500;

SELECT deptno, job, AVG(sal) FROM emp 
WHERE sal<=3000 
GROUP BY deptno, job 
HAVING AVG(sal) >= 2000 
ORDER BY deptno, job;

--실습(ppt28~)
--DETPNO, AVG_SAL, MAX_SAL, MIN_SAL, CNT출력 단, 평균급여는 소수점제외하고 부서번호별로 출력
SELECT deptno, FLOOR(AVG(sal)) AS ABG_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(EMPNO) AS CNT FROM emp GROUP BY deptno;
--같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수 출력
SELECT JOB, COUNT(JOB) FROM emp GROUP BY job HAVING COUNT(JOB) >=3;
--사원들의 
SELECT TO_CHAR(hiredate,'YYYY') as hire_year, deptno, COUNT(*) as CNT FROM EMP GROUP BY deptno, TO_CHAR(hiredate,'YYYY') ORDER BY TO_CHAR(hiredate,'YYYY') desc;

-- 조인
SELECT * FROM emp, dept ORDER BY empno;

SELECT * FROM dept; --4행
SELECT * FROM emp; --14행

--1) 내부조인(등가조인)
SELECT * FROM EMP E,DEPT D 
WHERE E.deptno = D.deptno 
ORDER BY EMPNO;

SELECT * FROM EMP E
INNER JOIN DEPT D 
ON E.deptno= D.deptno 
ORDER BY EMPNO;

-- 두 테이블에 같은 이름의 필드가 존재하는 경우/ 어느테이블에 있는 필드를 가지고 올것인지 정확히 명시
SELECT empno, ename, job, deptno, dname FROM EMP E, DEPT D
WHERE E.deptno= D.deptno 
ORDER BY EMPNO;

-- EMP테이블과 DEPT 테이블을 조인하여 EMPNO, ENAME, SAL, DEPTNO, DNAME, LOC조회. 단, 급여가 300이상인 사원만 출력
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC FROM EMP E, DEPT D 
WHERE E.DEPTNO=D.DEPTNO AND SAL>=3000;

--EMP테이블의 별칭을 e로, dept테이블 별칭을 d로 하여 급여가 2500이하이고, 사원번호가 9999이하인 사원의 정보를 출력
SELECT * FROM emp e, dept d WHERE e.deptno=d.deptno and e.sal<2500 and e.empno<9999;

--emp테이블의 별칭을 e로, salgrade테이블 별칭을 s로 하여 각 사원의 정보와 더불어 사원의 등급정보를 출력
SELECT * FROM emp e, salgrade s WHERE e.sal BETWEEN s.losal and s.hisal;

--OUTER(외부조인): 조건을 만족하지 않는 데이터 추출
--1)LEFT OUTER JOIN
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGT_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 ON E1.MGR=E2.EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGT_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);

--2)RIGHT OUTER JOIN
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGT_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON E1.MGR=E2.EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGT_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO;

--실습 (PPT 11~)
--급여가 2000초과인 사원들의 부서정보, 사원정보 출력
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL FROM EMP E, DEPT D
WHERE d.deptno=e.deptno AND e.sal>2000 ORDER BY E.DEPTNO;

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL 
FROM EMP E INNER JOIN DEPT D ON d.deptno=e.deptno 
WHERE e.sal>2000 ORDER BY E.DEPTNO;

--각 부서별 평균급여, 최대급여, 최소급여, 사원수
SELECT D.DEPTNO, D.DNAME, FLOOR(AVG(E.SAL)) AS AVG_SAL, MAX(E.SAL) AS MAX_AL, MIN(E.SAL) AS MIN_SAL,COUNT(DNAME) AS CNT 
FROM dept D, emp E
WHERE D.DEPTNO=e.deptno
GROUP BY D.DEPTNO, D.DEPTNO
ORDER BY E.DEPTNO;

SELECT D.DEPTNO, D.DNAME, FLOOR(AVG(E.SAL)) AS AVG_SAL, MAX(E.SAL) AS MAX_AL, MIN(E.SAL) AS MIN_SAL,COUNT(DNAME) AS CNT 
FROM emp E INNER JOIN DEPT D ON D.DEPTNO=e.deptno
GROUP BY D.DEPTNO, D.DNAME
ORDER BY E.DEPTNO;

SELECT D.DEPTNO, D.DNAME, FLOOR(AVG(E.SAL)) AS AVG_SAL, MAX(E.SAL), MIN(E.SAL), COUNT(DNAME)
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME
ORDER BY E.DEPTNO;

--모든 부서정보와 사원정보를 부서번호, 사원이름 순으로 정렬하여 출력
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM emp E RIGHT OUTER JOIN DEPT D ON E.DEPTNO=D.DEPTNO
ORDER BY d.deptno, e.ename;

--모든 부서정보와 사원정보, 급여등급 정보, 각 사원의 직속상관의 정보 부서번호, 사원번호 순으로 정렬하여 출력
SELECT D1.DEPTNO, D1.DNAME, E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL, E1.DEPTNO, S.LOSAL, S.HISAL, S.GRADE, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGr_ENAME
FROM emp E1 RIGHT OUTER JOIN DEPT D1 ON E1.DEPTNO=D1.DEPTNO --기준 오른쪽. E1에없는값 D1에 존재.(40번 부서)
LEFT OUTER JOIN SALGRADE S ON E1.SAL BETWEEN S.LOSAL AND S.HISAL --이전의 모든테이블이 LEFT테이블로
LEFT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO
ORDER BY d1.deptno, E1.EMPNO;

SELECT D1.DEPTNO, D1.DNAME, E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL, E1.DEPTNO, S.LOSAL, S.HISAL, S.GRADE, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGr_ENAME
FROM EMP E1, DEPT D1, SALGRADE S, EMP E2
WHERE E1.DEPTNO(+)=D1.DEPTNO AND E1.SAL BETWEEN S.LOSAL(+)
AND S.HISAL(+) AND E1.MGR = E2.EMPNO(+)
ORDER BY E1.EMPNO;