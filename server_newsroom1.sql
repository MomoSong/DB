drop table nadoboard;
drop SEQUENCE nadoboard_seq;
commit;
create table nadoboard(
    no number primary key,
    title VARCHAR2(4000),
    content CLOB,
    writer VARCHAR2(4000),
    writedate DATE DEFAULT SYSDATE,
    hit number DEFAULT 0
);

create sequence nadoboard_seq;

delete from nadoboard;
insert into nadoboard(no,title,writer,content)
values(nadoboard_seq.nextval,'java', '이영환', 'java 쉽게 배우기');

commit;

select no, title, content, writer, writedate, hit from nadoboard;

UPDATE nadoboard set hit = hit + 1 where no = 2;
