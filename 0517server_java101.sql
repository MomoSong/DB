-- �˻��� ���� sql
-- java ��� ���ڰ� ������ �Ǿ� �ִ� ����, ���뿡 ������ �˻�(����Ʈ)
-- ���� �ڹ� 10 �������� �Խ��� ���� ���� ������ ����. (java00���� �α��� �Ұ�.)

select no, title, writer, writedate, hit from board
where title like '%java%' or content like '%java%';