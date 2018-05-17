-- 검색을 위한 sql
-- java 라는 글자가 포함이 되어 있는 제목, 내용에 데이터 검색(리스트)
-- 현재 자바 10 계정에는 게시판 없음 따라서 쿼리만 저장. (java00으로 로그인 할것.)

select no, title, writer, writedate, hit from board
where title like '%java%' or content like '%java%';