2020 - 08 - 18 - 02 ) 집계함수

- 데이터를 특정 컬럼을 기준으로 같은 값을 갖는 것끼리 그룹화시키고 이를 기준으로
  합(sum),평균(avg), 갯수 (행의 수 , count), 최대값(MAX),최소값(MIN)을 구하는 함수 
- GROUP BY 절이 사용
- 집계함수에 조건이 부여될 경우 HAVING 절 사용
- SELECT 절에 기술된 그룹함수가 아닌 일반컬럼은 반드시 GROUP BY절에 기술되어야 함 -- 뭐뭐 별 하면 GROUP BY 절 생각
- 그룹핑 순서는 GROUP BY 절 기술된 컬럼중 왼쪽 부터 적용됨
- SUM
(사용형식)
SUM (column)
. 해당 컬럼에 저장된 데이터를 그룹별로 합계를 구하여 반환

예) 사원테이블에서 부서별 급여합계를 구하시오.

SELECT DEPARTMENT_ID AS 부서코드,
SUM(SALARY) AS 합계
FROM EMPLOYEES
GROUP BY  DEPARTMENT_ID
O BY 1;

예 )상품테이블에서 분류별 가격의 합계를 구하시오
Alias 는 삼풍코드 , 분류명 , 가격합계
SELECT A.PROD_LGU AS 분류코드,
       B.LPROD_NM AS 분류명,
       SUM(A.PROD_PRICE) AS 가격합계
    FROM PROD A, LPROD B
WHERE A.PROD_LGU= B.LPROD_GU
GROUP BY A.PROD_LGU,B.LPROD_NM
ORDER BY 1 DESC;


예)회원테이블에서 성별 마일리지 합계를 구하시오
    Alias는 성별, 마일리지합계
 SELECT CASE WHEN SUBSTR(MEM_REGNO2,1,1)= '1' OR 
                  SUBSTR(MEM_REGNO2,1,1)= '3' THEN
                  '남성회원'
    ELSE          '여성회원' END AS "Gender",
    sum(MEM_MILEAGE) AS "마일리지 합계"
    FROM MEMBER
GROUP BY SUBSTR(MEM_REGN02,1,1);
    
    


SELECT A.BUYER_ID AS 거래처코드,
       A.BUYER_NAME AS 거래처명,
       SUM(B.BUY_QTY*C.PROD_COST) AS 매입액
      FROM BUYER A,  BUYPROD B, PROD C
    WHERE A.BUYER_ID = C.PROD_BUYER
    AND B.BUY_PROD=C.PROD_ID
    AND B.BUY_DATE BETWEEN '20050401' AND '20050430'
    GROUP BY A.BUYER_ID, A.BUYER_NAME
    ORDER BY 1;


예)회원테이블에서 모든회원의 마일리지의 합계를 구하시오

SELECT SUM(MEM_MILEAGE) AS 마일리지합계

FROM MEMBER
WHERE SUBSTR(MEM_REGN02, 1,1);

문제 ] 2005년 5월 회원별 ,상품별 판매수량 합계를 구하시오
Alias 는 회원번호, 상품코드 ,판무수량합계

SELECT CART_MEMBER AS 회원번호,
       CART_PROD AS 상품코드,
       SUM(CART_QTY) AS 판매수량합계
    FROM CART
WHERE CART_NO LIKE'200505%'

GROUP BY CART_MEMBER,CART_PROD
ORDER BY 1;

문제 ] 2005년 5월 회원별 판매수량 합계를
구하되 판매수량합계가 20개 이상인 회원만 조회
Alias는 회원번호, 판매수량합계

SELECT CART_MEMBER AS 회원번호,
       SUM(CART_QTY) AS 판매수량합계
    FROM CART
WHERE CART_NO LIKE '200505%'
GROUP BY CART_MEMBER
HAVING SUM(CART_QTY)>=20
 ORDER BY 1;
