select * from tab;

-- employees ���̺� ��ü ���� ��ȸ
SELECT * FROM employees;

-- employees ���̺� first_name, last_name, job_id �� ��ȸ
SELECT first_name, last_name, job_id FROM employees;

-- �����ȣ�� 176�� ����� LAST_NAME�� �μ���ȣ ��ȸ
SELECT LAST_NAME, DEPARTMENT_ID FROM employees WHERE EMPLOYEE_ID = 176;

-- ������ 12000 �̻� �Ǵ� �������� LAST_NAME �� ���� ��ȸ
SELECT LAST_NAME, SALARY FROM employees WHERE SALARY>= 12000;

-- ������ 5000���� 12000�� ���� �̿��� ������� LAST_NAME �� ���� ��ȸ
SELECT LAST_NAME, SALARY FROM employees WHERE 5000> SALARY OR SALARY <12000;

-- 20�� �� 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ���ȣ�� ���ĺ������� ��ȸ
SELECT LAST_NAME, department_id FROM employees WHERE department_id IN(20, 50) ORDER BY LAST_NAME;

-- Ŀ�̼��� ���� ��� ������� LAST_NAME, ����, Ŀ�̼� ��ȸ. ��, ������ ���� �� Ŀ�̼��� �������� ������
SELECT LAST_NAME, SALARY, COMMISSION_PCT FROM employees WHERE commission_pct >0 ORDER BY salary DESC, commission_pct DESC;

-- ������ 2500, 3500, 7000�� �ƴϸ�, ������ SA_REP �̳� ST_CLERK�� ����� ��ȸ
SELECT * FROM employees WHERE salary NOT IN(2500, 3500, 7000) AND job_id IN('SA_REP', 'ST_CLERK');

-- 2008/2/20 ~ 2008/05/01 ���̿� ���� ������� LASE_NAME, �����ȣ, ������� ��ȸ. ��, ������� ������������ �����Ͽ� ���
SELECT LAST_NAME, employee_id, hire_date FROM employees WHERE hire_date>'2008/02/20' and hire_date<'2008/05/01' ORDER BY hire_date DESC;

-- 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� �������� ������������ �����Ͽ� ���
select last_name, hire_date from employees where hire_date>='2004-01-01' and hire_date <= '2004-12-31' order by hire_date;

-- ������ 5000���� 1200������ �ְ�, 20 OR 50�� �μ��� �ٹ��ϴ� ������� ������ ��ȸ�Ͽ� ������������ �����ֱ�(LAST_NAME, SALARY)
SELECT last_name, salary FROM employees WHERE department_id IN(20, 50) AND salary BETWEEN 5000 AND 12000 ORDER BY salary;

--2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� �������� �������� �����Ͽ� ���
SELECT last_name, hire_date FROM employees WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-31' ORDER BY hire_date;

-- ������ 5000~12000 ���� �̿��� ������� last_name, salary ��ȸ
SELECT last_name, salary FROM employees WHERE salary NOT BETWEEN 5000 AND 12000;

--2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� �������� �������� �����Ͽ� ���
SELECT last_name, hire_date FROM employees WHERE hire_date LIKE '2004%' ORDER BY hire_date;

--LAST_NAME�� u�� ���ԵǴ� ������� ��� �� last_name ��ȸ
SELECT employee_id, last_name FROM employees WHERE last_name LIKE '%u%'; 

-- last_name �� �׹�° ���ڰ� a�� ������� last_name ��ȸ
SELECT last_name FROM employees WHERE last_name LIKE '___a%'; 

-- last_name�� a Ȥ�� e ���ڰ� �ִ� ������� last_name�� ��ȸ�Ͽ� last_name �������� �������� ����
SELECT last_name FROM employees WHERE last_name LIKE '%a%' or last_name LIKE '%e%' ORDER BY last_name;

