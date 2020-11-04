-- scott ������ �������ִ� ��� ���̺� ����
select * from tab;

--emp ���̺��� ����
DESC emp;

--emp ���̺��� ��� ���� ��ȸ
SELECT * FROM emp;

--emp ���̺��� Ư�� �ʵ常 ��ȸ
SELECT ename, job, sal FROM emp;

-- �ߺ� ���ڵ� ������ �� ��ȸ
SELECT DISTINCT deptno FROM emp;

-- alais(��Ī) : AS
SELECT empno AS �����ȣ FROM emp;

SELECT ename, sal, sal*12+comm AS ����, comm FROM emp;

SELECT ename as ����̸�, job as "�� å" from emp;

-- ORDER BY : �����Ͽ� ��ȸ
-- �ϳ��� ���� ������ �־� ��������(ASC) ��ȸ
SELECT ename, sal FROM emp ORDER BY sal;

-- �ϳ��� ���� ������ �־� �������� ��ȸ
SELECT ename, sal FROM emp ORDER BY sal DESC;

-- ��ü ������ ��ȸ(�����ȣ ��������)
SELECT * FROM emp ORDER BY empno;

-- �μ���ȣ�� ���������̰�, �μ���ȣ�� �����ϴٸ� �޿��� ��������
SELECT * FROM emp ORDER BY deptno ASC, sal DESC; 

SELECT empno AS employee_no, ename AS employee_name, jop, mgr AS manager, 
    hiredate, sal AS salary, comm AS commission, deptno AS department_no 
FROM emp ORDER BY deptno DESC, ename ASC;

-- WHERE ��ȸ�� �� �� ���� �ֱ�
-- �μ���ȣ�� 30�� �� ��� ��ȸ
SELECT * FROM emp WHERE deptno = 30;

-- �����ȣ�� 7782�� ��� ��ȸ
SELECT * FROM emp WHERE empno = 7782;

-- �μ���ȣ�� 30�̰�, �����å�� salesman ���� ��ȸ varchar/string -> ''
SELECT * FROM emp WHERE deptno = 30 AND job = 'SALESMAN';

-- �����ȣ�� 7499�̰�, �μ���ȣ�� 30�� ���� ��ȸ
SELECT * FROM emp WHERE empno = 7499 AND deptno = 30;

-- �μ���ȣ�� 30�̰ų�, �����å�� CLERK ���� ��ȸ
SELECT * FROM emp WHERE deptno = 30 OR job = 'SLERTK';

-- �μ���ȣ�� 20�̰ų�, �����å�� SALESMAN ���� ��ȸ
SELECT * FROM emp WHERE deptno = 20 OR job = 'SALESMAN';

-- �����ڸ� �̿��� ��ȸ
-- sal*12 �� �ݾ��� 36000�� ������ ��ȸ
SELECT * FROM emp WHERE sal * 12 = 36000;

-- ���迬���� : >, <, >=, <=
SELECT * FROM emp WHERE sal > 3000;
SELECT * FROM emp WHERE sal >= 3000;

SELECT * FROM emp WHERE ename >= 'F';

-- �������� : AND, OR
-- �޿��� 2500�̻��̰�, ������ ANALYST�� ������� ��ȸ
SELECT * FROM emp WHERE sal >= 2500 AND job = 'ANALYST';

-- ������ MANAGER, SALESMAN, CLERK�� ������� ��ȸ
SELECT * FROM emp WHERE job = 'MANAGER' or job = 'SALESMAN' or job = 'CLERK';

-- ������� : ���� �׸��� ������ �˻�
-- sal�� 3000�� �ƴ� ������� ���
SELECT * FROM emp WHERE sal != 3000;
SELECT * FROM emp WHERE sal <> 3000;
SELECT * FROM emp WHERE sal ^= 3000;

-- IN ������
--������ MANAGER, SALESMAN, CLERK�� ������� ��ȸ
SELECT * FROM emp WHERE job IN('MANAGER', 'SALESMAN', 'CLERK');

SELECT * FROM emp WHERE job != 'MANAGER' AND job != 'SALESMAN' AND job != 'CLERK';
SELECT * FROM emp WHERE job NOT IN('MANAGER', 'SALESMAN', 'CLERK');

-- IN�� ����ؼ� �μ���ȣ�� 10, 20�� ������� ��ȸ
SELECT * FROM emp WHERE deptno IN(10, 20);