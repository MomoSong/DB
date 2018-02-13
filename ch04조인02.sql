-- Cartesian Product : n * m 개의 데이터가 나옴
select e.empno, e.ename, e.deptno, d.deptno, d.dname
from emp e, dept d
order by empno, 4;
SELECT * FROM emp;
SELECT * FROM dept;

-- inner join : null은 데이터에서 빠짐 (emp의 president가 null임)
select e.empno, e.ename, e.deptno, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno
order by empno, 4;

-- outer join : null을 포함 시킴
select e.empno, e.ename, e.job, e.deptno, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno(+)
order by empno, 4;

-- ansi outer join : null을 포함 시킴
select e.empno, e.ename, e.job, e.deptno, d.deptno, d.dname
from emp e left outer join dept d
on e.deptno = d. deptno
order by empno, 4;

--SELF JOIN
SELECT e.empno, e.ename, e.mgr, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno;

--SELF OUTER JOIN
SELECT e.empno, e.ename, e.mgr, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno(+);