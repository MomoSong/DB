--��������
--��ü ����
drop table notice;
drop sequence notice_seq;

create table notice(
    notice_no number CONSTRAINT notice_nno_pk primary key,
    title varchar2(150) not null,
    content varchar2(600) not null,
    writedate date default sysdate,
    startdate date default sysdate,
    enddate date default sysdate + 30
);

create sequence notice_seq;

--���� ������ �Է�
--�������
insert into notice(notice_no, title, content) 
values(notice_seq.nextval, 'Test', 'Test');

insert into notice(notice_no, title, content, startdate, enddate) 
values(notice_seq.nextval, 'ȸ��', '�Ļ��ѳ�', 
to_date('2018-02-07', 'yyyy-mm-dd'), to_date('2018-02-23', 'yyyy-mm-dd'));

insert into notice(notice_no, title, content) 
values(notice_seq.nextval, '�����Ұ�', '������ ����');

insert into notice(notice_no, title, content) 
values(notice_seq.nextval, 'Ȩ������ ����', '������ ����');

insert into notice(notice_no, title, content) 
values(notice_seq.nextval, '������ �Ұ�', '����, �м�, ó��');

insert into notice(notice_no, title, content) 
values(notice_seq.nextval, '����Ŭ', '������ ����');

insert into notice(notice_no, title, content, startdate, enddate) 
values(notice_seq.nextval, '��������', '�ڹ�, ����Ŭ', 
to_date('2018-01-31', 'yyyy-mm-dd'), to_date('2018-02-05', 'yyyy-mm-dd'));

COMMIT;

--��������
insert into notice(notice_no, title, content, startdate, enddate) 
values(notice_seq.nextval, '��������', '�ڹ�, ����Ŭ', 
to_date('2018-01-31', 'yyyy-mm-dd'), to_date('2018-02-05', 'yyyy-mm-dd'));

--�������
insert into notice(notice_no, title, content, startdate, enddate) 
values(notice_seq.nextval, '����Ŭ ��', 'DDL, DML, DCL', 
to_date('2018-02-19', 'yyyy-mm-dd'), to_date('2018-02-23', 'yyyy-mm-dd'));

commit;

--���� ����Ǵ� ����
select * from notice where startdate <= sysdate and enddate+1 >= sysdate;
SELECT * FROM notice;




