2020 - 08 -25 -01) 서브쿼리
FROM -> WHERE -> SELECT 실행 순서 
독립적 실행이 가능해야한다.

-SQL문장 안에서 보조로 사용되는 또 다른 쿼리-
- ()안에 기술
- 분류
    1) 연관성 여부에 따라
    .연관성 없는 서브쿼리, 연관성 있는 서브쿼리
    2 형태에 따라
    .일반 서브쿼리 (SELECT 절)
    .인라인 서브쿼리 (FROM 절)
    .중첩 서브쿼리 (WHERE 절)
    3)반환 값의 갯수에 따라 
    . 단일행 / 단일열, 단일행/단중열, 다중행/단일열,
1.연관성 없는 서브쿼리
- 메인쿼리와 서브쿼리에 사용된 테이블이 조인으로 연결되지 않은 서브쿼리

예) 회원 테이블에서 평균마일리지보다 많은 마일리지를 보유한 회원의 
회원번호, 회원명, 직업, 마일리지를 조회하시오
(1)메인쿼리: 회원테이블에서 회원의 회원번호 , 회원명 ,
          : 직업, 마일리지를 출력

SELECT MEM_ID AS 회원번호,
       MEM_NAME AS 회원명,
       MEM_JOB AS 직업,
       MEM_MILEAGE AS 마일리지
    FROM MEMBER,(SELECT AVG(MEM_MILEAGE) AS AMILE
                            FROM MEMBER) A

WHERE MEM_MILEAGE > A.AMILE;
(2) 서브쿼라 : 평균 마일리지
SELECT AVG(MEM_MILEAGE)
 FROM MEMBER;
 예) 부서테이블에서 상위부서코드가 NULL인 부서에 소속된 사원수를 조회하시오

 (메인 쿼리 : 사원테이블에서 사원수를 조회)
 
 SELECT COUNT(*) AS 사원수
   FROM EMPLOYEES
   WHERE DEPARTMENT_ID = (상위부서코드가 NULL인 부서코드)
   
 (서브 쿼리 : 상위부서코드가 NULL인 부서코드를 찾는 것)
 
 SELECT DEPARTMENT_ID
   FROM DEPARTMENTS 
   WHERE PARENT_ID IS NULL;
   
   --결합
   
   SELECT COUNT(*) AS 사원수
   FROM EMPLOYEES
   WHERE DEPARTMENT_ID IN
            (SELECT DEPARTMENT_ID
                FROM DEPARTMENTS 
                WHERE PARENT_ID IS NOT NULL);
                
 
 예)부서테이블에서 상위부서코드가 null인 부서에 소속된 사원수를 조회하시오
 메인쿼리 : 사원테이블에서 사원수를 조회
 
 SELECT COUNT(*) AS 사원수
   FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE PARENT_ID IS NULL);
(결함)
SELECT DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE PARENT_ID IS NULL;
    
    
2.연관성 있는 서브쿼리
-매인쿼리와 서브쿼리에 사용된 테이블이 조인으로 연결된 서브쿼리

예) 각 부서의 평균급여를 계산하고 각 부서에서 자기 부서의 평균급여보다 많은
급여를 지급 받는 직원있는 부서코드와 부서명을 출력

select A.DEPARTMENT_ID AS 부서코드,
       A.DEPARTMENT_NAME AS 부서명,
    FROM DEPARTMENTS A
WHERE A.DEPARTMENT_ID IN (SELECT B.DEPARTMENT_ID
FROM EMPLOYEES B 
WHERE B.SALARY > (SELECT C.DEPARTMENT_ID, 
       ROUND(AVG(C.SALARY))
       FROM EMPLOYEES C
    GROUP BY C.DEPARTMENT_ID));

(서브쿼리) : 자기 부서의 평균급여보다 많은 급여를 지급 받는
직원있는 부서의 부서코드
SELECT B.DEPARTMENT_ID
FROM EMPLOYEES B 
WHERE B.SALARY > (SELECT C.DEPARTMENT_ID, 
       ROUND(AVG(C.SALARY))
       FROM EMPLOYEES C
    GROUP BY C.DEPARTMENT_ID));

(서브쿼리 OF 서브쿼리 :자기 부서의 평균급여)
SELECT C.DEPARTMENT_ID, 
       ROUND(AVG(C.SALARY))
       FROM EMPLOYEES C
    GROUP BY C.DEPARTMENT_ID;

예 ) 장바구니테이블에서 회원별 최고구매수량을 가진 자료의
회원번호, 장바구니번호, 상품번호, 구매수량을 조회하시오

매인쿼리 : 장바구니 테이블에서 회원별 회원번호,
장바구니번호, 상품번호 구매수량
SELECT A.CART_MEMVER AS 회원번호,
       A.CART_NO AS 장바구니번호, 
       A.CART_PROD AS 상품번호,
       A.CART_QTY AS 구매수량
   FROM CART A
 WHERE A.CART_QTY = (서브쿼리:회원별최대구매수량)
 
 (회원별최대구매수량) =
 SELECT MAX(B.CART_QTY)
  FROM CART B
WHERE A.CART_MEMBER= B.CART_MEMBER


SELECT A.CART_MEMBER AS 회원번호,
       A.CART_NO AS 장바구니번호, 
       A.CART_PROD AS 상품번호,
       A.CART_QTY AS 구매수량
   FROM CART A
 WHERE A.CART_QTY = 
 (SELECT MAX(B.CART_QTY)
   FROM CART B
 WHERE A.CART_MEMBER= B.CART_MEMBER)
ORDER BY 1;
    
    
    
 예) 사원테이블의 사원급여를 아래 조건대로 변경(update)하시오
    [조건]
    1. 사원이 소속된 부서의 상위부서가 90번인 부서 
    2. 상위부서가 90에 속한 부서의 각 부서의 평균급여 계산
    3. 상위부서가 90에 속한 부서에 속한 사원의 급여를 자신의 부서 평균 급여로 변경
    
    (상위부서가 90번인 부서에 속한 사원)
    
    SELECT A.EMPLOYEE_ID,
           AVG(A.SALARY)
           A.EMP_NAME,
           A.DEPARTMENT_ID,
           B.PARENT_ID
      FROM EMPLOYEES A, DEPARTMENTS B
     WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
       AND B. PARENT_ID=90;

SELECT C.SAL
FROM(SELECT A.DEPARTMENT_ID,
               ROUND(AVG(A.SALARY)) AS SAL
     FROM EMPLOYEES A, DEPARTMENTS B
         WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
           AND B. PARENT_ID=90
        GROUP BY A.DEPARTMENT_ID) C

    UPDATE EMPLOYEES D
       SET SALARY = (SELECT C.SAL
                     FROM (SELECT A.DEPARTMENT_ID AS DID,
                                  ROUND(AVG(A.SALARY)) AS SAL
                             FROM EMPLOYEES A, DEPARTMENTS B
                            WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                              AND B.PARENT_ID = 90
                         GROUP BY A.DEPARTMENT_ID) C
    WHERE D.DEPARTMENT_ID = C.DID)

    ORDER BY 1;


SELECT A.EMP_NAME,
       A.DEPARTMENT_ID AS DID,
       A.SALARY
   FROM DEPARTMENTS B, EMPLOYEES A
   WHERE B.PARENT_ID = 90
   AND A.DEPARTMENT_ID = B.DEPARTMENT_ID;
   