--���̺� �����ϱ� (������ ������ ��� ����)
CREATE TABLE emp1
AS SELECT * FROM emp;

SELECT * FROM emp1;

--�Ϻθ� ����
CREATE TABLE emp3
AS SELECT empno, ename, hiredate, sal FROM emp;

SELECT * FROM emp3;

--������ ������ ����
CREATE TABLE emp3 AS SELECT * FROM emp WHERE 1=2;

--ch07��������
DESC member1;


CREATE TABLE grade(
    gradeno NUMBER(1) CONSTRAINT grade_gradeno_pk PRIMARY KEY,
    gname VARCHAR2(12) CONSTRAINT grade_gname_nn NOT NULL
);

--drop member2
DROP TABLE member2;

CREATE TABLE member2(
    id VARCHAR2(50) CONSTRAINT member2_id_pk PRIMARY KEY,
    name VARCHAR2(30) CONSTRAINT member2_name_nn NOT NULL,
    tel VARCHAR2(13) CONSTRAINT member2_tel_uk UNIQUE,
    gender VARCHAR2(3) CONSTRAINT member2_gender_ck CHECK(gender in('��','��')),
    gradeno NUMBER(1) CONSTRAINT member2_gradeno_fk 
    --REFERENCES grade(gradeno) ON DELETE CASCADE
    REFERENCES grade(gradeno) ON DELETE SET NULL
);

--pk�� �����͸� ���� �ִ´�.
INSERT INTO grade VALUES(9, '������');
INSERT INTO grade VALUES(1, '�Ϲ�');
INSERT INTO grade VALUES(3, '���');
COMMIT;

INSERT INTO member2
VALUES('admin', '�۱ٸ�', '010-5579-9262', '��', 9);
INSERT INTO member2
VALUES('test', 'ȫ�浿', '010-1111-1111', '��', 3);
INSERT INTO member2
VALUES('kimya', '�迬��', '010-8888-8888', '��', 1);
COMMIT;

SELECT * FROM member2;

DELETE FROM grade WHERE gradeno=1;

SELECT * FROM grade;

ROLLBACK;

SELECT * FROM member2;

CREATE INDEX index_member2_name_tel
ON member2(name, gender);

SELECT * FROM member2 WHERE name = '�۱ٸ�' and gender = '��';


--ch09 ��
SELECT * FROM emp;

--VIEW ���̺��� ������ �ϴ� ������ �޾ƾ� �Ѵ�. sys�� ����
CREATE OR REPLACE VIEW v_emp1
AS 
SELECT empno, ename, job, hiredate, deptno
FROM emp WHERE job <> 'PRESIDENT';

SELECT * FROM  v_emp1;

