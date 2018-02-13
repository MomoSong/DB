SELECT * FROM emp;

SELECT empno, ename, deptno FROM emp;
SELECT empno, ename, deptno, DECODE(deptno, 20, 'Research', deptno) FROM emp;

SELECT empno, ename, deptno, CASE deptno WHEN 10 THEN 'Accounting'
                                         WHEN 20 THEN 'Research'
                                         WHEN 30 THEN 'Sales'
                                         WHEN 40 THEN 'Operations'
END "Dept" FROM emp;

--부서 테이블, 사원 테이블 조인
SELECT *
FROM emp, dept
WHERE dept.deptno = emp.deptno;

SELECT COUNT(*), COUNT(comm) FROM emp;
SELECT COUNT(*), COUNT(comm) FROM emp WHERE deptno <> 30;
SELECT COUNT(*), COUNT(comm) FROM emp WHERE deptno <> 30 OR deptno IS NULL;

--월급의 합계
SELECT SUM(sal), AVG(sal) FROM emp;
SELECT STDDEV(sal)"Deviation" , VARIANCE(sal) "Variance" FROM emp;

--그룹핑 작업을 하는 Group by, 부서별 월급의 평균
SELECT deptno, AVG(NVL(sal, 0)) "AVG" FROM emp GROUP BY deptno;
SELECT deptno, job, AVG(NVL(sal, 0)) "AVG" FROM emp GROUP BY deptno, job ORDER BY deptno, job;
SELECT deptno, job, AVG(NVL(sal, 0)) "AVG" FROM emp WHERE sal > 2000 
GROUP BY deptno, job ORDER BY deptno, job;

SELECT deptno, AVG(NVL(sal, 0)) FROM emp 
GROUP BY deptno
HAVING AVG(NVL(SAL, 0)) > 2000;

-----------------

INSERT INTO board(no, title, content, writer) 
VALUES(BOARD_SEQ.nextval, 'big', '많은 데이터', '김연아');
COMMIT;

INSERT INTO board(no, title, content, writer) 
SELECT board_seq.nextval, title, content, writer FROM board;
COMMIT;

SELECT * FROM board;

--QUIZ 작성자별로 작성된 글의 갯수를 파악하는 SQL - 사람이름과 글의 갯수
SELECT writer, COUNT(writer) FROM board GROUP BY writer; 

--부서별, job별, 총 사원별 평균
SELECT deptno, NULL job, ROUND(AVG(sal), 1) avg_sal, COUNT(*) CNT_EMP
FROM emp WHERE deptno IS NOT NULL
GROUP BY deptno;

--부서별, job별
SELECT deptno, job, ROUND(AVG(sal), 1) avg_sal, COUNT(*) CNT_EMP
FROM emp
GROUP BY deptno, job;

--전체 사원별
SELECT NULL deptno, NULL job, ROUND(AVG(sal), 1) avg_sal, COUNT(*) CNT_EMP
FROM emp;

--부서별, job별, 총 사원별 평균
SELECT deptno, NULL job, ROUND(AVG(sal), 1) avg_sal, COUNT(*) CNT_EMP
FROM emp WHERE deptno IS NOT NULL
GROUP BY deptno 
UNION ALL
SELECT deptno, job, ROUND(AVG(sal), 1) avg_sal, COUNT(*) CNT_EMP
FROM emp
GROUP BY deptno, job
UNION ALL
SELECT NULL deptno, NULL job, ROUND(AVG(sal), 1) avg_sal, COUNT(*) CNT_EMP
FROM emp
ORDER BY deptno, job;

SELECT deptno, job, ROUND(AVG(sal), 1) AVG_SAL, COUNT(*) cnt_emp FROM emp
GROUP BY ROLLUP(deptno, job);