2020 -08 - 12 -01_
3. Like ������
    -���Ϻ� ����
    -'%'�� ;'_' ���ϵ�ī����  
    - % : ���� ��ġ ������ ��� ���ڿ��� ����
 ex_ '��%' ->'��'���� ���۵Ǵ� ��� ���ڿ��� ����
  - '_' ;���� ��ġ���� �ѱ��ڿ� ����
 ex) 'ȫ_��' -> ù ���ڰ� 'ȫ'�̰� 3���ڷ� �����ǰ�.
 ������ ���ڰ� '��'�� ���ڿ��� ���� 
 
 ��) ȸ�����̺��� �������� ' ����' �� ȸ���� ��ȸ�Ͻÿ�
 Alias�� ȸ����ȣ, ȸ����, ���� ,�ּ�,���ϸ���
 �ּҴ� ���ּұ��� ��� �Ͻÿ�.
 
    SELECT MEN_ID AS ȸ����ȣ,
           MEN_NAME AS ȸ����,
           CASE WHEN SUBSTR(MEN_REGNO2,1,1)='1' THEN 
           '����ȸ��'
             ELSE '����ȸ��' END AS ����,
             MEM_ADD1||' '||MEM_ADD2 AS �ּ�,
             MEM_MILEAGE AS ���ϸ���
  FROM MEMBER
 WHERE MEM_ADD1 LIKE '����%';
 
 ���� 1] �������̺�(BUYPROD)���� 2005�� 5~6�� �� ������ ������ǰ (P102)���� ��Ȳ�� ��ȸ�Ͻÿ�.
 ALIAS�� ��¥, ��ǰ�ڵ�, ����, �ܰ�,�ݾ��̴�.
 
  SELECT BUY_DATE AS ��¥,
         BUY_PROD AS ��ǰ�ڵ�,
         BUY_QTY  AS ����,
         BUY_COST AS �ܰ�,
         BUY_COST*BUY_QTY AS �ݾ�
   FROM BUYPROD
 WHERE BUY_PROD LIKE 'P102%'
  AND BUY_DATE >= '20050501'
  AND BUY_DATE <= '20050630'
ORDER BY 3 DESC,1 DESC; --BUY_QTY DESC;


4. BETWEEN ~AND
 -������ �����Ͽ� ���ϴ� ��� ���
 -AND(��������)�� ����Ͽ� ��� ���� 
 - ���ڿ�, ����, ��¥ Ÿ�� ��ο� ���� ����
 
   
   SELECT BUY_DATE AS ��¥,
         BUY_PROD AS ��ǰ�ڵ�,
         BUY_QTY  AS ����,
         BUY_COST AS �ܰ�,
         BUY_COST*BUY_QTY AS �ݾ�
   FROM BUYPROD
 WHERE BUY_DATE BETWEEN  AND BUY_DATE >= '20050501'  AND BUY_DATE <= '20050630'
  AND BUY_PROD LIKE'P102%'
ORDER BY 3 DESC,1 DESC; --BUY_QTY DESC;


    
    

 
  ������̺��� �޿��� 5000~12000 ������ ��������� ��ȸ�Ͻÿ�
 Alias �� �����ȣ, �����, �޿�, �����ڵ�
 
     SELECT EMPLOYEE_ID AS �����ȣ,
         EMP_NAME    AS �����,
         SALARY      AS �޿�,
         JOB_ID      AS �����ڵ�
    FROM EMPLOYEES 
    WHERE SALARY BETWEEN 5000 AND 12000;
         
 
 
         
         
 
 

 