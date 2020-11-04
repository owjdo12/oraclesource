-- scott 계정이 가지고있는 모든 테이블 보기
select * from tab;

--emp 테이블의 구조
DESC emp;

--emp 테이블의 모든 내용 조회
SELECT * FROM emp;

--emp 테이블의 특정 필드만 조회
SELECT ename, job, sal FROM emp;

-- 중복 레코드 제거한 후 조회
SELECT DISTINCT deptno FROM emp;

-- alais(별칭) : AS
SELECT empno AS 사원번호 FROM emp;

SELECT ename, sal, sal*12+comm AS 연봉, comm FROM emp;

SELECT ename as 사원이름, job as "직 책" from emp;

-- ORDER BY : 정렬하여 조회
-- 하나의 열로 기준을 주어 오름차순(ASC) 조회
SELECT ename, sal FROM emp ORDER BY sal;

-- 하나의 열로 기준을 주어 내림차순 조회
SELECT ename, sal FROM emp ORDER BY sal DESC;

-- 전체 데이터 조회(사원번호 오름차순)
SELECT * FROM emp ORDER BY empno;

-- 부서번호의 오름차순이고, 부서번호가 동일하다면 급여의 내림차순
SELECT * FROM emp ORDER BY deptno ASC, sal DESC; 

SELECT empno AS employee_no, ename AS employee_name, jop, mgr AS manager, 
    hiredate, sal AS salary, comm AS commission, deptno AS department_no 
FROM emp ORDER BY deptno DESC, ename ASC;

-- WHERE 조회를 할 때 기준 주기
-- 부서번호가 30번 인 사원 조회
SELECT * FROM emp WHERE deptno = 30;

-- 사원번호가 7782인 사원 조회
SELECT * FROM emp WHERE empno = 7782;

-- 부서번호가 30이고, 사원직책이 salesman 정보 조회 varchar/string -> ''
SELECT * FROM emp WHERE deptno = 30 AND job = 'SALESMAN';

-- 사원번호가 7499이고, 부서번호가 30인 정보 조회
SELECT * FROM emp WHERE empno = 7499 AND deptno = 30;

-- 부서번호가 30이거나, 사원직책이 CLERK 정보 조회
SELECT * FROM emp WHERE deptno = 30 OR job = 'SLERTK';

-- 부서번호가 20이거나, 사원직책이 SALESMAN 정보 조회
SELECT * FROM emp WHERE deptno = 20 OR job = 'SALESMAN';