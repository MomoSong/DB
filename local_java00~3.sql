DROP TABLE info_board;
DROP SEQUENCE info_seq;

CREATE SEQUENCE info_seq;

CREATE TABLE info_board (
    no number(6),
    title varchar2(20),
    writer varchar2(10),
    content varchar2(50),
    writedate date default sysdate,
    hit number(6) default 0
);
DESC info_board;
SELECT * FROM info_board;

RENAME info_board TO my_board;
DESC my_board;

RENAME my_board TO info_board;
DESC info_board;

ALTER TABLE info_board RENAME COLUMN content to information;
DESC info_board;

INSERT INTO info_board(no, title, writer, information) 
VALUES(info_seq.nextval, 'This is Test', 'Hong', '테스트 네네 테스트');

INSERT INTO info_board(no, title, writer, information)
VALUES(info_seq.nextval, 'John"s comment', 'John', 'This is the AWERSOME program!');

INSERT INTO info_board(no, title, writer, information) 
VALUES(info_seq.nextval, 'The greeting', 'Mike', 'Hello DBMS!');

SELECT * FROM info_board;

SELECT no, writer, information, writedate, hit FROM info_board;

DELETE info_board where no = 3;

UPDATE info_board SET title = 'Hey guys', writer = 'noob', 
information = 'im gonna kill my self'
where no = 1;

SELECT * FROM info_board;

DELETE info_board where no = 3;




