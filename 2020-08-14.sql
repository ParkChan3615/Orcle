2020 - 08 -14 -01)

4. LTRIM RTRIM TRIM
- ��ȿ�� ������ �����ϴ� �Լ�
- LTRIM�� ���ʿ� �����ϴ� ��ȿ�� ��������
- RTRIM�� �����ʿ� �����ϴ� ��ȿ�� ��������
- TRIM�� ���ʿ� �����ϴ� ��ȿ�� ��������
(�������)
LTRIM(c set) RTRIM (c (,set) , TRIM(C)
- �־��� ���ڿ� C���� SET���� ������ ���ڿ��� ����(LTRIM), 
  ������(RTRIM) ã�� ����
  .SET�� �����Ǹ� SET�� ������ �ǹ���
  
��) �ŷ�ó ���̺��� �ŷ�ó���� ������ Ÿ���� CHAR(40)���� ���� �Ͻÿ�.

 ALTER TABLE BUYER
   MODIFY BUYER_NAME CHAR (40)

COMMIT;


7. INSTR 
(�������)
 INSTR(c,substr,pos[,occur])
 . ���ڿ� c ���� synstr ���ڿ��� ã�� �� ���忭�� ��ġ ���� ��ȯ
 . occur�� �ݺ� Ƚ�� ����
 . pos�� ���� ��ġ������ default ���̴�.
 
 ��)
 select instr('����ȭ �� �Ǿ�����? ����ȭ ���� �츮���� ���Դϴ�','��',6,2)
  from dual;
  
7. LENGTH, LENGTHB
(�������)
LENGTH(c), LENGTHB(C)
.���ڿ� C�� ���� �Ǵ� byte ���� ��ȯ
