CREATE TABLE guest(
no NUMBER PRIMARY KEY,
content VARCHAR2(300) NOT NULL
);

--ù �湮�ڰ� ���� ���ԵǸ� ���� ū ���� + 1�� �����Ѵ�.
INSERT INTO guest
VALUES(NVL((SELECT MAX(NO) FROM guest), 0)+1,'�� ���� ���ϴ�.');

INSERT INTO guest
VALUES(NVL((SELECT MAX(NO) FROM guest), 0)+1,'�����ϼ���.');

INSERT INTO guest
VALUES(NVL((SELECT MAX(NO) FROM guest), 0)+1,'�����մϴ�.');

INSERT INTO guest
VALUES(NVL((SELECT MAX(NO) FROM guest), 0)+1,'�������� ����');
COMMIT;

--����Ʈ
SELECT no, content FROM guest ORDER BY no DESC;

--�ۺ��� �� �ʿ䰡 �����Ƿ� �ۺ��� ����
--���� ����
UPDATE guest SET content = 'ȭ����' WHERE no = 2;
COMMIT;

--���� ����
DELETE FROM guest WHERE no = 2;

--2���� ���������Ƿ� ���� ������ �ȵȴ�. �׷��Ƿ� NO UPDATE
UPDATE guest SET no = no - 1 WHERE no > 2;

SELECT ROWNUM, no, title, writer, writedate, hit FROM board ORDER BY no DESC;