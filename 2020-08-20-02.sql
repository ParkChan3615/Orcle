3. COUNT
(�������)
COUNT (*|expr)
. ������ ��� ���� ���Ǽ��� ��ȯ
. �ܺ����ο����� expr�� ����ؾ��� (*�� ����ϸ� '0'�� '1'�� ��ȯ
��) ������̺��� �μ��� ������� ��ȸ�Ͻÿ�
select A.DEPARTMENT_ID AS �μ��ڵ�,
       B.DEPARTMENT_NAME AS �μ��̸�,
       COUNT(*) AS �����
 FROM EMPLOYEES A, DEPARTMENTS B
 WHERE A.DEPARTMENT_ID= B.DEPARTMENT_ID
GROUP BY A.DEPARTMENT_ID,B.DEPARTMENT_NAME
ORDER BY 1;


��)ȸ�����̺��� ������ ȸ������
���ϸ��� �հ�� ��� ���ϸ����� ����ȭ�ÿ�.
SELECT MEM_JOB AS ����,
COUNT(*) AS ȸ����,
SUM(MEM)MILEAGE) AS "���ϸ��� �հ�",
ROUND (AVG(MEM_MILEAGE)) AS ��ո��ϸ���
 FROM MEMBER
GROUP BY MEM_JOB;

��) ������̺��� ��ü�������� ��ձ޿� ���� �޿��� ����
�������� �μ����� ��ȸ�Ͻÿ�
(��ձ޿��� ������� �ʴ� ���)
SELECT DEPARTMENT_ID AS �μ���ȣ,
       COUNT(*) AS �����
    FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY)
                 FROM EMPLOYEES)
GROUP BY DEPARTMENT_ID
ORDER BY 1;


SELECT DEPARTMENT_ID 
FROM DEPARTMENTS;

SELECT B.DEPARTMENT_ID AS �μ��ڵ�,
       B.DEPARTMENT_NAME AS �μ���,
       COUNT(*) AS �ο���
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID (+) = B.DEPARTMENT_ID
GROUP BY B.DEPARTMENT_ID,B.DEPARTMENT_NAME
ORDER BY 1;


����] ������̺��� ���� �������� ������� �μ����� ����ȭ�ÿ�
(����ó��)
SELECT DEPARTMENT_ID AS ����ڵ�,
        COUNT(*) AS �����
FROM EMPLOYEES
WHERE RETIRE_DATE IS NULL
GROUP BY DEPARTMENT_ID
ORDER BY 1;
    
    
4. MIN�� MAX
(�������)
MIN(expr), MAX(expr)
.�־��� �÷��̳� ������ ���� �ּ�(MIN)�Ǵ� �ִ�(MAX)���� ã�� ��ȯ

MAX��) ������ 2005�� 7�� 28���̶�� �����Ͽ� ��ٱ��� ��ȣ�� �����Ͻÿ�
SELECT TO_CHAR(SYSDATE,'YYYYMMDD')
 || TO_CHAR(TO_NUMBER(SUBSTR(MAX(CHAR_NO),9)))+1
FROM CART;


        SELECT 'P101'
                ||TRIM(TO_CHAR(TO_NUMBER(SUBSTR
                (MAX(PROD_ID),5))+1,'000000'))
      FROM PROD
      WHERE PROD_LGU = 'P101';
      
��) ȸ�����̺��� ���ϸ����� 1000�̸��� ȸ���� ã�� ���ϸ����� 1000���� �����Ͻÿ�

SELECT MEM_ID AS ȸ����ȣ,
       MEM_NAME AS ȸ���̸�,
GREATEST(MEM_MILEAGE,1000) AS ���ϸ���
FROM MEMBER;
       
UPDATE MEMBER
     SET MEM_MILEAGE =700
     WHERE MEM_NAME LIKE '��%';
     
1. ROLLUP
.�⺻ �����Լ����� �������� �ʴ� �κκ� �Ұ踦 ����
.GROUP BY ���� ���
(�������)
ROLLUP(C1, C2,......)
. ��õ� �÷�(C1, C2.....)�� ���� ����( ������-> ����) �� ���� ������ ������ ��ȯ
.���� �÷��� ���� n���̸� n+1��������
(������������ �������� ������ �����ȯ

SELECT PERIOD,
    SUM(LOAN_JAN_AMT)
    FROM KOR_LOAN_STATUS
GROUP BY ROLLUP(PERIOD,REGION)
ORDER BY 2;

2. CUBE
    - ROLLUP�� ����� ����
    - CUBE�� ����� ��� �÷��� ������ �� �ִ� ��� ������ ��ŭ�� �հ踦 ��ȯ
    - n���� �÷��� ���Ǹ� 2�� n�� ���� ��ũ�� �հ� ��ȯ 
    
    
    ��) �����ܾ� ���̺��� �Ⱓ��, ������, ���к�, �����ܾ��հ踦 ��ȸ�Ͻÿ�
(�⺻ ���� �Լ�)
SELECT PERIOD,
            REGION,
            GUBUN,
            SUM(LOAN_JAN_AMT)
FROM KOR_LOAN_STATUS
GROUP BY  PERIOD, REGION,  GUBUN;