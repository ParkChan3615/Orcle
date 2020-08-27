2020-08-20-01)
2. AVG
(사용형식)
AVG(expr)
-expr은 컬럼명이나 수식
- 그룹핑된 expr에 저장된 값에 대한 평균을 반환

예) 사원테이블에서 각 부서별 평균 급여를 구하시오

SELECT DEPARTMENT_ID AS 부서코드,
       ROUND(AVG(SALARY),1) AS 평균급여
    FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
 ORDER BY 1;

SELECT BUY_PROD AS 제픔코드,
       ROUND(AVG(BUY_QTY)) AS 평군 매입수량,
       ROUND(AVG(BUY_COST*BUY_QTY)) AS 평균매입금액
  FROM BUYPROD
WHERE BUY_DATE BETWEEN '20050301' AND '20050331'
GROUP BY BUY_PROD
ORDER BY 1;


문제] 회원테이블에서 50대 성별 마일리지 평균를 구하시오.
SELECT  SUBSTR(MEM_REGNO2,1,1) AS 성별, 
          ROUND(AVG(MEM_MILEAGE),1) AS 평균마일리지  
FROM MEMBER
WHERE MEM_REGNO1 BETWEEN '620101' AND '711231'
GROUP BY SUBSTR(MEM_REGNO2,1,1) ;


문제] 장바구니 테이블에서 2005년 5월 회원별 평균 매출액을 구하시오.
단, 평균매출액이 100만원이 이상인 회원만 죄화하시오
ALIAS는 회원번호, 평균매출

SELECT A.CART_MEMBER AS 회원번호,
       ROUND(AVG(B.PROD_PRICE*A.CART_QTY)) AS 평균매출
  FROM CART A,PROD B
WHERE CART_NO LIKE '200505%' 
 AND B.PROD_ID = A.CART_PROD
GROUP BY A.CART_MEMBER
HAVING ROUND(AVG(B.PROD_PRICE*A.CART_QTY))>=1000000;


문제 ] 사원테이블에서 부서별 사원들의 평균 근속년수를 구하고 근속년수가 가장 큰 부서 3개만 출력하시오
SELECT A.DID AS 부서번호,
       B.DEPARTMENT_NAME AS 부서명,
       ROUND(A.AVGCNT) AS 평균 근속년수
  FROM DEPARTMENTS B,(SELECT DEPARTMENT_ID AS DID,
                              AVG(EXTRACT(YEAR FROM SYSDATE) - 
                              EXTRACT(YEAR FROM HIRE_DATE)) AS AVGCNT
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID
ORDER BY 2 DESC) A
WHERE A.DID=B.DEPATRMENT_ID 
    AND ROWNUM <= 3;