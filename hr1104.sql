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
