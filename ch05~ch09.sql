--테이블 복사하기 (구조와 데이터 모두 복사)
CREATE TABLE emp1
AS SELECT * FROM emp;

SELECT * FROM emp1;

--일부만 복사
CREATE TABLE emp3
AS SELECT empno, ename, hiredate, sal FROM emp;

SELECT * FROM emp3;

--데이터 구조만 복사
CREATE TABLE emp3 AS SELECT * FROM emp WHERE 1=2;

--ch07제약조건
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
    gender VARCHAR2(3) CONSTRAINT member2_gender_ck CHECK(gender in('남','여')),
    gradeno NUMBER(1) CONSTRAINT member2_gradeno_fk 
    --REFERENCES grade(gradeno) ON DELETE CASCADE
    REFERENCES grade(gradeno) ON DELETE SET NULL
);

--pk에 데이터를 먼저 넣는다.
INSERT INTO grade VALUES(9, '관리자');
INSERT INTO grade VALUES(1, '일반');
INSERT INTO grade VALUES(3, '우수');
COMMIT;

INSERT INTO member2
VALUES('admin', '송근모', '010-5579-9262', '남', 9);
INSERT INTO member2
VALUES('test', '홍길동', '010-1111-1111', '남', 3);
INSERT INTO member2
VALUES('kimya', '김연아', '010-8888-8888', '여', 1);
COMMIT;

SELECT * FROM member2;

DELETE FROM grade WHERE gradeno=1;

SELECT * FROM grade;

ROLLBACK;

SELECT * FROM member2;

CREATE INDEX index_member2_name_tel
ON member2(name, gender);

SELECT * FROM member2 WHERE name = '송근모' and gender = '남';


--ch09 뷰
SELECT * FROM emp;

--VIEW 테이블을 생성을 하는 권한을 받아야 한다. sys로 부터
CREATE OR REPLACE VIEW v_emp1
AS 
SELECT empno, ename, job, hiredate, deptno
FROM emp WHERE job <> 'PRESIDENT';

SELECT * FROM  v_emp1;

