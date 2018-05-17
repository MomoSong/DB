--게시판 리스트에서 분류(한글)-board1_cate, 번호, 제목, 작성자
select catename, no, title, writer from board1, board1_cate
where board1_cate.cateno = board1.cateno;

select c.catename, b.no, b.title, b.writer from board1 b, board1_cate c
where c.cateno = b.cateno;

--pk에 있는 데이터 지우기
delete from board1_cate where cateno = 2;
commit;
select * from board1_cate;
select * from board1;

--FK의 값이 null인 경우도 join해서 가져 오자. outter join
select catename, no, title, writer from board1 b left outer join board1_cate c
on b.cateno = c.cateno;
