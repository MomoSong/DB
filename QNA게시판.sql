drop table qna;
drop sequence qna_seq;

create table qna(
no number primary key, 
title varchar2(300) not null,
content varchar2(1000) not null,
writer varchar2(30) not null,
writedate date default sysdate, -- 입력이 들어오지 않으면 기본 값으로 오늘 날짜(sysdate)를 입력
hit number default 0, -- 입력이 들어오지 않으면 기본 값으로 0을 입력
-- 질문답변형에 필요한 컬럼. refNo:관련글, ordNo:글순서, levNo:들여쓰기
refNo number, --처음 질문한 글번호:관련글:1차정렬
ordNo number, --순서번호 : 2차정렬
levNo number,
-- 중간 답변글 밑으로 해당되는 글을 자동 삭제(on delete cascade)하기 위한 컬럼
parentNo number references qna(no) on delete cascade
);

create sequence qna_seq;