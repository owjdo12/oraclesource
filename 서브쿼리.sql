--��������: ������ �ȿ� �ٸ� �������� �����ϰ� �ִ� ����
--������ ��������
SELECT * FROM EMP WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='JONES');

--����̸��� ALLEN�� ����� �߰����纸�� ���� �޴� ����� ���
SELECT * FROM emp WHERE COMM>(SELECT COMM FROM EMP WHERE ENAME='ALLEN');

--����̸��� WARD�� ����� �Ի��Ϻ��� ���� �Ի��� ����� ���
SELECT * FROM emp WHERE HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME='WARD');

--20�� �ּ��� ���� ��� �� ��ü ����� ��ձ޿����� ���� �޿��� �޴� ��� ���
SELECT * FROM emp WHERE DEPTNO=20 AND sal>(SELECT AVG(SAL) FROM EMP);

--20�� �ּ��� ���� ��� �� ��ü ����� ��ձ޿����� ���� �޿��� �޴� ��� ���(�μ���, ������ġ ���)
SELECT * FROM emp E,dept D WHERE D.DEPTNO=E.DEPTNO AND D.DEPTNO=20 AND sal>(SELECT AVG(SAL) FROM EMP);

--������ ��������

--�������� ����� 2�� �̻� ������ ����� ������ ���������� �����ڴ� ��� �Ұ�
--���� ������ ���ǿ� 2�� �̻��� ���� ���ϵǾ����ϴ�.
--SELECT * FROM EMP WHERE SAL >=(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

--IN
SELECT * FROM EMP WHERE SAL IN(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

--ANY(SOME)
-- =ANY : IN�� �������� ���� ����. ��, IN�� �� ���� �����
SELECT * FROM EMP WHERE SAL = ANY(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);
SELECT * FROM EMP WHERE SAL = SOME(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

--30�� �μ� ������� �ִ�޿����� ���� �޿��� �޴� ��� ���
SELECT * FROM EMP WHERE SAL<ANY(SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30);
SELECT * FROM EMP WHERE SAL<ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);

--ALL : ���������� ����� ��� �����ϴ� ���������� ������ ��
--�μ���ȣ�� 30���� ������� �ּұ޿����� �� ���� �޿��� �޴� ������
SELECT * FROM EMP WHERE SAL < ALL (SELECT SAL FROM EMP WHERE DEPTNO=30);

--EXISTS : IN�� ����� ����, �� IN���� ������ �����
SELECT * FROM EMP WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO=20);
SELECT * FROM EMP WHERE NOT EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO=20);

SELECT EMPNO, DEPTNO FROM EMP WHERE EXISTS (SELECT DEPTNO FROM DEPT WHERE DEPTNO IN(20,30) AND EMP.DEPTNO=DEPT.DEPTNO);
SELECT EMPNO, DEPTNO FROM EMP WHERE NOT EXISTS (SELECT 1 FROM DEPT WHERE DEPTNO IN(20,30) AND EMP.DEPTNO=DEPT.DEPTNO);

--PPT ��������
--��ü ����� ALLEN�� ���� ��å�� ������� �������, �μ������� ���
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND E.JOB 
IN(SELECT JOB FROM EMP WHERE ENAME='ALLEN');

--��ü ����� ��� �޿����� ���� �޿��� �޴� ������� �������, �μ�����, �޿�������� ���(��, ����Ҷ� �޿��� ���������� �����ϵ� ������쿡�� �����ȣ�� �������� ��������)
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE FROM EMP E, DEPT D, SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND E.SAL>(SELECT AVG(SAL) FROM EMP) ORDER BY E.SAL DESC, E.EMPNO ASC;

--���� �� ��������: ���������� select ���� ���� �÷��� ������ ������ ���
SELECT * FROM EMP WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);

--FROM ���� ����ϴ� ��������(�ζ��� ��)
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC FROM (SELECT * FROM EMP WHERE DEPTNO=10) E, (SELECT * FROM DEPT) D
WHERE E.DEPTNO = D.DEPTNO;