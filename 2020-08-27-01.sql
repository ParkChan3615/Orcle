2020-08 27 01)

2.UNION ALL
 -교차되는 부분(중복)의 모든자료를 반환
 예) 회원테이블에서 거주지가 '대전'이거나 여성 회원으로 마일리지가 2000이상인 회원
 List는 회원이름, 주소 , 성별, 마일리지
 
    
    SELECT MEM_NAME AS 회원이름, 
           MEM_ADD1||' '||MEM_ADD2 AS 주소,
           CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '1'
           THEN '남성회원'
           ELSE '여성회원' END  AS 성별,
           MEM_MILEAGE AS 마일리지
      FROM MEMBER
     WHERE MEM_ADD1 LIKE '대전%' 
UNION ALL

     SELECT MEM_NAME AS 회원이름, 
           MEM_ADD1||' '||MEM_ADD2 AS 주소,
           CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '1'
           THEN '남성회원'
           ELSE '여성회원' END  AS 성별,
           MEM_MILEAGE AS 마일리지
      FROM MEMBER
     WHERE SUBSTR(MEM_REGNO2,1,1) = '2'
     UNION ALL
         SELECT MEM_NAME AS 회원이름, 
           MEM_ADD1||' '||MEM_ADD2 AS 주소,
           CASE WHEN SUBSTR(MEM_REGNO2,1,1) = '1'
           THEN '남성회원'
           ELSE '여성회원' END  AS 성별,
           MEM_MILEAGE AS 마일리지
      FROM MEMBER
      WHERE MEM_MILEAGE >= 2000
      ORDER BY 1;
     
     
     
3. INTERSECT
 -복수갸의 쿼리 결과 중 교차(중복)되는 부분만 반환시키는 집합연산자
 
 예) 장바구니테이블에서 4월과 6월에 모두 판매된 상품을 조회
 Alias는 상품코드, 상품명
 (4월 자료)
 SELECT DISTINCT A.CART_PROD AS 상품코드, 
        B.PROD_NAME AS 상품명
  FROM CART A, PROD B
WHERE A.CART_PROD=B.PROD_ID
  AND A.CART_NO LIKE '200504%'
  AND EXISTS
  (SELECT 1
  FROM CART C
WHERE C.CART_PROD=A.CART_PROD
  AND C.CART_NO LIKE '200506%');

  4.MINUS
  - 복수개 쿼리 결과의 차집합을 반환하는
    집합연산자
    
예) 매입테이블에서 2월에 입고된 상품이 4월에는 입고되지 않은 상품을 조회하시오
출력은 상품코드와 상품명이다.
(2월 입고된 상품)
SELECT A.BUY_PROD AS 상품코드,
       B.PROD_NAME AS 상품명
  FROM BUYPROD A, PROD B
WHERE A.BUY_PROD = B.PROD_ID
  AND A.BUY_DATE BETWEEN '20050201'
  AND '20050228'

MINUS

 SELECT A.BUY_PROD AS 상품코드,
       B.PROD_NAME AS 상품명
  FROM BUYPROD A, PROD B
WHERE A.BUY_PROD = B.PROD_ID
  AND A.BUY_DATE BETWEEN '20050401'
  AND '20050430'
  ORDER BY 1;