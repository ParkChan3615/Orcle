2020 - 08 - 18 - 02 ) �����Լ�

- �����͸� Ư�� �÷��� �������� ���� ���� ���� �ͳ��� �׷�ȭ��Ű�� �̸� ��������
  ��(sum),���(avg), ���� (���� �� , count), �ִ밪(MAX),�ּҰ�(MIN)�� ���ϴ� �Լ� 
- GROUP BY ���� ���
- �����Լ��� ������ �ο��� ��� HAVING �� ���
- SELECT ���� ����� �׷��Լ��� �ƴ� �Ϲ��÷��� �ݵ�� GROUP BY���� ����Ǿ�� �� -- ���� �� �ϸ� GROUP BY �� ����
- �׷��� ������ GROUP BY �� ����� �÷��� ���� ���� �����
- SUM
(�������)
SUM (column)
. �ش� �÷��� ����� �����͸� �׷캰�� �հ踦 ���Ͽ� ��ȯ

��) ������̺��� �μ��� �޿��հ踦 ���Ͻÿ�.

SELECT DEPARTMENT_ID AS �μ��ڵ�,
SUM(SALARY) AS �հ�
FROM EMPLOYEES
GROUP BY  DEPARTMENT_ID
O BY 1;

�� )��ǰ���̺��� �з��� ������ �հ踦 ���Ͻÿ�
Alias �� ��ǳ�ڵ� , �з��� , �����հ�
SELECT A.PROD_LGU AS �з��ڵ�,
       B.LPROD_NM AS �з���,
       SUM(A.PROD_PRICE) AS �����հ�
    FROM PROD A, LPROD B
WHERE A.PROD_LGU= B.LPROD_GU
GROUP BY A.PROD_LGU,B.LPROD_NM
ORDER BY 1 DESC;


��)ȸ�����̺��� ���� ���ϸ��� �հ踦 ���Ͻÿ�
    Alias�� ����, ���ϸ����հ�
 SELECT CASE WHEN SUBSTR(MEM_REGNO2,1,1)= '1' OR 
                  SUBSTR(MEM_REGNO2,1,1)= '3' THEN
                  '����ȸ��'
    ELSE          '����ȸ��' END AS "Gender",
    sum(MEM_MILEAGE) AS "���ϸ��� �հ�"
    FROM MEMBER
GROUP BY SUBSTR(MEM_REGN02,1,1);
    
    


SELECT A.BUYER_ID AS �ŷ�ó�ڵ�,
       A.BUYER_NAME AS �ŷ�ó��,
       SUM(B.BUY_QTY*C.PROD_COST) AS ���Ծ�
      FROM BUYER A,  BUYPROD B, PROD C
    WHERE A.BUYER_ID = C.PROD_BUYER
    AND B.BUY_PROD=C.PROD_ID
    AND B.BUY_DATE BETWEEN '20050401' AND '20050430'
    GROUP BY A.BUYER_ID, A.BUYER_NAME
    ORDER BY 1;


��)ȸ�����̺��� ���ȸ���� ���ϸ����� �հ踦 ���Ͻÿ�

SELECT SUM(MEM_MILEAGE) AS ���ϸ����հ�

FROM MEMBER
WHERE SUBSTR(MEM_REGN02, 1,1);

���� ] 2005�� 5�� ȸ���� ,��ǰ�� �Ǹż��� �հ踦 ���Ͻÿ�
Alias �� ȸ����ȣ, ��ǰ�ڵ� ,�ǹ������հ�

SELECT CART_MEMBER AS ȸ����ȣ,
       CART_PROD AS ��ǰ�ڵ�,
       SUM(CART_QTY) AS �Ǹż����հ�
    FROM CART
WHERE CART_NO LIKE'200505%'

GROUP BY CART_MEMBER,CART_PROD
ORDER BY 1;

���� ] 2005�� 5�� ȸ���� �Ǹż��� �հ踦
���ϵ� �Ǹż����հ谡 20�� �̻��� ȸ���� ��ȸ
Alias�� ȸ����ȣ, �Ǹż����հ�

SELECT CART_MEMBER AS ȸ����ȣ,
       SUM(CART_QTY) AS �Ǹż����հ�
    FROM CART
WHERE CART_NO LIKE '200505%'
GROUP BY CART_MEMBER
HAVING SUM(CART_QTY)>=20
 ORDER BY 1;
