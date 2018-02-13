SELECT name, 'good morning~~!' "Good Morning" FROM professor;

SELECT empno, ename, sal FROM emp;

--p39 연습문제 1
DESC student;
SELECT name ||'''s ID : ' || id || ', WEIGHT is ' || weight || 'Kg' "ID AND WEIGHT" FROM student;

--p39 연습문제 2
DESC emp;
SELECT ename || '(' || job || ')' || ' , ' || ename || '''' || job || '''' "NAME AND JOB" FROM emp;

--p39 연습문제 3
SELECT ename || '''s sal is $' || sal "Name and Sal" FROM emp;

SELECT empno, ename FROM emp WHERE empno = 7900;
SELECT empno, sal FROM emp WHERE sal < 1000;
SELECT empno, ename, sal FROM emp WHERE ename = 'SMITH';
SELECT empno, ename, sal FROM emp WHERE hiredate = '80/12/17';

SELECT ename, sal FROM emp WHERE deptno = 10;
SELECT ename, sal , sal+100 FROM emp WHERE deptno = 10;

SELECT empno, ename, sal FROM emp WHERE sal >= 4000;
SELECT empno, ename, sal FROM emp WHERE ename >= 'W';
SELECT ename, hiredate FROM emp WHERE hiredate >= '81/12/25';

SELECT empno, ename, sal FROM emp WHERE sal >= 2000 AND sal <= 3000 ORDER BY ename;

SELECT empno, ename, deptno FROM emp WHERE deptno IN(10, 20);

SELECT empno, ename, sal FROM emp WHERE sal LIKE '1%';
SELECT empno, ename, sal FROM emp WHERE ename LIKE 'A%';
SELECT empno, ename, hiredate FROM emp WHERE hiredate LIKE '80%';
SELECT empno, ename, hiredate FROM emp WHERE hiredate LIKE '___12%';

SELECT empno, ename, comm FROM emp WHERE comm IS NULL;
SELECT empno, ename, comm FROM emp WHERE comm IS NOT NULL;

SELECT ename, sal, hiredate FROM emp WHERE sal > 1000 ORDER BY 1, 2;

--2장 단일행 함수




