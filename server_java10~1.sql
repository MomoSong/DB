--�Խ��� ����Ʈ���� �з�(�ѱ�)-board1_cate, ��ȣ, ����, �ۼ���
select catename, no, title, writer from board1, board1_cate
where board1_cate.cateno = board1.cateno;

select c.catename, b.no, b.title, b.writer from board1 b, board1_cate c
where c.cateno = b.cateno;

--pk�� �ִ� ������ �����
delete from board1_cate where cateno = 2;
commit;
select * from board1_cate;
select * from board1;

--FK�� ���� null�� ��쵵 join�ؼ� ���� ����. outter join
select catename, no, title, writer from board1 b left outer join board1_cate c
on b.cateno = c.cateno;
