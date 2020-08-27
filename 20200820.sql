2020-08-20-01)
2. AVG
(�������)
AVG(expr)
-expr�� �÷����̳� ����
- �׷��ε� expr�� ����� ���� ���� ����� ��ȯ

��) ������̺��� �� �μ��� ��� �޿��� ���Ͻÿ�

SELECT DEPARTMENT_ID AS �μ��ڵ�,
       ROUND(AVG(SALARY),1) AS ��ձ޿�
    FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
 ORDER BY 1;

SELECT BUY_PROD AS �����ڵ�,
       ROUND(AVG(BUY_QTY)) AS �� ���Լ���,
       ROUND(AVG(BUY_COST*BUY_QTY)) AS ��ո��Աݾ�
  FROM BUYPROD
WHERE BUY_DATE BETWEEN '20050301' AND '20050331'
GROUP BY BUY_PROD
ORDER BY 1;


����] ȸ�����̺��� 50�� ���� ���ϸ��� ��ո� ���Ͻÿ�.
SELECT  SUBSTR(MEM_REGNO2,1,1) AS ����, 
          ROUND(AVG(MEM_MILEAGE),1) AS ��ո��ϸ���  
FROM MEMBER
WHERE MEM_REGNO1 BETWEEN '620101' AND '711231'
GROUP BY SUBSTR(MEM_REGNO2,1,1) ;


����] ��ٱ��� ���̺��� 2005�� 5�� ȸ���� ��� ������� ���Ͻÿ�.
��, ��ո������ 100������ �̻��� ȸ���� ��ȭ�Ͻÿ�
ALIAS�� ȸ����ȣ, ��ո���

SELECT A.CART_MEMBER AS ȸ����ȣ,
       ROUND(AVG(B.PROD_PRICE*A.CART_QTY)) AS ��ո���
  FROM CART A,PROD B
WHERE CART_NO LIKE '200505%' 
 AND B.PROD_ID = A.CART_PROD
GROUP BY A.CART_MEMBER
HAVING ROUND(AVG(B.PROD_PRICE*A.CART_QTY))>=1000000;


���� ] ������̺��� �μ��� ������� ��� �ټӳ���� ���ϰ� �ټӳ���� ���� ū �μ� 3���� ����Ͻÿ�
SELECT A.DID AS �μ���ȣ,
       B.DEPARTMENT_NAME AS �μ���,
       ROUND(A.AVGCNT) AS ��� �ټӳ��
  FROM DEPARTMENTS B,(SELECT DEPARTMENT_ID AS DID,
                              AVG(EXTRACT(YEAR FROM SYSDATE) - 
                              EXTRACT(YEAR FROM HIRE_DATE)) AS AVGCNT
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID
ORDER BY 2 DESC) A
WHERE A.DID=B.DEPATRMENT_ID 
    AND ROWNUM <= 3;