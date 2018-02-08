DESC student;
SELECT studno, name, deptno1, 1 FROM student;
SELECT profno, name, deptno, 2 FROM professor;

--UNION, UNION All 
SELECT studno, name, deptno1, 1 FROM student
UNION 
SELECT profno, name, deptno, 2 FROM professor;

SELECT * FROM student;

CREATE TABLE member1(
    id VARCHAR2(10) PRIMARY KEY, 
    name VARCHAR2(15) NOT NULL,
    tel VARCHAR2(13) 
);

CREATE TABLE star1(
    id VARCHAR2(10) PRIMARY KEY, 
    name VARCHAR2(15) NOT NULL,
    tel VARCHAR2(13) 
);

INSERT INTO member1 VALUES('admin', 'ÀÌ¿µÈ¯', '010-6324-5873');
INSERT INTO member1 VALUES('test', '±è¿¬¾Æ', '010-1111-1111');
INSERT INTO member1 VALUES('jjang', '¼ÕÈï¹Î', '010-2222-2222');
INSERT INTO member1 VALUES('java', 'È«±æµ¿', '010-3333-3333');
INSERT INTO member1 VALUES('team', '±Ç¼ºÃ¶', '010-4444-4444');
COMMIT;

INSERT INTO star1 VALUES('test', '±è¿¬¾Æ', '010-1111-1111');
INSERT INTO star1 VALUES('jjang', '¼ÕÈï¹Î', '010-2222-2222');
INSERT INTO star1 values('tennis', 'Á¤Çö', '010-7777-7777');
INSERT INTO star1 values('dabin', 'ÃÖ´Ùºó', '010-8888-8888');
COMMIT;

--µÎ Å×ÀÌºí¿¡ ÀÖ´Â »ç¶÷ÀÇ ÀÌ¸§À» Ãâ·Â
SELECT name FROM member1 
UNION ALL
SELECT name FROM star1;

SELECT name FROM member1 
INTERSECT
SELECT name FROM star1;

SELECT name FROM member1 
MINUS
SELECT name FROM star1;
