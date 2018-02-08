-- 자유 게시판에 대한 테이블 작업
--0. 테이블 삭제
drop table board;
drop sequence board_seq;

--1. 테이블 작성(생성)
-- 게시판 테이블
create table board(
no number primary key,
title varchar2(150) not null,
writer varchar2(15) not null,
content varchar2(600) not null,
writedate date default sysdate,
hit number default 0
);

--2. sequence 생성
-- 계속 값을 증가시키는 시퀸스(sequence)를 생성하여 글번호에 적용시키기
create sequence board_seq;

--3. 작성된 board table에 샘플데이터 입력
----- 게시판 샘플데이터
insert into board(no,title,writer,content)
values(board_seq.nextval,'java', '이영환', 'java 쉽게 배우기');

insert into board(no,title,writer,content)
values(board_seq.nextval,'java','이영환','java는 DB부터');

insert into board(no,title,writer,content)
values(board_seq.nextval,'sqldeveloper','양승민','설치와 실행');
-- 오라클에 완전 적용 / 취소는 rollback
commit;

--4. 입력데이터 확인
----- 게시판 글확인
select no,title,content,writer,writedate,hit from board;


--5. 게시판 기본 쿼리
-- list:
select no,title,writer,writedate, hit from board order by no desc;
-- view: 2번글 보기
select no, title, content, writer, writedate, hit from board where no=2;
---- write:
insert into board(no, title, content, writer) values(board_seq.nextval, 'java', 'javajjang', 'lee');
---- update: 2번글 수정
update board set title='oracle', content='oracle jjang', writer='hong' where no = 2;
---- delete: 2번글 삭제
delete from board where no = 2 ;

commit;

