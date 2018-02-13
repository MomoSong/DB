-- Cartesian Product : n * m ���� �����Ͱ� ����
select e.empno, e.ename, e.deptno, d.deptno, d.dname
from emp e, dept d
order by empno, 4;
SELECT * FROM emp;
SELECT * FROM dept;

-- inner join : null�� �����Ϳ��� ���� (emp�� president�� null��)
select e.empno, e.ename, e.deptno, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno
order by empno, 4;

-- outer join : null�� ���� ��Ŵ
select e.empno, e.ename, e.job, e.deptno, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno(+)
order by empno, 4;

-- ansi outer join : null�� ���� ��Ŵ
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