-- last_name�� a �� e ���ڰ� �ִ� ������� last_name�� ��ȸ�Ͽ� last_name �������� �������� ����
~~~~~~~`SELECT last_name FROM employees WHERE last_name LIKE '%a%e%' last_name AND LIKE '%e%a%' ORDER BY last_name;

-- IS NULL ����
-- �Ŵ����� ���� ������� LAST_NAME, JOB_ID ��ȸ
SELECT last_name, job_id FROM employees WHERE manager_id IS NULL;

-- ST_CLERK�� JOB_ID�� ���� ����� ���� �μ� ID��ȸ. �μ���ȣ�� NULL�� �� ����
SELECT DISTINCT department_id FROM employees WHERE job_id NOT IN('ST_CLERK') AND department_id IS NOT NULL;

-- COMMISSION_PCT�� NULL �� �ƴ� ����� �߿��� COMMSSION = SALARY * COMMISSION_PCT�� ���Ͽ� EMPLOYEE_ID, FIRST_NAME, JOB_ID�� ���� ��ȸ
SELECT department_id, first_name, job_id, SALARY * COMMISSION_PCT AS commission FROM employees WHERE commission_pct IS NOT NULL;

-- [�ǽ�]���ڿ� �Լ�
-- 1.first_name�� Curtis�� ����� first_name, last_name, email, phone_number, job_id�� ��ȸ�Ѵ�. �� job_id�� ����� �ҹ��ڷ� ��µǵ���
SELECT first_name, last_name, email, phone_number, LOWER(job_id) FROM employees WHERE first_name = 'Curtis';

-- 2. �μ���ȣ�� 70,80,90�� ������� employee_id, first_name, hire_date, job_id�� ��ȸ�Ѵ�. ��, job_id�� it_prog�� ����� ��� ���α׷��ӷ� �����Ͽ� ����Ѵ�.
SELECT employee_id, first_name, hire_date, REPLACE(job_id, 'IT_PROG', '���α׷���') FROM employees WHERE department_id IN (60, 70, 80, 90);

-- 3. job_id�� ad_pres, pu_clerk�� ������� employee_id, first_name, last_name, department-id, job_id�� ��ȸ�Ͻÿ�. ��, ������� first_name�� last_name�� �����Ͽ� ����Ѵ�.
SELECT employee_id, CONCAT(first_name,CONCAT(' ',last_name)) department_id, job_id FROM employees WHERE job_id IN('ad_pres', 'pu_clerk');


--�ǽ�
--�μ�80�� ������� ���� ���밡���� ������ ǥ���Ͻÿ�
SELECT last_name, salary, CASE WHEN salary<2000 THEN 0 
                                WHEN (salary<4000) THEN 0.09
                                WHEN (salary<6000) THEN 0.2
                                WHEN (salary<8000) THEN 0.3
                                WHEN (salary<10000) THEN 0.4
                                WHEN (salary<12000) THEN 0.42
                                WHEN (salary<14000) THEN 0.44
                                ELSE 0.45 END as tax_rate FROM employees WHERE department_id = 80;
--0~1,999 :0%, 2000~3999: 9%, 4000~5999: 20%, 6000~7999: 30%, 8000~9999: 40%, 10000~11999: 42%, 12000~13999: 44%, 14000�̻�: 45%
SELECT last_name, salary, DECODE(TRUNC(salary/2000,0),0,0.00, 
                                                    1, 0.09,
                                                    2,0.20,
                                                    3,0.30,
                                                    4,0.40,
                                                    5,0.42,
                                                    6,0.44,
                                                    0.45) as TAX_RATE FROM employees WHERE department_id = 80;
                                                
--�������Լ� ����
--ȸ�� ���� �ִ� ���� �� �ּ� �������̸� ��ȸ
SELECT MAX(salary)-MIN(salary) FROM employees;
--�Ŵ����� �ٹ��ϴ� ������� �ο��� ��ȸ
SELECT COUNT(DISTINCT manager_id) FROM employees;
--�μ��� ������ ���� ���Ͽ� �μ���ȣ�� ������������ ���
SELECT department_id, COUNT(employee_id) FROM employees GROUP BY department_id ORDER BY department_id;
-- �μ��� �޿��� ��տ����� ����ϰ�, ��տ����� ������ �������� �Ѵ�. �μ���ȣ�� ������������ ����
SELECT department_id, ROUND(AVG(SALARY)) FROM employees GROUP BY department_id ORDER BY department_id;
--������ ������ ���� ������� ��ȸ
SELECT COUNT(employee_id), job_id FROM employees GROUP BY job_id;

--JOIN�ǽ�
--�ڽ��� ��� �Ŵ����� ����Ϻ��� ���� �Ի��ڸ� ã�� HIRE_DATE, LAST_NAME, MANAGER_ID ��� =37��
SELECT E.HIRE_DATE, E.LAST_NAME, E.MANAGER_ID FROM EMPLOYEES E, EMPLOYEES M
WHERE M.employee_id=e.manager_id AND e.hire_date<M.HIRE_DATE; 

--�����̸��� T�� �����ϴ� ������ ��� ������� ���, LAST_NAME, �μ���ȣ ��ȸ
--(EMPLOYEES�� DEPT_ID�� DEPT�� DEPT_ID���� �� DEPT�� LOCATION_ID->LACATIONS�� LOCATION_ID 3������ =2��
SELECT EMPLOYEE_ID, E.LAST_NAME, D.DEPARTMENT_ID FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE e.department_id=D.DEPARTMENT_ID AND D.LOCATION_ID=l.location_id AND L.CITY LIKE 'T%';

--��ġ ID�� 1700�� ������ ������� EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, SALARY ��ȸ
--(EMPLOYEES�� DEPARTMENTS ����) =18��
SELECT EMPLOYEE_ID, LAST_NAME, E.DEPARTMENT_ID, SALARY FROM EMPLOYEES E, DEPARTMENTS D
WHERE e.department_id = D.DEPARTMENT_ID AND D.LOCATION_ID=1700;

-- DEPARTMENT_NAME, LOCATION_ID, �� �μ��� �����, �� �μ��� ��� ���� ��ȸ
--(EMPLOYEES, DEPARTMENT ����)=11��
------------------------------------------------------
SELECT D.DEPARTMENT_NAME, D.LOCATION_ID, COUNT(E.JOB_ID), FLOOR(AVG(E.SALARY))
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--EXECUTIVE �μ��� �ٹ��ϴ� ��� ������� DEPARTMENT_ID, LAST_NAME, JOB_ID ��ȸ
--(EMPLOYEES, DEPARTMENT ����)
SELECT DEPARTMENT_ID, LAST_NAME, JOB_ID FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.DEPARTMENT_ID=E.DEPARTMENT_ID;

--������ ������ ������ �������ִ� ������� ��� �� JOB_ID ��ȸ
--(EMPLOYEES, JOB_HISTORY ����)


--�� ����� �Ҽ� �μ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴� ����� �����ϴ� ��� ������� LAST_NAME�� ��ȸ
--(EMPLOYEES SELF JOIN)//�̸� ����
SELECT E1.EMPLOYEE_ID, E1.FIRST_NAME||' '||E1.LAST_NAME AS NAME
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.DEPARTMENT_ID = E2.DEPARTMENT_ID AND E1.HIRE_DATE < E2.HIRE_DATE AND E1.SALARY<E2.SALARY;

-- �������� �ǽ�
--ȸ����ü ��� �������� �� ���� �޴� ������� LAST_NAME, SALARY ��ȸ
SELECT LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

-- LAST_NAME�� u�� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� EMPLOYEE_ID, LAST_NAME ��ȸ
SELECT EMPLOYEE_ID, LAST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME LIKE '%u%');

--NOT EXISTS �����ڸ� ����Ͽ� �Ŵ����� �ƴ� ����̸��� ��ȸ
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES E1 
WHERE NOT EXISTS(SELECT DISTINCT MANAGER_ID FROM EMPLOYEES E2 
WHERE E1.EMPLOYEE_ID=E2.MANAGER_ID);

SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES E1 
WHERE e1.employee_id NOT IN(SELECT DISTINCT MANAGER_ID FROM EMPLOYEES E2 
WHERE E1.EMPLOYEE_ID=E2.MANAGER_ID);

