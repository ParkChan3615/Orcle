2020-08-26-02)집합연산자
 - 여러개의 SELECT문을 연결하여 하나의 쿼리문으로 만드는 역할을 수행
 - UNION, UNION ALL , INTERSECT,MINUS
 (제약사항)
 . 집합연산자로 연결되는 각 SELECT 문의 SELECT절에 사용되는 컬럼의 갯수와 
   DATA TYPE은 일치해야한다
 . ORDER BY절은 맨 마지막 SELECT문에서만 사용 가능하다
 . BLOB,CLOB,BFILE타입의 컬럼에 대하여 집합 연산자 사용이 금지
 . UNION ,INTERSECT, MIMUS연산자는 LONG형 컬럼에는 사용될 수 없다.
 . 출력되는 컬럼은 첫 번쨰 SELECT문 기준이다.
 
 
 예) 회원테이블에서 직업이 자영업이고 또는 마일리지가 4000이상인 회원의 회원번호,
 회원명, 직업, 마일리지를 조회
 SELECT MEM_ID AS 회원번호,
        MEM_NAME AS 회원명,
        MEM_JOB AS 직업,
        MEM_MILEAGE AS 마일리지
  FROM MEMBER
WHERE MEM_JOB = '자영업'
 
 
 예) 매입테이블 매출테이블에서 2005년 5월 제품별 매입수량과 매출수량을 조회하시오.
 Alias는 제품코드, 제품명, 매입/매출수량
 (집합연산자 사용안하는 경우)
SELECT C.PROD_ID AS 제품코드,
C.PROD_NAME AS 제품명,
B.BAMT AS 매입,
A.CAMT AS 매출수량
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

(서브쿼리 : 제품별 매출수량)
SELECT CART_PROD AS CID,
       SUM(CART_QTY) AS CAMT
    FROM CART
 WHERE CART_NO LIKE '200505%'
 GROUP BY CART_PROD;
 
(서브쿼리 : 제품별 매입수량)
SELECT BUY_PROD AS BID,
      SUM(BUY_QTY) AS BAMT
    FROM BUYPROD
WHERE BUY_DATE BETWEEN '20050501' AND '20050531'
GROUP BY BUY_PROD;

(집합연산자 사용안하는 경우)
SELECT CART_PROD AS 제품코드, 
       PROD_NAME AS 제품명,
       SUM(CART_QTY) AS 매출수량
 FROM CART,PROD
WHERE CART_PROD= PROD_ID
     AND CART_NO LIKE '200505%'
    GROUP BY CART_PROD,PROD_NAME;
    
UNION
SELECT BUY_PROD AS 제품코드, 
       PROD_NAME AS 제품명, 
       SUM(BUY_QTY) AS 매입수량
  FROM BUYPROD, PROD
 WHERE PROD_ID = BUY_PROD
   AND BUY_DATE BETWEEN '20050501'
       AND '20050531'
 GROUP BY BUY_PROD,PROD_NAME
 ORDER BY 1;