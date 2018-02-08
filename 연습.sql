--* : 모든 컬럼을 말한다.
select * from emp;
select * from dept;
desc dept;

--사원번호, 사원이름만 가져오기
select empno, ename from emp;

--표현식
select ename, 'good~~' gm from emp;
select empno, ename, sal from emp;
select empno, ename, sal, sal+sal*1.0 pay from emp;
select * from dept;
select deptno from emp;

--중복제거
select distinct deptno from emp;

--정렬
select job, ename from emp order by 1, 2;
select job, ename from emp order by job asc, ename desc;

select ename || '(' || job || ')' Info from emp order by Info;
-- = select ename || '(' || job || ')' Info from emp order by 1;

--39page 연습문제 2번
select ename || '(' || job || ')' || ' , ' || ename || '''' || job || '''' "Name and Job" 
from emp;

--39page 연습문제 3번
select ename || '''s sal is $' || sal "Name and Sa;" from emp;

select empno, ename from emp where empno = 7900;

select * from emp where empno = 7900;

--Join 부서테이블과 사원 테이블의 조인
select empno, ename, E.deptno, dname from emp E, dept D
where (empno = 7900) and (E.deptno = D.deptno);

select ename, sal from emp where sal < 1000;













