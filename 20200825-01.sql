2020 - 08 -25 -01) ��������
FROM -> WHERE -> SELECT ���� ���� 
������ ������ �����ؾ��Ѵ�.

-SQL���� �ȿ��� ������ ���Ǵ� �� �ٸ� ����-
- ()�ȿ� ���
- �з�
    1) ������ ���ο� ����
    .������ ���� ��������, ������ �ִ� ��������
    2 ���¿� ����
    .�Ϲ� �������� (SELECT ��)
    .�ζ��� �������� (FROM ��)
    .��ø �������� (WHERE ��)
    3)��ȯ ���� ������ ���� 
    . ������ / ���Ͽ�, ������/���߿�, ������/���Ͽ�,
1.������ ���� ��������
- ���������� ���������� ���� ���̺��� �������� ������� ���� ��������

��) ȸ�� ���̺��� ��ո��ϸ������� ���� ���ϸ����� ������ ȸ���� 
ȸ����ȣ, ȸ����, ����, ���ϸ����� ��ȸ�Ͻÿ�
(1)��������: ȸ�����̺��� ȸ���� ȸ����ȣ , ȸ���� ,
          : ����, ���ϸ����� ���

SELECT MEM_ID AS ȸ����ȣ,
       MEM_NAME AS ȸ����,
       MEM_JOB AS ����,
       MEM_MILEAGE AS ���ϸ���
    FROM MEMBER,(SELECT AVG(MEM_MILEAGE) AS AMILE
                            FROM MEMBER) A

WHERE MEM_MILEAGE > A.AMILE;
(2) �������� : ��� ���ϸ���
SELECT AVG(MEM_MILEAGE)
 FROM MEMBER;
 ��) �μ����̺��� �����μ��ڵ尡 NULL�� �μ��� �Ҽӵ� ������� ��ȸ�Ͻÿ�

 (���� ���� : ������̺��� ������� ��ȸ)
 
 SELECT COUNT(*) AS �����
   FROM EMPLOYEES
   WHERE DEPARTMENT_ID = (�����μ��ڵ尡 NULL�� �μ��ڵ�)
   
 (���� ���� : �����μ��ڵ尡 NULL�� �μ��ڵ带 ã�� ��)
 
 SELECT DEPARTMENT_ID
   FROM DEPARTMENTS 
   WHERE PARENT_ID IS NULL;
   
   --����
   
   SELECT COUNT(*) AS �����
   FROM EMPLOYEES
   WHERE DEPARTMENT_ID IN
            (SELECT DEPARTMENT_ID
                FROM DEPARTMENTS 
                WHERE PARENT_ID IS NOT NULL);
                
 
 ��)�μ����̺��� �����μ��ڵ尡 null�� �μ��� �Ҽӵ� ������� ��ȸ�Ͻÿ�
 �������� : ������̺��� ������� ��ȸ
 
 SELECT COUNT(*) AS �����
   FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE PARENT_ID IS NULL);
(����)
SELECT DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE PARENT_ID IS NULL;
    
    
2.������ �ִ� ��������
-���������� ���������� ���� ���̺��� �������� ����� ��������

��) �� �μ��� ��ձ޿��� ����ϰ� �� �μ����� �ڱ� �μ��� ��ձ޿����� ����
�޿��� ���� �޴� �����ִ� �μ��ڵ�� �μ����� ���

select A.DEPARTMENT_ID AS �μ��ڵ�,
       A.DEPARTMENT_NAME AS �μ���,
    FROM DEPARTMENTS A
WHERE A.DEPARTMENT_ID IN (SELECT B.DEPARTMENT_ID
FROM EMPLOYEES B 
WHERE B.SALARY > (SELECT C.DEPARTMENT_ID, 
       ROUND(AVG(C.SALARY))
       FROM EMPLOYEES C
    GROUP BY C.DEPARTMENT_ID));

