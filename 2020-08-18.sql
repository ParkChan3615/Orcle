2020- 08 -18 -01)
2. NVL2
(�������)
NVL2(C,R1,R2)
.C�� ���� NULL�̸� R2�� ��ȯ�ϰ�
NULL�� �ƴϸ� R1�� ���� ��ȯ�Ѵ�.

�� ) ȸ�����̺��� ȸ���� ������ ' ��' ���� ȸ������ ���ϸ����� null�� �ٲ��ּ���

UPDATE MEMBER
 SET MEM_MILEAGE = NULL
WHERE MEM_NAME LIKE '��%';


ROLLBACK
SELECT*FROM MEMBER;





�� ) ȸ�����̺��� ȸ���� ���ϸ����� NULL�� ȸ���� NULL�� �ƴ� ȸ���� �Ǻ��Ͽ�
NULL�� ȸ���� ������'�޸�ȸ��', NULL�� �ƴ� ȸ���� 'Ȱ��ȸ��'�� ����� ����Ͻÿ�.
ALIAS�� ȸ����, ���ϸ���, ���

SELECT MEM_NAME AS ȸ����,
       MEM_MILEAGE AS ���ϸ���,
       NVL2(MEM_MILEAGE,'Ȱ��ȸ��','�޸�ȸ��') AS ���
    FROM MEMBER
    ORDER BY 1;
    
    �� )������̺��� COM MISSION_PCL�� �����Ͽ� NULL�̸� 
    ���� �������� 0�� NULL,�ƴϸ� ������������ %�� ȯ��� ���������� ����Ͻÿ�
    �� , NVL2�� ����� ��
    Alias�� �����, �μ��ڵ� ,��å�ڵ�,���������̸� ���������� ���� ������� ���
    
    
SELECT EMP_NAME AS �����,
       EMPLOYEE_ID AS �μ��ڵ�,
       JOB_ID AS ��å�ڵ�,
       NVL2(COMMISSION_PCT,COMMISSION_PCT*100||'%',0 ||'%'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ) AS ��������
       
    FROM EMPLOYEES
ORDER BY 4 DESC;


    
    
