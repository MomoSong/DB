
CREATE SEQUENCE board_seq;



DROP TABLE board CASCADE CONSTRAINTS PURGE;



CREATE TABLE board
(
	no                    NUMBER  NOT NULL ,
	title                 VARCHAR2(300)  NOT NULL ,
	content               VARCHAR2(1000)  NOT NULL ,
	writer                VARCHAR2(30)  NULL ,
	writedate             DATE   DEFAULT  sysdate NULL ,
	hit                   NUMBER   DEFAULT  0 NULL 
);



CREATE UNIQUE INDEX XPK게시판 ON board
(no  ASC);



ALTER TABLE board
	ADD CONSTRAINT  XPK게시판 PRIMARY KEY (no);


