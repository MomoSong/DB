--* : ��� �÷��� ���Ѵ�.
select * from emp;
select * from dept;
desc dept;

--�����ȣ, ����̸��� ��������
select empno, ename from emp;

--ǥ����
select ename, 'good~~' gm from emp;
select empno, ename, sal from emp;
select empno, ename, sal, sal+sal*1.0 pay from emp;
select * from dept;
select deptno from emp;

--�ߺ�����
select distinct deptno from emp;

--����
select job, ename from emp order by 1, 2;
select job, ename from emp order by job asc, ename desc;

select ename || '(' || job || ')' Info from emp order by Info;
-- = select ename || '(' || job || ')' Info from emp order by 1;

--39page �������� 2��
select ename || '(' || job || ')' || ' , ' || ename || '''' || job || '''' "Name and Job" 
from emp;

--39page �������� 3��
select ename || '''s sal is $' || sal "Name and Sa;" from emp;

select empno, ename from emp where empno = 7900;

select * from emp where empno = 7900;

--Join �μ����̺�� ��� ���̺��� ����
select empno, ename, E.deptno, dname from emp E, dept D
where (empno = 7900) and (E.deptno = D.deptno);

select ename, sal from emp where sal < 1000;













