drop table qna;
drop sequence qna_seq;

create table qna(
no number primary key, 
title varchar2(300) not null,
content varchar2(1000) not null,
writer varchar2(30) not null,
writedate date default sysdate, -- �Է��� ������ ������ �⺻ ������ ���� ��¥(sysdate)�� �Է�
hit number default 0, -- �Է��� ������ ������ �⺻ ������ 0�� �Է�
-- �����亯���� �ʿ��� �÷�. refNo:���ñ�, ordNo:�ۼ���, levNo:�鿩����
refNo number, --ó�� ������ �۹�ȣ:���ñ�:1������
ordNo number, --������ȣ : 2������
levNo number,
-- �߰� �亯�� ������ �ش�Ǵ� ���� �ڵ� ����(on delete cascade)�ϱ� ���� �÷�
parentNo number references qna(no) on delete cascade
);

create sequence qna_seq;