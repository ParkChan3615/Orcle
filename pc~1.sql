2020 -08 - 12 -02)�Լ� (FUNCTION)

1. �����Լ�
 1)ABS
 - �Ű������� ���� ���� ���� ���밪�� ��ȯ
 (�������)
    ABS(n)
    
    
    
    
��)
    SELECT ABS(100), ABS(-100), ABS('-20')
    FROM DUAL;
    
    
    2.CEIL �� FLOOR
    - CEIL : �־��� �Ű������� ���ų� ���� ū ������ ��ȯ
    (�������)
    CEIL(n)
    ex) SELECT CEIL(10),CEIL(10.67),
               CEIL(-10.67)
          FROM DUAL;
          
    -FLOOR : �־��� �Ű������� ���ų� �����ʿ��� ���� ���� ������ ��ȯ
    (�������)
    FLOORO(n)
    ex) SELECT FLOOR(10),FLOOR(10.67),
               FLOOR(-10.67),FLOOR(-10.23)
          FROM DUAL;
          
     3)ROUND�� TRUNC
     (�������)
     ROUND (N.I)
     .�־��� �� n�� i�� ����� ��� �Ҽ��� ���� i+1��° �ڸ����� �ݿø��Ͽ�
     i��° �ڸ����� ��ȯ 
     
     .i�� �����Ǹ� 0���� ����
     .i�� �����̸� �����κ��� i��° �ڸ����� �ݿø� 
     
     
�� )������̺��� �޿��� �����̰� �Ŵޱ޿���
13���� ���� ���� �����Ѵٰ��Ҷ� �μ���ȣ 50�� �μ��� �������� �Ѵ�
�޿����� ����Ͻÿ�.

SELECT EMPLOYEE_ID AS �����ȣ,
       EMP_NAME AS �����,
       SALARY AS ����,
       TO_CHAR(ROUND(SALARY/13,-1),'9,999.0') AS ���޿���
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID = 50;
 
 

2)
  �� )) 
 SELECT TRUNC(12345.9999.-2),
        TRUNC(12345.9999.2),
        TRUNC(12345.9999.0),
        TRUNC(12345.9999)
    
    FROM DUAL;
    
4. POWER�� SORT
   - �ŵ������ ��ݱ��� ���� ��ȯ
   1)POWER(n1,n2)
   .n1�� n2�� �ŵ������� ��� ��ȯ
��)
SELECT POWER(2,10) FROM DUAL;

 2)SQRT(n)
 .n�� ������ ���� ��ȯ
 SELECT ROUND(SQRT(23),3) FROM DUAL;
 
 5. MOD�� REMAINDER
 - ������ ���� ��ȯ
 (�������) 
  MOD(n2,n1), REMAINDER(n2,n1)
  .n2�� n1���� ���� ������
  .MOD�� REMAINDER�� ����ó�� ����� �ٸ���
  MOD : n2 -n1 * FLOOR(n2/n1)
  REMAINDER :  n2 -n1 * ROUND(n2/n1) 
  
  �� )  MOD (15,4) ; 15 - 4 *FLOOR(15/4)
                     15 - 4 *FLOOR(3.25)
                     15 - 12 => 3
  �� ) REMAINDER (18,7) : 15 - 4 *ROUND(15/4)
                          15 - 4 *ROUND(3.25)
                          15- 12 = > -1
                          
SELECT MOD (13,4), REMAINDER(13,4),
       MOD (15,4), REMAINDER(15,7),
       REMAINDER(13,4),
       REMAINDER(18,7)
    FROM DUAL;
    


                     