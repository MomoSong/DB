--P86 2018.2.9
--숫자 관련 함수
SELECT ROUND(987.655, 2) "R1", 
        ROUND(987.655, 0) "R2",
        ROUND(987.654,-2) "R3"
FROM dual;

SELECT TRUNC(987.655, 2) "T1", 
        TRUNC(987.655, 0) "T2",
        TRUNC(987.654,-2) "T3"
FROM dual;

SELECT MOD(121, 10) "MOD" ,
    CEIL(123.45) "CEIL",
    FLOOR(123.75) "FLOOR"
FROM dual;

--날짜관련 함수
SELECT SYSDATE FROM dual;
--시분초까지 표시 OR NOT
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
ALTER SESSION SET NLS_DATE_FORMAT = 'RRRR-MM-DD:HH24:MI:SS';
SELECT SYSDATE FROM dual;

SELECT * FROM board;
SELECT SYSDATE, writedate, TRUNC(SYSDATE - writedate) "After date" from board;

SELECT MONTHS_BETWEEN
       (TO_DATE('09-30-2014','MM-DD-YYYY'),
        TO_DATE('08-31-2014','MM-DD-YYYY') )
        "Between"
FROM dual;

SELECT * FROM emp;
SELECT empno, ename, hiredate, TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) "근속월",
                                TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)/12) "근속년"
from emp;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 1) "ADD MONTHS" ,
                NEXT_DAY(SYSDATE, '월') "NEXT DAY",
                LAST_DAY(SYSDATE) "LAST DAY",
                TO_DATE('2018-03-01', 'YYYY-MM-DD')-1 "2월 마지막날"
FROM dual;

SELECT SYSDATE, TRUNC(SYSDATE) "TRUNC" FROM dual;

--형변환
SELECT 2 + '2', '2' + 2, 2 ||'2' FROM dual;
SELECT 2 + TO_NUMBER('2') FROM dual;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY') "YYYY",
                TO_CHAR(SYSDATE, 'RRRR') "RRRR",
                TO_CHAR(SYSDATE, 'YY') "YY",
                TO_CHAR(SYSDATE, 'RR') "RR",
                TO_CHAR(SYSDATE, 'YEAR') "YEAR"
FROM dual;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'MM') "MM",
                TO_CHAR(SYSDATE, 'MON') "MON",
                TO_CHAR(SYSDATE, 'MONTH') "MONTH"
FROM dual;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD') "DD",
                TO_CHAR(SYSDATE, 'DAY') "DAY",
                TO_CHAR(SYSDATE, 'DDTH') "DDTH"
FROM dual;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'RRRR-MM-DD') FROM dual;

SELECT * FROM emp;
SELECT empno, ename, TO_CHAR(sal, '$99,999') FROM emp;

















