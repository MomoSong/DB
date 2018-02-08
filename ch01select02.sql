--��� �̸��� SMITH�� ����� ã��.
SELECT empno, ename, sal from emp where ename = 'SMITH';

SELECT empno, ename, sal, hiredate FROM emp where ename = 'SMITH';

--�Ի��� 80/12/17 ã�ƺ���
SELECT empno, ename, sal, hiredate FROM emp where hiredate = '80/12/17';
SELECT empno, ename, sal, hiredate FROM emp where hiredate = '1980-12-17';
SELECT empno, ename, sal, to_char(hiredate, 'yyyy-mm-dd') AS hiredate FROM emp where hiredate = '1980-12-17';

--SAL�� 2000���� 3000���� ��� ã��
SELECT empno, ename, sal FROM emp WHERE sal >=2000 AND sal <= 3000;
SELECT empno, ename, sal FROM emp WHERE sal BETWEEN 2000 AND 3000;

--JAMES ���� MARTIN�̶�� ��������� ����Ʈ ���
SELECT ename FROM emp ORDER BY ename ASC;
SELECT ename FROM emp WHERE ename >='JAMES' AND ename <= 'MARTIN' ORDER BY ename ASC;
SELECT ename FROM emp WHERE ename BETWEEN 'JAMES' AND 'MARTIN' ORDER BY ename ASC;

--�μ���ȣ 10���� 20���� ����� ������ ã�´�.
SELECT empno, ename, deptno FROM emp WHERE deptno IN(10,20) ORDER BY deptno, ename;
SELECT empno, ename, deptno FROM emp WHERE deptno = 10 OR deptno = 20 ORDER BY deptno, ename;

DELETE FROM emp WHERE deptno in(10);
ROLLBACK;

-- ������ �����Ͱ� ������ �Ǿ� �ִ� ������ ��������
SELECT empno, ename, sal FROM emp;
SELECT empno, ename, sal FROM emp WHERE sal LIKE '1%';
--����� �߿��� A�� �����ϴ� ������ ã��
SELECT empno, ename, sal FROM emp WHERE ename LIKE 'A%';
--����� �߿��� S�� ������ ������ ã��
SELECT empno, ename, sal FROM emp WHERE ename LIKE '%S';
--����� �߿��� A�� ������ �Ǿ��ִ� ������ ã��
SELECT empno, ename, sal FROM emp WHERE ename LIKE '%A%';

--�Խ��� ��
SELECT * FROM board;

--�˻��� 'java'�� ����, ����, �ۼ��� �߿� ������ �Ǿ� �ִ� ��
SELECT * FROM board WHERE title LIKE '%java%' OR content LIKE '%java%' OR writer LIKE '%java%';

UPDATE board SET title = 'oracle' where no=1;
UPDATE board SET content = 'oracle���� ����' WHERE no = 1;
COMMIT;

SELECT * FROM emp;

SELECT empno, ename, hiredate FROM emp WHERE hiredate LIKE '___1%';

SELECT empno, ename, comm FROM emp WHERE comm IS NULL;
SELECT empno, ename, comm FROM emp WHERE comm IS NOT NULL;

--�����͸� �Է� �޾Ƽ� �Է¹��� �����ͷ� �˻��ϱ�
SELECT empno, ename, sal FROM emp WHERE empno = &empno;
SELECT empno, ename, sal FROM &table;

SELECT * FROM emp ORDER BY sal DESC;
SELECT * FROM emp ORDER BY 6 DESC;

