2020-08-26-02)���տ�����
 - �������� SELECT���� �����Ͽ� �ϳ��� ���������� ����� ������ ����
 - UNION, UNION ALL , INTERSECT,MINUS
 (�������)
 . ���տ����ڷ� ����Ǵ� �� SELECT ���� SELECT���� ���Ǵ� �÷��� ������ 
   DATA TYPE�� ��ġ�ؾ��Ѵ�
 . ORDER BY���� �� ������ SELECT�������� ��� �����ϴ�
 . BLOB,CLOB,BFILEŸ���� �÷��� ���Ͽ� ���� ������ ����� ����
 . UNION ,INTERSECT, MIMUS�����ڴ� LONG�� �÷����� ���� �� ����.
 . ��µǴ� �÷��� ù ���� SELECT�� �����̴�.
 
 
 ��) ȸ�����̺��� ������ �ڿ����̰� �Ǵ� ���ϸ����� 4000�̻��� ȸ���� ȸ����ȣ,
 ȸ����, ����, ���ϸ����� ��ȸ
 SELECT MEM_ID AS ȸ����ȣ,
        MEM_NAME AS ȸ����,
        MEM_JOB AS ����,
        MEM_MILEAGE AS ���ϸ���
  FROM MEMBER
WHERE MEM_JOB = '�ڿ���'
 
 
 ��) �������̺� �������̺��� 2005�� 5�� ��ǰ�� ���Լ����� ��������� ��ȸ�Ͻÿ�.
 Alias�� ��ǰ�ڵ�, ��ǰ��, ����/�������
 (���տ����� �����ϴ� ���)
SELECT C.PROD_ID AS ��ǰ�ڵ�,
C.PROD_NAME AS ��ǰ��,
B.BAMT AS ����,
A.CAMT AS �������
  FROM (SELECT CART_PROD AS CID,
       SUM(CART_QTY) AS CAMT
       FROM CART
       WHERE CART_NO LIKE '200505%'
      GROUP BY CART_PROD) A,
       (SELECT BUY_PROD AS BID,
      SUM(BUY_QTY) AS BAMT
    FROM BUYPROD
WHERE BUY_DATE BETWEEN '20050501' AND '20050531'
GROUP BY BUY_PROD) B,
       PROD C
WHERE A.CID  = B.BID(+)
AND C.PROD_ID = A.CID
ORDER BY 1;

(�������� : ��ǰ�� �������)
SELECT CART_PROD AS CID,
       SUM(CART_QTY) AS CAMT
    FROM CART
 WHERE CART_NO LIKE '200505%'
 GROUP BY CART_PROD;
 
(�������� : ��ǰ�� ���Լ���)
SELECT BUY_PROD AS BID,
      SUM(BUY_QTY) AS BAMT
    FROM BUYPROD
WHERE BUY_DATE BETWEEN '20050501' AND '20050531'
GROUP BY BUY_PROD;

(���տ����� �����ϴ� ���)
SELECT CART_PROD AS ��ǰ�ڵ�, 
       PROD_NAME AS ��ǰ��,
       SUM(CART_QTY) AS �������
 FROM CART,PROD
WHERE CART_PROD= PROD_ID
     AND CART_NO LIKE '200505%'
    GROUP BY CART_PROD,PROD_NAME;
    
UNION
SELECT BUY_PROD AS ��ǰ�ڵ�, 
       PROD_NAME AS ��ǰ��, 
       SUM(BUY_QTY) AS ���Լ���
  FROM BUYPROD, PROD
 WHERE PROD_ID = BUY_PROD
   AND BUY_DATE BETWEEN '20050501'
       AND '20050531'
 GROUP BY BUY_PROD,PROD_NAME
 ORDER BY 1;