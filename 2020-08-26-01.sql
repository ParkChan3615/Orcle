2020-08-26 -01) 

��) ��� �ŷ�ó�� 2005�� ���������� ��ȸ�Ͻÿ�
����� �ŷ�ó�ڵ� , �ŷ�ó��,
SELECT A.BUYER_ID AS �ŷ�ó�ڵ�,
       A.BUYER_NAME AS �ŷ�ó��, 
       B.           AS ���Աݾ�
    FROM BUYER A,(2005�⵵ ��������)--�������� 
 WHERE  A.BUYER_ID = B.�ŷ�ó�ڵ�(+)
 ORDER  BY 1;
(��������) :(2005�⵵ �ŷ�ó�� ��������)
SELECT A.BUYER_ID AS BID,
       SUM(B.BUY_QTY*B.BUY_COST) AS IAMT
  FROM BUYER A, BUYPROD B, PROD C
  WHERE A.BUYER_ID = C.PROD_BUYER
  AND B.BUY_PROD = C.PROD_ID
  AND B.BUY_DATE BETWEEN '20050101'
      AND '20051231'
GROUP BY A.BUYER_ID;

(����)
SELECT A.BUYER_ID AS �ŷ�ó�ڵ�,
       A.BUYER_NAME AS �ŷ�ó��, 
       B.IAMT AS ���Աݾ�
    FROM BUYER A,
      (SELECT A.BUYER_ID AS BID,
              SUM(B.BUY_QTY*B.BUY_COST) AS IAMT
        FROM BUYER A, BUYPROD B, PROD C
     WHERE A.BUYER_ID = C.PROD_BUYER
                AND B.BUY_PROD = C.PROD_ID
                AND B.BUY_DATE BETWEEN '20050101'
                AND '20051231'
    GROUP BY A.BUYER_ID) B--�������� 
     WHERE  A.BUYER_ID = B.BID(+)
 ORDER  BY 1;
 
    
����] 2005�⵵ �ŷ�ó�� ����ݾ��� ��ȸ�Ͻÿ�
����� �ŷ�ó�ڵ�. �ŷ�ó��, ����� 
īƮ �Ǿ˿��� ���̾� 

SELECT A.BUYER_ID AS �ŷ�ó�ڵ�,
       A.BUYER_NAME AS �ŷ�ó��, 
       NVL(B.OAMT,0) AS ���Աݾ�
    FROM BUYER A,(SELECT C.BUYER_ID AS BID,
            SUM(D.CART_QTY * E.PROD_PRICE) AS OAMT
       FROM BUYER C, CART D, PROD E
      WHERE D.CART_PROD = E.PROD_ID
        AND E.PROD_BUYER = C.BUYER_ID
        AND D.CART_NO LIKE '2005%'
        GROUP BY C.BUYER_ID )B
WHERE A.BUYER_ID=B.BID(+)
ORDER BY 1;

(��������: 2005�⵵ �ŷ�ó�� ����)
  SELECT C.BUYER_ID AS BID,
            SUM(D.CART_QTY * E.PROD_PRICE) AS OAMT
       FROM BUYER C, CART D, PROD E
      WHERE D.CART_PROD = E.PROD_ID
        AND E.PROD_BUYER = C.BUYER_ID
        AND D.CART_NO LIKE '2005%'
        GROUP BY C.BUYER_ID;
