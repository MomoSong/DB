-- ���� �Խ��ǿ� ���� ���̺� �۾�
--0. ���̺� ����
drop table board;
drop sequence board_seq;

--1. ���̺� �ۼ�(����)
-- �Խ��� ���̺�
create table board(
no number primary key,
title varchar2(150) not null,
writer varchar2(15) not null,
content varchar2(600) not null,
writedate date default sysdate,
hit number default 0
);

--2. sequence ����
-- ��� ���� ������Ű�� ������(sequence)�� �����Ͽ� �۹�ȣ�� �����Ű��
create sequence board_seq;

--3. �ۼ��� board table�� ���õ����� �Է�
----- �Խ��� ���õ�����
insert into board(no,title,writer,content)
values(board_seq.nextval,'java', '�̿�ȯ', 'java ���� ����');

insert into board(no,title,writer,content)
values(board_seq.nextval,'java','�̿�ȯ','java�� DB����');

insert into board(no,title,writer,content)
values(board_seq.nextval,'sqldeveloper','��¹�','��ġ�� ����');
-- ����Ŭ�� ���� ���� / ��Ҵ� rollback
commit;

--4. �Էµ����� Ȯ��
----- �Խ��� ��Ȯ��
select no,title,content,writer,writedate,hit from board;


--5. �Խ��� �⺻ ����
-- list:
select no,title,writer,writedate, hit from board order by no desc;
-- view: 2���� ����
select no, title, content, writer, writedate, hit from board where no=2;
---- write:
insert into board(no, title, content, writer) values(board_seq.nextval, 'java', 'javajjang', 'lee');
---- update: 2���� ����
update board set title='oracle', content='oracle jjang', writer='hong' where no = 2;
---- delete: 2���� ����
delete from board where no = 2 ;

commit;

