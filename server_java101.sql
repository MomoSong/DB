-- 분류가 속해 있는 게시판과 댓글
-- 게시판 : board1, 게시판 시퀀스:board_seq1, 게시판 분류 테이블:board1_cate
-- 게시판 분류 번호 : 1- 일반, 2-공지, 3-질문답변
-- 게시판 : 분류번호가 포함되어 있어야 한다.
-- 게시판 분류번호를 먼저 입력하고 게시판 내용을 나중에 입력한다.

-- 객체 제거(외래키 먼저 제거후 기본키 제거)
drop table board1_rep;
drop table board1;
drop table board1_cate;

drop SEQUENCE board1_seq;
drop SEQUENCE board1_rep_seq;

--객체 생성(기본키 먼저 생성 후 외래키 생성


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
-- PK에 해당되는 값이 지워지면 null을 셋팅하자
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

-- 샘플데이터 입력 (PK -> FK)
insert into BOARD1_CATE
values(1, '일반');
insert into BOARD1_CATE
values(2, '공지');
insert into BOARD1_CATE
values(3, '질문답변');
commit;

--일반, 공지, 질문답변 게시글
insert into board1(no, title, content, writer, cateno)
values(board1_seq.nextval, '분류 게시판 일반', '분류', '이영환', 1);
insert into board1(no, title, content, writer, cateno)
values(board1_seq.nextval, '분류 게시판 공지', '분류', '관리자', 2);
insert into board1(no, title, content, writer, cateno)
values(board1_seq.nextval, '분류 게시판 질문답변?', '분류', '홍길동', 3);
commit;

-- 댓글 샘플데이터
insert into board1_rep(rno, no, content, writer)
values(board1_rep_seq.nextval, 4, 'test', 'lee');
commit;

select * from board1;

