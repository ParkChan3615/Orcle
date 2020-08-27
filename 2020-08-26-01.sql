2020-08-26 -01) 

예) 모든 거래처별 2005년 매입정보를 죄회하시오
출력은 거래처코드 , 거래처명,
SELECT A.BUYER_ID AS 거래처코드,
       A.BUYER_NAME AS 거래처명, 
       B.           AS 매입금액
    FROM BUYER A,(2005년도 매입정보)--서브쿼리 
 WHERE  A.BUYER_ID = B.거래처코드(+)
 ORDER  BY 1;
(서브쿼리) :(2005년도 거래처별 매입정보)
SELECT A.BUYER_ID AS BID,
       SUM(B.BUY_QTY*B.BUY_COST) AS IAMT
  FROM BUYER A, BUYPROD B, PROD C
  WHERE A.BUYER_ID = C.PROD_BUYER
  AND B.BUY_PROD = C.PROD_ID
  AND B.BUY_DATE BETWEEN '20050101'
      AND '20051231'
GROUP BY A.BUYER_ID;

(결합)
SELECT A.BUYER_ID AS 거래처코드,
       A.BUYER_NAME AS 거래처명, 
       B.IAMT AS 매입금액
    FROM BUYER A,
      (SELECT A.BUYER_ID AS BID,
              SUM(B.BUY_QTY*B.BUY_COST) AS IAMT
        FROM BUYER A, BUYPROD B, PROD C
     WHERE A.BUYER_ID = C.PROD_BUYER
                AND B.BUY_PROD = C.PROD_ID
                AND B.BUY_DATE BETWEEN '20050101'
                AND '20051231'
    GROUP BY A.BUYER_ID) B--서브쿼리 
     WHERE  A.BUYER_ID = B.BID(+)
 ORDER  BY 1;
 
    
문제] 2005년도 거래처별 매출금액을 조회하시오
출력은 거래처코드. 거래처명, 매출액 
카트 피알오디 바이어 

SELECT A.BUYER_ID AS 거래처코드,
       A.BUYER_NAME AS 거래처명, 
       NVL(B.OAMT,0) AS 매입금액
    FROM BUYER A,(SELECT C.BUYER_ID AS BID,
            SUM(D.CART_QTY * E.PROD_PRICE) AS OAMT
       FROM BUYER C, CART D, PROD E
      WHERE D.CART_PROD = E.PROD_ID
        AND E.PROD_BUYER = C.BUYER_ID
        AND D.CART_NO LIKE '2005%'
        GROUP BY C.BUYER_ID )B
WHERE A.BUYER_ID=B.BID(+)
ORDER BY 1;

(서브쿼리: 2005년도 거래처별 매출)
  SELECT C.BUYER_ID AS BID,
            SUM(D.CART_QTY * E.PROD_PRICE) AS OAMT
       FROM BUYER C, CART D, PROD E
      WHERE D.CART_PROD = E.PROD_ID
        AND E.PROD_BUYER = C.BUYER_ID
        AND D.CART_NO LIKE '2005%'
        GROUP BY C.BUYER_ID;
