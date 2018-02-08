--1.�������׿��� "������"�� �� �ִ� ���� �˻�
--2.���� �ۼ��� ���� �˻��ϼ���
--3.���� ���� ���� ���� �߿��� "����"�� ����ִ� ���� �˻��ϼ���.
--4.�۹�ȣ �߿��� 3���� ���ؼ� �˻��� �´�.
--5.���� ���� ���� �Ͻÿ�.

SELECT * FROM notice;

--1.�������׿��� "������"�� �� �ִ� ���� �˻�
SELECT title, content FROM notice WHERE title LIKE '%������%' OR content LIKE '%������%';

--2.���� �ۼ��� ���� �˻��ϼ���.
SELECT * FROM notice WHERE writedate LIKE sysdate;

--3.���� ���� ���� ���� �߿��� "����"�� ����ִ� ���� �˻��ϼ���.
SELECT title, content, writedate, startdate, enddate FROM notice 
WHERE (writedate >= startdate AND writedate <= enddate) AND (content LIKE '%����%' OR title LIKE '%����%');

--4.�۹�ȣ �߿��� 3���� ���ؼ� �˻��� �´�.
SELECT notice_no, title, content, writedate FROM notice WHERE notice_no = 2 OR notice_no = 3 OR notice_no = 4;

--5.���� ���� ���� �Ͻÿ�.
DELETE FROM notice WHERE sysdate > enddate;
ROLLBACK;