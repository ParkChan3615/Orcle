3. COUNT
(사용형식)
COUNT (*|expr)
. 쿼리의 결과 내의 행의수를 반환
. 외부조인에서는 expr를 사용해야함 (*를 사용하면 '0'이 '1'로 반환
예) 사원테이블에서 부서별 사원수를 조회하시오
select A.DEPARTMENT_ID AS 부서코드,
       B.DEPARTMENT_NAME AS 부서이름,
       COUNT(*) AS 사원수
 FROM EMPLOYEES A, DEPARTMENTS B
 WHERE A.DEPARTMENT_ID= B.DEPARTMENT_ID
GROUP BY A.DEPARTMENT_ID,B.DEPARTMENT_NAME
ORDER BY 1;


예)회원테이블에서 직업별 회원수와
마일리지 합계및 평균 마일리지를 조히화시오.
SELECT MEM_JOB AS 직업,
COUNT(*) AS 회원수,
SUM(MEM)MILEAGE) AS "마일리지 합계",
ROUND (AVG(MEM_MILEAGE)) AS 평균마일리지
 FROM MEMBER
GROUP BY MEM_JOB;

예) 사원테이블에서 전체직원들의 평균급여 보다 급여가 많은
직원수를 부서별로 조회하시오
(평균급여를 출력하지 않는 경우)
SELECT DEPARTMENT_ID AS 부서번호,
       COUNT(*) AS 사원수
    FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY)
                 FROM EMPLOYEES)
GROUP BY DEPARTMENT_ID
ORDER BY 1;


SELECT DEPARTMENT_ID 
FROM DEPARTMENTS;

SELECT B.DEPARTMENT_ID AS 부서코드,
       B.DEPARTMENT_NAME AS 부서명,
       COUNT(*) AS 인원수
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID (+) = B.DEPARTMENT_ID
GROUP BY B.DEPARTMENT_ID,B.DEPARTMENT_NAME
ORDER BY 1;


문제] 사원테이블에서 현재 재직중인 사원수를 부서별로 조히화시오
(퇴직처리)
SELECT DEPARTMENT_ID AS 사원코드,
        COUNT(*) AS 사원수
FROM EMPLOYEES
WHERE RETIRE_DATE IS NULL
GROUP BY DEPARTMENT_ID
ORDER BY 1;
    
    
4. MIN과 MAX
(사용형식)
MIN(expr), MAX(expr)
.주어진 컬럼이나 수식의 값중 최소(MIN)또는 최대(MAX)값을 찾아 반환

MAX예) 오늘이 2005년 7월 28일이라고 가정하여 장바구니 번호를 생성하시오
SELECT TO_CHAR(SYSDATE,'YYYYMMDD')
 || TO_CHAR(TO_NUMBER(SUBSTR(MAX(CHAR_NO),9)))+1
FROM CART;


        SELECT 'P101'
                ||TRIM(TO_CHAR(TO_NUMBER(SUBSTR
                (MAX(PROD_ID),5))+1,'000000'))
      FROM PROD
      WHERE PROD_LGU = 'P101';
      
예) 회원테이블에서 마일리지가 1000미만인 회원을 찾아 마일리지를 1000으로 조정하시오

SELECT MEM_ID AS 회원번호,
       MEM_NAME AS 회원이름,
GREATEST(MEM_MILEAGE,1000) AS 마일리지
FROM MEMBER;
       
UPDATE MEMBER
     SET MEM_MILEAGE =700
     WHERE MEM_NAME LIKE '이%';
     
1. ROLLUP
.기본 집계함수에서 제공하지 않는 부부별 소계를 제공
.GROUP BY 절에 사용
(사용형식)
ROLLUP(C1, C2,......)
. 명시된 컬럼(C1, C2.....)의 수와 순서( 오른쪽-> 왼쪽) 에 따라 레벨별 집계결과 반환
.사용된 컬럼의 수가 n개이면 n+1레벨까지
(하위레벨에서 상위레벨 순으로 집계반환

SELECT PERIOD,
    SUM(LOAN_JAN_AMT)
    FROM KOR_LOAN_STATUS
GROUP BY ROLLUP(PERIOD,REGION)
ORDER BY 2;

2. CUBE
    - ROLLUP과 비슷한 개념
    - CUBE는 기술된 모든 컬럼을 조합할 수 있는 모든 가지수 만큼의 합계를 반환
    - n개의 컬럼이 사용되면 2의 n승 종류 만크의 합계 반환 
    
    
    예) 대출잔액 테이블에서 기간별, 지역별, 구분별, 대출잔액합계를 조회하시오
(기본 집계 함수)
SELECT PERIOD,
            REGION,
            GUBUN,
            SUM(LOAN_JAN_AMT)
FROM KOR_LOAN_STATUS
GROUP BY  PERIOD, REGION,  GUBUN;