2020-08-21-02) SEMI ����
  - ���������� ���������� ����Ͽ� ���������� �����ϴ� �����͸� ������������ �����ϴ� ����
  - EXISTS �����ڰ� ����
  
��) ������̺��� �޿��� 8000�̻��� ����� �ִ� �μ��� ��ȸ�Ͻÿ�
Alias�� �μ��ڵ�, �μ���, �����μ��ڵ�

SELECT  A.DEPARTMENT_ID AS �μ��ڵ�, 
        A.DEPARTMENT_NAME AS �μ���, 
        A.PARENT_ID AS �����μ��ڵ�
    FROM  DEPARTMENTS A
  WHERE DEPARTMENT_ID IN(SELECT B.DEPARTMENT_ID
                         FROM EMPLOYEES B
                       WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
                       AND B.SALARY>10000)
  ORDER BY 1;