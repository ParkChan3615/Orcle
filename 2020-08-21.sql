2020 - 08 - 21 01)
��)�������̺��� 2005�� 5�� �ŷ�ó��
������Ȳ�� ��ȸ�Ͻÿ�
Alias�� �ŷ�ó �ڵ�, �ŷ�ó��, ���Աݾ��հ�    
(�Ϲݺ���)
SELECT B.BUYER_ID AS �ŷ�ó�ڵ�,
               B.BUYER_NAME AS �ŷ�ó��,
               SUM(A.BUY_QTY*A.BUY_COST) AS ���Աݾ��հ�
          FROM BUYPROD A, BUYER B, PROD C
         WHERE BUY_DATE BETWEEN TO_DATE('20050301') 
               AND TO_DATE('20050331')
               AND A.BUY_PROD = C.PROD_ID
               AND C.PROD_BUYER = B.BUYER_ID
      GROUP BY B.BUYER_ID, B.BUYER_NAME
      ORDER BY 1;
     


SELECT B.BUYER_ID AS �ŷ�ó�ڵ�,
               B.BUYER_NAME AS �ŷ�ó��,
               SUM(A.BUY_QTY*A.BUY_COST) AS ���Աݾ��հ�
          FROM BUYPROD A
    INNER JOIN PROD C ON(A.BUY_PROD=C.PROD_ID)
    INNER JOIN BUYER B ON(C.PROD_BUYER=B.BUYER_ID)
         WHERE BUY_DATE BETWEEN TO_DATE('20050501') 
               AND TO_DATE('20050531')
      GROUP BY B.BUYER_ID, B.BUYER_NAME
      ORDER BY 1;

��) 2005�� 5�� ��ǰ�� ����/���� ������ ��ȸ�Ͻÿ�
Alias�� ��ǰ�ڵ�, ��ǰ��, ���Լ���, �������
SELECT C.PROD_ID AS ��ǰ�ڵ�, 
       C.PROD_NAME AS ��ǰ��,
       SUM(A.BUY_QTY) AS ���Լ���,
       SUM(B.CART_QTY)AS �������
    FROM BUYPROD A,CART B,PROD C
    WHERE A.BUY_PROD = C.PROD_ID
    AND C.PROD_ID = B.CART_PROD
    AND B.CART_NO LIKE '200505%'
    OR A.BUY_DATE BETWEEN TO_DATE('20050501')  AND TO_DATE('20050531')
    GROUP BY  C.PROD_ID,C.PROD_NAME
    ORDER BY 1;

** SELECT BUY_PROD,
          SUM(BUY_QTY)
     FROM BUYPROD
     WHERE BUY_DATE BETWEEN TO_DATE('20050501') AND TO_DATE('20050531')
     GROUP BY BUY_PROD
     ORDER BY 1;
     
** SELECT CART_PROD,
          SUM(CART_QTY)
    FROM CART
   WHERE CART_NO LIKE '200505%'
   GROUP BY CART_PROD
   ORDER BY 1;
   
   
   
SELECT A.PROD_ID AS ��ǰ�ڵ�,
        A.PROD_NAME AS ��ǰ��,
        NVL(B.INAMT,0) AS ���Լ���,
        NVL(C.OUTAMT,0) AS �������
   FROM PROD A,
        (SELECT BUY_PROD AS BID, -- ��Ī�� ���� �� ����Ʈ���� ��� ����
                SUM(BUY_QTY) AS INAMT
           FROM BUYPROD
          WHERE BUY_DATE BETWEEN '20050501' AND '20050531'
          GROUP BY BUY_PROD) B,
        (SELECT CART_PROD AS CID, -- ��Ī�� ���� �� ����Ʈ���� ��� ����
                SUM(CART_QTY) AS OUTAMT
           FROM CART
          WHERE CART_NO LIKE '200505%'
          GROUP BY CART_PROD) C
   WHERE A.PROD_ID=B.BID(+)
     AND A.PROD_ID=C.CID(+)
   ORDER BY 1;