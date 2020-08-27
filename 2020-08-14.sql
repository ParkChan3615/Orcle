2020 - 08 -14 -01)

4. LTRIM RTRIM TRIM
- 무효의 공백을 제거하는 함수
- LTRIM은 왼쪽에 존재하는 무효의 공백제거
- RTRIM은 오른쪽에 존재하는 무효의 공백제거
- TRIM은 양쪽에 존재하는 무효의 공백제거
(사용형식)
LTRIM(c set) RTRIM (c (,set) , TRIM(C)
- 주어진 문자열 C에서 SET으로 지정된 문자열을 왼쪽(LTRIM), 
  오른쪽(RTRIM) 찾아 제거
  .SET이 생략되면 SET은 공백을 의미함
  
예) 거래처 테이블의 거래처명의 데이터 타입을 CHAR(40)으로 변경 하시오.

 ALTER TABLE BUYER
   MODIFY BUYER_NAME CHAR (40)

COMMIT;


7. INSTR 
(사용형식)
 INSTR(c,substr,pos[,occur])
 . 문자열 c 에서 synstr 문자열을 찾아 그 문장열의 위치 값을 반환
 . occur는 반복 횟수 정의
 . pos는 시작 위치값으로 default 값이다.
 
 예)
 select instr('무궁화 꽃 피었을까? 무궁화 꽃은 우리나라 꽃입니다','꽃',6,2)
  from dual;
  
7. LENGTH, LENGTHB
(사용형식)
LENGTH(c), LENGTHB(C)
.문자열 C의 길이 또는 byte 수를 반환
