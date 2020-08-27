2020 -08 - 12 -02)함수 (FUNCTION)

1. 숫자함수
 1)ABS
 - 매개변수로 전달 받은 값의 절대값을 반환
 (사용형식)
    ABS(n)
    
    
    
    
예)
    SELECT ABS(100), ABS(-100), ABS('-20')
    FROM DUAL;
    
    
    2.CEIL 과 FLOOR
    - CEIL : 주어진 매개변수와 같거나 가장 큰 정수를 반환
    (사용형식)
    CEIL(n)
    ex) SELECT CEIL(10),CEIL(10.67),
               CEIL(-10.67)
          FROM DUAL;
          
    -FLOOR : 주어진 매개변수와 같거나 작은쪽에서 가장 작은 정수를 반환
    (사용형식)
    FLOORO(n)
    ex) SELECT FLOOR(10),FLOOR(10.67),
               FLOOR(-10.67),FLOOR(-10.23)
          FROM DUAL;
          
     3)ROUND와 TRUNC
     (사용형식)
     ROUND (N.I)
     .주어진 수 n을 i가 양수인 경우 소숫점 이하 i+1번째 자리에서 반올림하여
     i번째 자리까지 반환 
     
     .i가 생략되면 0으로 간주
     .i가 음수이면 정수부분의 i번째 자리에서 반올림 
     
     
예 )사원테이블의 급여가 연봉이고 매달급여가
13으로 나눈 값을 지급한다고할때 부서번호 50번 부서의 직원들의 한달
급여액을 계산하시오.

SELECT EMPLOYEE_ID AS 사원번호,
       EMP_NAME AS 사원명,
       SALARY AS 연봉,
       TO_CHAR(ROUND(SALARY/13,-1),'9,999.0') AS 월급여액
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID = 50;
 
 

2)
  예 )) 
 SELECT TRUNC(12345.9999.-2),
        TRUNC(12345.9999.2),
        TRUNC(12345.9999.0),
        TRUNC(12345.9999)
    
    FROM DUAL;
    
4. POWER와 SORT
   - 거듭제곡값과 평반근의 값을 반환
   1)POWER(n1,n2)
   .n1을 n2번 거듭제곱한 결과 반환
예)
SELECT POWER(2,10) FROM DUAL;

 2)SQRT(n)
 .n의 평방근의 값을 반환
 SELECT ROUND(SQRT(23),3) FROM DUAL;
 
 5. MOD와 REMAINDER
 - 나머지 값을 반환
 (사용형식) 
  MOD(n2,n1), REMAINDER(n2,n1)
  .n2를 n1으로 나눔 나머지
  .MOD와 REMAINDER는 내부처리 방식이 다르다
  MOD : n2 -n1 * FLOOR(n2/n1)
  REMAINDER :  n2 -n1 * ROUND(n2/n1) 
  
  예 )  MOD (15,4) ; 15 - 4 *FLOOR(15/4)
                     15 - 4 *FLOOR(3.25)
                     15 - 12 => 3
  예 ) REMAINDER (18,7) : 15 - 4 *ROUND(15/4)
                          15 - 4 *ROUND(3.25)
                          15- 12 = > -1
                          
SELECT MOD (13,4), REMAINDER(13,4),
       MOD (15,4), REMAINDER(15,7),
       REMAINDER(13,4),
       REMAINDER(18,7)
    FROM DUAL;
    


                     