2020-08-13-02)���ڿ� �Լ�
1. INITCAP, LOWER, UPPER 
 1)LOWER(C)
 .�־��� C ���ڿ��� ��� ���ڸ� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ
 .�ַ� �񱳹����� ���
 
 ��) ������̺��� ����� �̸��� �̸��� ���� ���ڷ� ��ȯ�Ͽ� ����Ͻÿ�.
 
 SELECT EMP_NAME AS "�����(�����ǰ�)",
        EMAIL AS "�̸���(������)",
        LOWER(EMP_NAME) AS "����� (��ȯ��)",
        LOWER(EMAIL) AS "�̸���*(��ȯ��)"
    FROM EMPLOYEES;
    
�� )
SELECT EMP_NAME AS �����,
        DEPARTMENT_ID AS �μ��ڵ�,
        JOB_ID AS ��å�ڵ�,
        SALARY AS �޿�
    FROM EMPLOYEES
 WHERE LOWER(SUBSTR(EMP_NAME,1,1)) = 'g';
 
 
 
 �� ��ǰ���̺��� �з��� ������ǰ(P102)�� ���� ��ǰ�� ���� ����Ͻÿ�.
 SELECT COUNT(*)
  FROM PROD
  WHERE LOWER(PROD_LGU) = 'p102';
  
��)������̺��� ����̸��� ��� �ҹ��ڷ� ��ȯ�Ͽ� �����Ͻÿ�.
 
 UPDATE EMPLOYEES
    SET EMP_NAME = LOWER(EMP_NAME);
    
 SELECT EMP_NAME FROM EMPLOYEES;
 
 ROLLBACK;
 
 2)UPPER(c)
 .c�� ����� ���ڿ��� ��� ���ڸ� �빮�ڷ� ��ȯ
 �� ) ������̺��� ����̸��� ��� �빮�ڷ� ��ȯ�Ͽ� �����Ͻÿ�.
 
   
 UPDATE EMPLOYEES
    SET EMP_NAME = UPPER(EMP_NAME);
 SELECT EMP_NAME FROM EMPLOYEES;
 
 3)INITCAP(c)
 -�� �ܾ��� ù���ڸ�  �빮�ڷ� ��ȯ
 �� ) ������̺��� �̸��� ù���ڸ� �빮�ڷ� ��ȯ�ϼ���
 UPDATE EMPLOYEES
    SET EMP_NAME = INITCAP(EMP_NAME);
    
    COMMIT;
    
4. CONCAT(C1,C2)
.C1���ڿ��� C2���ڿ��� �����Ͽ� ��ȯ
.'||'�����ڿ� ���� ���

��) ȸ�����̺��� ���ϸ����� 3000�̻��� ȸ�������� ��ȸ�Ͻÿ�.
Alias�� ȸ����, �ֹι�ȣ, ���ϸ���, �����̴�.
     ��, �ֹι�ȣ�� xxxxxx-xxxxxxx�������� ����ϵ� CONCAT�� ����� ��
     
SELECT MEM_NAME AS ȸ����,
        CONCAT(CONCAT(MEM_REGNO1,'-'),MEM_REGNO2) AS �ֹι�ȣ,
        MEM_MILEAGE AS ���ϸ���,
        MEM_JOB AS ����
    FROM MEMBER 
WHERE MEM_MILEAGE >= 3000;

SUBSTR(c, pos[, len])
.�־��� ���ڿ� c���� pos ��ġ���� len���� ��ŭ�� ���ڿ��� �����Ͽ� ��ȯ
.pos ���� 0�� ��� 1�� ���
.len�� �����Ǹ� pos��ġ ������ ��� ���ڿ��� ��ȯ
.���� ���� ���Ǵ� ���ڿ� �Լ�


��)ȸ�����̺��� �ֹε�Ϲ�ȣ�� �̿��Ͽ� ����ȸ������ ���̸� ����Ͻÿ�.

 Alias�� ȸ����, �ֹι�ȣ, ����, ���ϸ���
 
 SELECT MEM_NAME AS ȸ����,
        MEM_REGNO1||'-'||MEM_REGNO2 AS �ֹι�ȣ,
        EXTRACT (YEAR FROM SYSDATE) -
         TO_NUMBER('19'||SUBSTR(MEM_REGNO1,1,2))AS ����,
         MEM_MILEAGE AS ���ϸ���
    FROM MEMBER
  WHERE SUBSTR(MEM_REGNO2,1,1)='2';
  
����] ������̺��� �ټӳ�� 15�� �̻��� ����鿡�� Ư�� ���ʽ��� �����Ϸ��Ѵ�.
���ʽ��� �޿� *(�ټӳ��/100) �̸� �Ҽ� ù�ڸ����� �ݿø� �Ѵ�

���޾�=�޿�+���ʽ�
Alias�� �����, �μ��ڵ�, �Ի���, �ټӳ��, ���ʽ� ,�޿�, ���޾��̴�.
SELECT EMP_NAME AS �����,
           EMPLOYEE_ID AS �μ��ڵ�,
           HIRE_DATE AS �Ի���, 
           EXTRACT(YEAR FROM SYSDATE) - SUBSTR(HIRE_DATE,1,4) AS �ټӳ��, 
           ROUND(SALARY*((EXTRACT(YEAR FROM SYSDATE) - SUBSTR(HIRE_DATE,1,4))/100)) AS ���ʽ�, 
           SALARY AS �޿�,
           SALARY +ROUND(SALARY*((EXTRACT(YEAR FROM SYSDATE) - SUBSTR(HIRE_DATE,1,4))/100))  AS ���޾� 
FROM EMPLOYEES
WHERE  SUBSTR(EXTRACT(YEAR FROM SYSDATE) - SUBSTR(HIRE_DATE,1,4),1,2) >=15 ;

       
        