2020-08-21-02) SEMI 조인
  - 세미조인은 서브쿼리를 사용하여 서브쿼리에 존재하는 데이터만 메인쿼리에서 추출하는 조인
  - EXISTS 연산자가 사용됨
  
예) 사원테이블에서 급여가 8000이상인 사원이 있는 부서를 조회하시오
Alias는 부서코드, 부서명, 상위부서코드

SELECT  A.DEPARTMENT_ID AS 부서코드, 
        A.DEPARTMENT_NAME AS 부서명, 
        A.PARENT_ID AS 상위부서코드
    FROM  DEPARTMENTS A
  WHERE DEPARTMENT_ID IN(SELECT B.DEPARTMENT_ID
                         FROM EMPLOYEES B
                       WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                       AND B.SALARY>10000)
  ORDER BY 1;