(��������) : �ڱ� �μ��� ��ձ޿����� ���� �޿��� ���� �޴�
�����ִ� �μ��� �μ��ڵ�
SELECT B.DEPARTMENT_ID
FROM EMPLOYEES B 
WHERE B.SALARY > (SELECT C.DEPARTMENT_ID, 
       ROUND(AVG(C.SALARY))
       FROM EMPLOYEES C
    GROUP BY C.DEPARTMENT_ID));

(�������� OF �������� :�ڱ� �μ��� ��ձ޿�)
SELECT C.DEPARTMENT_ID, 
       ROUND(AVG(C.SALARY))
       FROM EMPLOYEES C
    GROUP BY C.DEPARTMENT_ID;

�� ) ��ٱ������̺��� ȸ���� �ְ��ż����� ���� �ڷ���
ȸ����ȣ, ��ٱ��Ϲ�ȣ, ��ǰ��ȣ, ���ż����� ��ȸ�Ͻÿ�

�������� : ��ٱ��� ���̺��� ȸ���� ȸ����ȣ,
��ٱ��Ϲ�ȣ, ��ǰ��ȣ ���ż���
SELECT A.CART_MEMVER AS ȸ����ȣ,
       A.CART_NO AS ��ٱ��Ϲ�ȣ, 
       A.CART_PROD AS ��ǰ��ȣ,
       A.CART_QTY AS ���ż���
   FROM CART A
 WHERE A.CART_QTY = (��������:ȸ�����ִ뱸�ż���)
 
 (ȸ�����ִ뱸�ż���) =
 SELECT MAX(B.CART_QTY)
  FROM CART B
WHERE A.CART_MEMBER= B.CART_MEMBER


SELECT A.CART_MEMBER AS ȸ����ȣ,
       A.CART_NO AS ��ٱ��Ϲ�ȣ, 
       A.CART_PROD AS ��ǰ��ȣ,
       A.CART_QTY AS ���ż���
   FROM CART A
 WHERE A.CART_QTY = 
 (SELECT MAX(B.CART_QTY)
   FROM CART B
 WHERE A.CART_MEMBER= B.CART_MEMBER)
ORDER BY 1;
    
    
    
 ��) ������̺��� ����޿��� �Ʒ� ���Ǵ�� ����(update)�Ͻÿ�
    [����]
    1. ����� �Ҽӵ� �μ��� �����μ��� 90���� �μ� 
    2. �����μ��� 90�� ���� �μ��� �� �μ��� ��ձ޿� ���
    3. �����μ��� 90�� ���� �μ��� ���� ����� �޿��� �ڽ��� �μ� ��� �޿��� ����
    
    (�����μ��� 90���� �μ��� ���� ���)
    
    SELECT A.EMPLOYEE_ID,
           AVG(A.SALARY)
           A.EMP_NAME,
           A.DEPARTMENT_ID,
           B.PARENT_ID
      FROM EMPLOYEES A, DEPARTMENTS B
     WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
       AND B. PARENT_ID=90;

SELECT C.SAL
FROM(SELECT A.DEPARTMENT_ID,
               ROUND(AVG(A.SALARY)) AS SAL
     FROM EMPLOYEES A, DEPARTMENTS B
         WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
           AND B. PARENT_ID=90
        GROUP BY A.DEPARTMENT_ID) C

    UPDATE EMPLOYEES D
       SET SALARY = (SELECT C.SAL
                     FROM (SELECT A.DEPARTMENT_ID AS DID,
                                  ROUND(AVG(A.SALARY)) AS SAL
                             FROM EMPLOYEES A, DEPARTMENTS B
                            WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                              AND B.PARENT_ID = 90
                         GROUP BY A.DEPARTMENT_ID) C
    WHERE D.DEPARTMENT_ID = C.DID)

    ORDER BY 1;


SELECT A.EMP_NAME,
       A.DEPARTMENT_ID AS DID,
       A.SALARY
   FROM DEPARTMENTS B, EMPLOYEES A
   WHERE B.PARENT_ID = 90
   AND A.DEPARTMENT_ID = B.DEPARTMENT_ID;
   