--2장 단일행 함수

SELECT ename, INITCAP(ename) "INITCAP" FROM emp WHERE deptno = 10;

SELECT ename, LOWER(ename) "LOWER", UPPER(ename) "UPPER" FROM emp WHERE deptno = 10;

SELECT ename, LENGTH(ename) "LENGTH", LENGTHB(ename) "LEGNTHB" FROM emp WHERE deptno = 20;
SELECT '서진수' "NAME", LENGTH('서진수') "LENGTH", LENGTHB('서진수') "LENGTHB" FROM dual;

SELECT CONCAT(ename, job) FROM emp WHERE deptno = 10;

SELECT SUBSTR('abcd', 3, 2) "3, 2", 
        SUBSTR('abcd', -3, 2) "-3, 2",
        SUBSTR('abcd', -3, 4) "-3, 4" FROM dual;

SELECT name, SUBSTR(jumin, 3, 4) "Birthday", 
            SUBSTR(jumin, 3, 4) -1 "Birthday - 1"
FROM student WHERE deptno1 = 101;

SELECT '서진수' "NAME", SUBSTR('서진수', 1, 2) "SUBSTR",
                        SUBSTRB('서진수', 1, 3) "SUBSTRB"
FROM dual;

SELECT 'A-B-C-D', INSTR('A-B-C-D', '-', 1, 3) "INSTR" FROM dual;

--P79 QUIZ
SELECT name, tel, SUBSTR(tel, 1, INSTR(tel, ')')-1) FROM student;

SELECT name, id, LPAD(id, 10, '*') FROM student WHERE deptno1 = 201;
SELECT RPAD(ename, 10, '-') "RPAD" FROM emp WHERE deptno = 10;
        
--p81 QUIZ
SELECT LPAD(ename, 9, '12345') "LPAD" FROM emp WHERE deptno = 10;

--P82 QUIZ
SELECT RPAD(ename, 9, SUBSTR('123456789', LENGTHB(ename)+1))  "RPAD" FROM emp WHERE deptno = 10; 

SELECT LTRIM(ename, 'C') FROM emp WHERE deptno = 10;
SELECT RTRIM(ename, 'R') FROM emp WHERE deptno = 10;

SELECT ename, REPLACE(ename, SUBSTR(ename, 1, 2), '**') "REPLACE" FROM emp WHERE deptno= 10;

--p85 QUIZ 1
SELECT ename, REPLACE(ename, SUBSTR(ename, 2, 2), '--') "REPLACE" FROM emp WHERE deptno = 20;

--QUIZ2
SELECT name, jumin, REPLACE(jumin, SUBSTR(jumin, 6), '-/-/-/-') "REPLACE" FROM student WHERE deptno1 = 101;

--QUIZ3
SELECT name, tel, REPLACE(tel, SUBSTR(tel, INSTR(tel, ')')+1, 3  ), '***') "REPLACE" FROM student WHERE deptno1 = 102;

--QUIZ4
SELECT name , tel, REPLACE(tel, SUBSTR(tel, INSTR(tel, '-')+1), '****') "REPLACE" FROM student WHERE deptno1 = 101;














        