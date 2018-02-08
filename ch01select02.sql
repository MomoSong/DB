--사원 이름은 SMITH인 사람을 찾자.
SELECT empno, ename, sal from emp where ename = 'SMITH';

SELECT empno, ename, sal, hiredate FROM emp where ename = 'SMITH';

--입사일 80/12/17 찾아보자
SELECT empno, ename, sal, hiredate FROM emp where hiredate = '80/12/17';
SELECT empno, ename, sal, hiredate FROM emp where hiredate = '1980-12-17';
SELECT empno, ename, sal, to_char(hiredate, 'yyyy-mm-dd') AS hiredate FROM emp where hiredate = '1980-12-17';

--SAL이 2000에서 3000사이 사원 찾기
SELECT empno, ename, sal FROM emp WHERE sal >=2000 AND sal <= 3000;
SELECT empno, ename, sal FROM emp WHERE sal BETWEEN 2000 AND 3000;

--JAMES 부터 MARTIN이라는 사람까지의 리스트 출력
SELECT ename FROM emp ORDER BY ename ASC;
SELECT ename FROM emp WHERE ename >='JAMES' AND ename <= 'MARTIN' ORDER BY ename ASC;
SELECT ename FROM emp WHERE ename BETWEEN 'JAMES' AND 'MARTIN' ORDER BY ename ASC;

--부서번호 10번과 20번인 사원의 정보를 찾는다.
SELECT empno, ename, deptno FROM emp WHERE deptno IN(10,20) ORDER BY deptno, ename;
SELECT empno, ename, deptno FROM emp WHERE deptno = 10 OR deptno = 20 ORDER BY deptno, ename;

DELETE FROM emp WHERE deptno in(10);
ROLLBACK;

-- 선택한 데이터가 포함이 되어 있는 데이터 가져오기
SELECT empno, ename, sal FROM emp;
SELECT empno, ename, sal FROM emp WHERE sal LIKE '1%';
--사원명 중에서 A로 시작하는 데이터 찾기
SELECT empno, ename, sal FROM emp WHERE ename LIKE 'A%';
--사원명 중에서 S로 끝나는 데이터 찾기
SELECT empno, ename, sal FROM emp WHERE ename LIKE '%S';
--사원명 중에서 A가 포함이 되어있는 데이터 찾기
SELECT empno, ename, sal FROM emp WHERE ename LIKE '%A%';

--게시판 글
SELECT * FROM board;

--검색어 'java'가 제목, 내용, 작성자 중에 포함이 되어 있는 글
SELECT * FROM board WHERE title LIKE '%java%' OR content LIKE '%java%' OR writer LIKE '%java%';

UPDATE board SET title = 'oracle' where no=1;
UPDATE board SET content = 'oracle쉽게 배우기' WHERE no = 1;
COMMIT;

SELECT * FROM emp;

SELECT empno, ename, hiredate FROM emp WHERE hiredate LIKE '___1%';

SELECT empno, ename, comm FROM emp WHERE comm IS NULL;
SELECT empno, ename, comm FROM emp WHERE comm IS NOT NULL;

--데이터를 입력 받아서 입력받은 데이터로 검색하기
SELECT empno, ename, sal FROM emp WHERE empno = &empno;
SELECT empno, ename, sal FROM &table;

SELECT * FROM emp ORDER BY sal DESC;
SELECT * FROM emp ORDER BY 6 DESC;

