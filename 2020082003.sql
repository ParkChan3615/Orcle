2020 - 08 -20 JOIN
-RDB 의 핵심 기능
-조회할 컬럼이 여러 개의 테이블에 분산되어
저장 된 경우 테이블 사이의 관계(Realationship)을 이용하여 검색할 때 사용

-일반 join과 ansi join으로 구분
1. Cartesian Product
    -모든 행들의 조합을 결과로 반환 
    (ex A 테이블이 100행 20열, B테이블이 2000행 10열로 구성되었다면 A, B테이블의 Cartesian Product 결과는 200000행, 30열로 결과 반환)
    -조인조건이 없는 경우, 조인조건이 잘못 기술한 경우
    
    예) 1 cart 테이블의 행의 수
    select COUNT(*) FROM CART;
    
    MEMBER 테이블 행의 수
SELECT COUNT(*) FROM MEMBER;

3. CART와 MEMBER 테이블에 CARTESIAN PRODUCT
수행시키면
SELECT COUNT(*)
FROM MEMBER, CART;

2. Equi-JOIN
    - 조인 조건에 '=' 연산자를 사용하는 조인 형식
    - 조인 조건은 사용된 테이블의 갯수가 n-1개 이상이어야 한다.
    - 내부 조인이라고도 한다
    - 일치하지 않는 데이터(행) 무시
    - ANSI 형식에서는 INNER JOIN이라고 함
    (사용형식- 일반 JOIN)
 SELECT 컬럼 LIST
  FROM 테이블 명[별칭],테이블명[별칭[......
  WHERE 조인조건1
  [AND 조인조건2
  [AND 일반조건 ......]
  
  예) 사원테이블에서 사원정보를 조회하시오
  Alias는 사원번호, 사원명, 부서코드 , 부서명
  
  
