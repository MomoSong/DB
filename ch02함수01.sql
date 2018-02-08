SELECT ename, INITCAP(ename) initcap, LOWER(ename) lower, 
UPPER(ename) upper, LENGTHB(ename) "lengthB" , LENGTH(ename) "length"
FROM emp;

SELECT '서지수' name, LENGTH('서지수') length, LENGTHB('서지수') "lengthB" FROM dual;

SELECT * FROM emp;

SELECT CONCAT(ename, concat('-', job)) txt FROM emp;
SELECT ename || '-' || job txt FROM emp;

SELECT SUBSTR('ABCDEF', 3, 2) "3, 2",
SUBSTR('ABCDEF', -3, 2) "-3, 2",
SUBSTR('ABCDEF',-3) "-3",
SUBSTR('ABCDEF',3) "3",
SUBSTR('서지수',1,2)"한글",
SUBSTRB('서지수',1,3)"한글B", 
INSTR('A-B-C-D', '-', 2, 2)"INSTR",
INSTR('A-B-C-D-E-F', '-', 3, 2)"INSTR",
INSTR('A-B-C-D-E-F', '-', 5, 2)"INSTR"
FROM dual;

SELECT ename, LPAD(ename, 10, '*'), RPAD(ename, 10, '*') from emp;

SELECT ename, LTRIM(ename, 'C') FROM emp;

SELECT '['||'   abc   '||']', 
'['|| LTRIM('   abc   ')||']',
'['|| RTRIM('   abc   ')||']',
'['|| TRIM('   abc   ')||']'
FROM dual;

SELECT ename, REPLACE(ename, SUBSTR(ename, 1, 2), '**') "replace" FROM emp;

