2020 - 08 -20 JOIN
-RDB �� �ٽ� ���
-��ȸ�� �÷��� ���� ���� ���̺��� �л�Ǿ�
���� �� ��� ���̺� ������ ����(Realationship)�� �̿��Ͽ� �˻��� �� ���

-�Ϲ� join�� ansi join���� ����
1. Cartesian Product
    -��� ����� ������ ����� ��ȯ 
    (ex A ���̺��� 100�� 20��, B���̺��� 2000�� 10���� �����Ǿ��ٸ� A, B���̺��� Cartesian Product ����� 200000��, 30���� ��� ��ȯ)
    -���������� ���� ���, ���������� �߸� ����� ���
    
    ��) 1 cart ���̺��� ���� ��
    select COUNT(*) FROM CART;
    
    MEMBER ���̺� ���� ��
SELECT COUNT(*) FROM MEMBER;

3. CART�� MEMBER ���̺��� CARTESIAN PRODUCT
�����Ű��
SELECT COUNT(*)
FROM MEMBER, CART;

2. Equi-JOIN
    - ���� ���ǿ� '=' �����ڸ� ����ϴ� ���� ����
    - ���� ������ ���� ���̺��� ������ n-1�� �̻��̾�� �Ѵ�.
    - ���� �����̶���� �Ѵ�
    - ��ġ���� �ʴ� ������(��) ����
    - ANSI ���Ŀ����� INNER JOIN�̶�� ��
    (�������- �Ϲ� JOIN)
 SELECT �÷� LIST
  FROM ���̺� ��[��Ī],���̺���[��Ī[......
  WHERE ��������1
  [AND ��������2
  [AND �Ϲ����� ......]
  
  ��) ������̺����� ��������� ��ȸ�Ͻÿ�
  Alias�� �����ȣ, �����, �μ��ڵ� , �μ���
  
  