drop SEQUENCE news_seq;
drop sequence news_reply_seq;

drop table news;
drop table news_reply;

create SEQUENCE news_seq;
create SEQUENCE news_reply_seq;

create table news(
    no number PRIMARY KEY ,
    title varchar2(150) not null,
    article varchar2(4000),
    offerer varchar2(20),
    writedate varchar2(100),
    image_link varchar2(150),
    hit number default 0
);

create table news_reply(
    rno number primary key,
    no REFERENCES news(no) ON DELETE CASCADE,
    content varchar2(1000) not null,
    writer varchar2(20) not null,
    writedate Date default sysdate
);

select * from news;
select * from news_reply;

insert into news (no, title, article, offerer, writedate, image_link, hit) 
values(news_seq.nextval, 'test', 'test1', 'test', sysdate, 'http://asdf.jpg', 0);

commit;

select rno, no, content, writer, writedate from news_reply where no = 292 order by rno desc;