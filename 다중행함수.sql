-- sum: �հ�
SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal) FROM emp;

-- count: ����
SELECT COUNT(*) FROM emp;
SELECT COUNT(sal), COUNT(DISTINCT sal), COUNT(ALL sal) FROM emp;
-- �μ���ȣ�� 30���� ���� ��
SELECT COUNT(*) FROM emp WHERE deptno=30;

-- MAX(�ִ밪), MIN(�ּҰ�)
SELECT MAX(SAL), MIN(SAL) FROM emp;
-- �μ���ȣ�� 20�� ����� �Ի��� �� ���� �ֱ� �Ի��� ���ϱ�
SELECT MAX(HIREDATE) FROM emp WHERE deptno=20;

-- AVERAGE: ���
SELECT AVG(SAL) FROM emp;
SELECT AVG(SAL) FROM emp WHERE deptno=30;
SELECT AVG(DISTINCT SAL) FROM emp;

-- GROUP BY : ������� ���ϴ� ���� ���� ���
SELECT deptno, AVG(SAL) FROM emp GROUP BY deptno;
-- �μ���ȣ�� �߰����� ��� ���ϱ�
SELECT deptno, AVG(COMM) FROM emp GROUP BY deptno;
-- �μ���ȣ, ��å�� �޿� ���
SELECT deptno, AVG(SAL), JOB FROM emp GROUP BY deptno, job ORDER BY deptno, job;
-- group by ���� ���� �ȵǴ� ���� select�� �����ϸ� �ȵ�
SELECT ename, deptno, AVG(sal) FROM emp GROUP BY deptno;

--HAVING: GROUNP BY ���� ������ �� �� ���
--�� �μ��� ��å�� ��� �޿��� ���ϵ� �� ��� �޿��� 2000�̻��� �׷츸 ���
SELECT deptno, job, AVG(sal) FROM emp GROUP BY deptno, job HAVING AVG(sal) >= 2000;
--EMP���̺��� �μ��� ��å�� ��� �޿��� 500�̻��� ������� �μ���ȣ, ��å, �μ�����å�� ��� �޿� ���
SELECT deptno, job, AVG(sal) FROM emp 
GROUP BY deptno, job 
HAVING AVG(sal) >= 500;

SELECT deptno, job, AVG(sal) FROM emp 
WHERE sal<=3000 
GROUP BY deptno, job 
HAVING AVG(sal) >= 2000 
ORDER BY deptno, job;

--�ǽ�(ppt28~)
--DETPNO, AVG_SAL, MAX_SAL, MIN_SAL, CNT��� ��, ��ձ޿��� �Ҽ��������ϰ� �μ���ȣ���� ���
SELECT deptno, FLOOR(AVG(sal)) AS ABG_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(EMPNO) AS CNT FROM emp GROUP BY deptno;
--���� ��å�� �����ϴ� ����� 3�� �̻��� ��å�� �ο��� ���
SELECT JOB, COUNT(JOB) FROM emp GROUP BY job HAVING COUNT(JOB) >=3;
--������� 
SELECT TO_CHAR(hiredate,'YYYY') as hire_year, deptno, COUNT(*) as CNT FROM EMP GROUP BY deptno, TO_CHAR(hiredate,'YYYY') ORDER BY TO_CHAR(hiredate,'YYYY') desc;

-- ����
SELECT * FROM emp, dept ORDER BY empno;

SELECT * FROM dept; --4��
SELECT * FROM emp; --14��

--1) ��������(�����)
SELECT * FROM EMP E,DEPT D 
WHERE E.deptno = D.deptno 
ORDER BY EMPNO;

SELECT * FROM EMP E
INNER JOIN DEPT D 
ON E.deptno= D.deptno 
ORDER BY EMPNO;

-- �� ���̺� ���� �̸��� �ʵ尡 �����ϴ� ���/ ������̺� �ִ� �ʵ带 ������ �ð����� ��Ȯ�� ���
SELECT empno, ename, job, deptno, dname FROM EMP E, DEPT D
WHERE E.deptno= D.deptno 
ORDER BY EMPNO;

-- EMP���̺�� DEPT ���̺��� �����Ͽ� EMPNO, ENAME, SAL, DEPTNO, DNAME, LOC��ȸ. ��, �޿��� 300�̻��� ����� ���
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC FROM EMP E, DEPT D 
WHERE E.DEPTNO=D.DEPTNO AND SAL>=3000;

--EMP���̺��� ��Ī�� e��, dept���̺� ��Ī�� d�� �Ͽ� �޿��� 2500�����̰�, �����ȣ�� 9999������ ����� ������ ���
SELECT * FROM emp e, dept d WHERE e.deptno=d.deptno and e.sal<2500 and e.empno<9999;

--emp���̺��� ��Ī�� e��, salgrade���̺� ��Ī�� s�� �Ͽ� �� ����� ������ ���Ҿ� ����� ��������� ���
SELECT * FROM emp e, salgrade s WHERE e.sal BETWEEN s.losal and s.hisal;

--OUTER(�ܺ�����): ������ �������� �ʴ� ������ ����
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

--�ǽ� (PPT 11~)
--�޿��� 2000�ʰ��� ������� �μ�����, ������� ���
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL FROM EMP E, DEPT D
WHERE d.deptno=e.deptno AND e.sal>2000 ORDER BY E.DEPTNO;

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL 
FROM EMP E INNER JOIN DEPT D ON d.deptno=e.deptno 
WHERE e.sal>2000 ORDER BY E.DEPTNO;

--�� �μ��� ��ձ޿�, �ִ�޿�, �ּұ޿�, �����
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

--��� �μ������� ��������� �μ���ȣ, ����̸� ������ �����Ͽ� ���
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM emp E RIGHT OUTER JOIN DEPT D ON E.DEPTNO=D.DEPTNO
ORDER BY d.deptno, e.ename;

--��� �μ������� �������, �޿���� ����, �� ����� ���ӻ���� ���� �μ���ȣ, �����ȣ ������ �����Ͽ� ���
SELECT D1.DEPTNO, D1.DNAME, E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL, E1.DEPTNO, S.LOSAL, S.HISAL, S.GRADE, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGr_ENAME
FROM emp E1 RIGHT OUTER JOIN DEPT D1 ON E1.DEPTNO=D1.DEPTNO --���� ������. E1�����°� D1�� ����.(40�� �μ�)
LEFT OUTER JOIN SALGRADE S ON E1.SAL BETWEEN S.LOSAL AND S.HISAL --������ ������̺��� LEFT���̺��
LEFT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO
ORDER BY d1.deptno, E1.EMPNO;

SELECT D1.DEPTNO, D1.DNAME, E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL, E1.DEPTNO, S.LOSAL, S.HISAL, S.GRADE, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGr_ENAME
FROM EMP E1, DEPT D1, SALGRADE S, EMP E2
WHERE E1.DEPTNO(+)=D1.DEPTNO AND E1.SAL BETWEEN S.LOSAL(+)
AND S.HISAL(+) AND E1.MGR = E2.EMPNO(+)
ORDER BY E1.EMPNO;