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