2020-08-14-02 )��¥ �Լ�

1)sysdate, SYSTIMESTAMP
   - �ý����� �����ϴ� ��¥ �Լ� 
   - '+'�� '-' ���갡��
��) SELECT SYSDATE, SYSDATE+7,
        SYSDATE-7, SYSTIMESTAMP
    FROM DUAL;
    
2. ADD_MONTHS 
 (�������)
 ADD_MONTHS(d,n)
 .�־��� ��¥������ d�� ���� n��ŭ�� ���� ���� ��¥�� ��ȯ
 
 ��) ���ú��� 2���� �� 7���� ��¥
 SELECT ADD_MONTHS (SYSDATE, 2)-7
     FROM DUAL;
     
��) ȸ�����̺��� ȸ������ ���Ϲ��ڸ� �������� �Ѵ�. ������ ������ �ִ� ȸ���� ã�� ���� 2������ ���ڸ�
�߼��� �� �ֵ��� ȸ�������� ��ȸ�Ͻÿ�.

ALIAS�� ȸ����ȣ ,ȸ����, �̸����ּ�, �ڵ�����ȣ, ���ڹ߼���

 SELECT MEM_ID AS ȸ����ȣ,
        MEM_NAME AS ȸ����,
        EXTRACT(MONTH FROM MEM_BIR)||'�� '||
            EXTRACT(DAY FROM MEM_BIR)||'��' AS ����,
        MEM_MAIL AS �̸����ּ�,
        MEM_HP AS �ڵ��� ��ȣ,
        TO_DATE('202009'||
TO_CHAR(EXTRACT(DAY FROM MEM_BIR)-2,'00'))
   FROM MEMBER
WHERE EXTRACT(MONTH FROM SYSDATE)+1 =
      EXTRACT(MONTH FROM MEM_BUR);
        