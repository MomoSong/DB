-- �з��� ���� �ִ� �Խ��ǰ� ���
-- �Խ��� : board1, �Խ��� ������:board_seq1, �Խ��� �з� ���̺�:board1_cate
-- �Խ��� �з� ��ȣ : 1- �Ϲ�, 2-����, 3-�����亯
-- �Խ��� : �з���ȣ�� ���ԵǾ� �־�� �Ѵ�.
-- �Խ��� �з���ȣ�� ���� �Է��ϰ� �Խ��� ������ ���߿� �Է��Ѵ�.

-- ��ü ����(�ܷ�Ű ���� ������ �⺻Ű ����)
drop table board1_rep;
drop table board1;
drop table board1_cate;

drop SEQUENCE board1_seq;
drop SEQUENCE board1_rep_seq;

--��ü ����(�⺻Ű ���� ���� �� �ܷ�Ű ����


create table board1_cate(
cateno number(1) primary key,
catename varchar2(12) not null
);

create table board1(
no number primary key, 
title varchar2(300) not null, 
content varchar2(2000) not null,
writer varchar2(30) not null,
writedate date default sysdate,
hit number default 0,
-- PK�� �ش�Ǵ� ���� �������� null�� ��������
cateno number(1) default 1 REFERENCES board1_cate(cateno) on delete set null
);

create table board1_rep(
rno number primary key,
no number references board1(no) on delete cascade not null,
content varchar2(1000) not null,
writer varchar2(30) not null,
writedate date default sysdate
);

create SEQUENCE board1_seq;
create SEQUENCE board1_rep_seq;

-- ���õ����� �Է� (PK -> FK)
insert into BOARD1_CATE
values(1, '�Ϲ�');
insert into BOARD1_CATE
values(2, '����');
insert into BOARD1_CATE
values(3, '�����亯');
commit;

--�Ϲ�, ����, �����亯 �Խñ�
insert into board1(no, title, content, writer, cateno)
values(board1_seq.nextval, '�з� �Խ��� �Ϲ�', '�з�', '�̿�ȯ', 1);
insert into board1(no, title, content, writer, cateno)
values(board1_seq.nextval, '�з� �Խ��� ����', '�з�', '������', 2);
insert into board1(no, title, content, writer, cateno)
values(board1_seq.nextval, '�з� �Խ��� �����亯?', '�з�', 'ȫ�浿', 3);
commit;

-- ��� ���õ�����
insert into board1_rep(rno, no, content, writer)
values(board1_rep_seq.nextval, 4, 'test', 'lee');
commit;

select * from board1;

