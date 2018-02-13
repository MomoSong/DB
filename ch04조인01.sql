SELECT * FROM emp;

SELECT empno, ename, e.deptno, d.deptno, dname, sal, job
FROM emp e, dept d
WHERE d.deptno = e.deptno
ORDER BY empno;

SELECT empno, ename, e.deptno, d.deptno, dname, sal, job
FROM emp e JOIN dept d
ON d.deptno = e.deptno
ORDER BY empno;

SELECT * FROM member1;

--1
create table qna(
    no number primary key,
    title varchar2(150) not null,
    writer varchar2(15) not null REFERENCES member1(ID),
    question varchar2(600) not null,
    answer varchar2(600) ,
    writedate date default sysdate,
    hit number default 0
);

--2
create sequence qna_seq;

--3.���õ����� �Է�
INSERT INTO qna(no, title, question, writer)
VALUES(QNA_SEQ.nextval, '��â �ø��� ����', '���� ��ȭ �Ҷ� ����', 'test');
COMMIT;

SELECT * FROM qna;

--����, ��ȣ, ����, �ۼ���, ����ó, �ۼ���
SELECT no, title, name, tel 
FROM qna q, member1 m
WHERE m.id = q.writer;
