--공지사항
--객체 제거
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

--샘플 데이터 입력
--진행공지
insert into notice(notice_no, title, content) 
values(notice_seq.nextval, 'Test', 'Test');

insert into notice(notice_no, title, content, startdate, enddate) 
values(notice_seq.nextval, '회식', '식사한끼', 
to_date('2018-02-07', 'yyyy-mm-dd'), to_date('2018-02-23', 'yyyy-mm-dd'));

insert into notice(notice_no, title, content) 
values(notice_seq.nextval, '과정소개', '빅데이터 과정');

insert into notice(notice_no, title, content) 
values(notice_seq.nextval, '홈페이지 오픈', '빅데이터 과정');

insert into notice(notice_no, title, content) 
values(notice_seq.nextval, '빅데이터 소개', '수집, 분석, 처리');

insert into notice(notice_no, title, content) 
values(notice_seq.nextval, '오라클', '데이터 관리');

insert into notice(notice_no, title, content, startdate, enddate) 
values(notice_seq.nextval, '교재지급', '자바, 오라클', 
to_date('2018-01-31', 'yyyy-mm-dd'), to_date('2018-02-05', 'yyyy-mm-dd'));

COMMIT;

--지난공지
insert into notice(notice_no, title, content, startdate, enddate) 
values(notice_seq.nextval, '교재지급', '자바, 오라클', 
to_date('2018-01-31', 'yyyy-mm-dd'), to_date('2018-02-05', 'yyyy-mm-dd'));

--예약공지
insert into notice(notice_no, title, content, startdate, enddate) 
values(notice_seq.nextval, '오라클 평가', 'DDL, DML, DCL', 
to_date('2018-02-19', 'yyyy-mm-dd'), to_date('2018-02-23', 'yyyy-mm-dd'));

commit;

--현재 진행되는 공지
select * from notice where startdate <= sysdate and enddate+1 >= sysdate;
SELECT * FROM notice;




