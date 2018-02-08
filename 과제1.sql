--1.공지사항에서 "빅데이터"가 들어가 있는 글을 검색
--2.오늘 작성한 글을 검색하세요
--3.현재 진행 중인 공지 중에서 "과정"이 들어있는 글을 검색하세요.
--4.글번호 중에서 3개를 정해서 검색해 온다.
--5.지난 공지 삭제 하시오.

SELECT * FROM notice;

--1.공지사항에서 "빅데이터"가 들어가 있는 글을 검색
SELECT title, content FROM notice WHERE title LIKE '%빅데이터%' OR content LIKE '%빅데이터%';

--2.오늘 작성한 글을 검색하세요.
SELECT * FROM notice WHERE writedate LIKE sysdate;

--3.현재 진행 중인 공지 중에서 "과정"이 들어있는 글을 검색하세요.
SELECT title, content, writedate, startdate, enddate FROM notice 
WHERE (writedate >= startdate AND writedate <= enddate) AND (content LIKE '%과정%' OR title LIKE '%과정%');

--4.글번호 중에서 3개를 정해서 검색해 온다.
SELECT notice_no, title, content, writedate FROM notice WHERE notice_no = 2 OR notice_no = 3 OR notice_no = 4;

--5.지난 공지 삭제 하시오.
DELETE FROM notice WHERE sysdate > enddate;
ROLLBACK;