CREATE TABLE guest(
no NUMBER PRIMARY KEY,
content VARCHAR2(300) NOT NULL
);

--첫 방문자가 글을 쓰게되면 제일 큰 숫자 + 1로 저장한다.
INSERT INTO guest
VALUES(NVL((SELECT MAX(NO) FROM guest), 0)+1,'잘 보고 갑니다.');

INSERT INTO guest
VALUES(NVL((SELECT MAX(NO) FROM guest), 0)+1,'수고하세요.');

INSERT INTO guest
VALUES(NVL((SELECT MAX(NO) FROM guest), 0)+1,'감사합니다.');

INSERT INTO guest
VALUES(NVL((SELECT MAX(NO) FROM guest), 0)+1,'쉽지않은 선택');
COMMIT;

--리스트
SELECT no, content FROM guest ORDER BY no DESC;

--글보기 할 필요가 없으므로 글보기 생략
--방명록 수정
UPDATE guest SET content = '화이팅' WHERE no = 2;
COMMIT;

--방명록 삭제
DELETE FROM guest WHERE no = 2;

--2번이 없어졌으므로 숫자 연속이 안된다. 그러므로 NO UPDATE
UPDATE guest SET no = no - 1 WHERE no > 2;

SELECT ROWNUM, no, title, writer, writedate, hit FROM board ORDER BY no DESC;