2020-08 27 01)

2.UNION ALL
 -�����Ǵ� �κ�(�ߺ�)�� ����ڷḦ ��ȯ
 ��) ȸ�����̺��� �������� '����'�̰ų� ���� ȸ������ ���ϸ����� 2000�̻��� ȸ��
 List�� ȸ���̸�, �ּ� , ����, ���ϸ���
 
    
    SELECT MEM_NAME AS ȸ���̸�, 
           MEM_ADD1||' '||MEM_ADD2 AS �ּ�,
           CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '1'
           THEN '����ȸ��'
           ELSE '����ȸ��' END  AS ����,
           MEM_MILEAGE AS ���ϸ���
      FROM MEMBER
     WHERE MEM_ADD1 LIKE '����%' 
UNION ALL

     SELECT MEM_NAME AS ȸ���̸�, 
           MEM_ADD1||' '||MEM_ADD2 AS �ּ�,
           CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '1'
           THEN '����ȸ��'
           ELSE '����ȸ��' END  AS ����,
           MEM_MILEAGE AS ���ϸ���
      FROM MEMBER
     WHERE SUBSTR(MEM_REGNO2,1,1) = '2'
     UNION ALL
         SELECT MEM_NAME AS ȸ���̸�, 
           MEM_ADD1||' '||MEM_ADD2 AS �ּ�,
           CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '1'
           THEN '����ȸ��'
           ELSE '����ȸ��' END  AS ����,
           MEM_MILEAGE AS ���ϸ���
      FROM MEMBER
      WHERE MEM_MILEAGE >= 2000
      ORDER BY 1;
     
     
     
3. INTERSECT
 -�������� ���� ��� �� ����(�ߺ�)�Ǵ� �κи� ��ȯ��Ű�� ���տ�����
 
 ��) ��ٱ������̺��� 4���� 6���� ��� �Ǹŵ� ��ǰ�� ��ȸ
 Alias�� ��ǰ�ڵ�, ��ǰ��
 (4�� �ڷ�)
 SELECT DISTINCT A.CART_PROD AS ��ǰ�ڵ�, 
        B.PROD_NAME AS ��ǰ��
  FROM CART A, PROD B
WHERE A.CART_PROD=B.PROD_ID
  AND A.CART_NO LIKE '200504%'
  AND EXISTS
  (SELECT 1
  FROM CART C
WHERE C.CART_PROD=A.CART_PROD
  AND C.CART_NO LIKE '200506%');

  4.MINUS
  - ������ ���� ����� �������� ��ȯ�ϴ�
    ���տ�����
    
��) �������̺��� 2���� �԰�� ��ǰ�� 4������ �԰���� ���� ��ǰ�� ��ȸ�Ͻÿ�
����� ��ǰ�ڵ�� ��ǰ���̴�.
(2�� �԰�� ��ǰ)
SELECT A.BUY_PROD AS ��ǰ�ڵ�,
       B.PROD_NAME AS ��ǰ��
  FROM BUYPROD A, PROD B
WHERE A.BUY_PROD = B.PROD_ID
  AND A.BUY_DATE BETWEEN '20050201'
  AND '20050228'

MINUS

 SELECT A.BUY_PROD AS ��ǰ�ڵ�,
       B.PROD_NAME AS ��ǰ��
  FROM BUYPROD A, PROD B
WHERE A.BUY_PROD = B.PROD_ID
  AND A.BUY_DATE BETWEEN '20050401'
  AND '20050430'
  ORDER BY 1;