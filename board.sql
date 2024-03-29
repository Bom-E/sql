-- 기본키(PRIMARY KEY :PK) 데이터를 올바르게 넣기위한 제약조건(결함 낮추기)
-- NULL이 들어갈 수 없고, 테이블 내에서 중복 불가

-- 회원 정보 테이블

CREATE TABLE BOARD_MEMBER(
   -- 컬럼명 자료형 [제약조건]
   MEMBER_ID VARCHAR(20) PRIMARY KEY
   , MEMBER_PW VARCHAR(20) NOT NULL
   , MEMBER_NAME VARCHAR(20) NOT NULL
   , GENDER VARCHAR(2) -- '남', '여'
   , MEMBER_EMAIL VARCHAR(30) UNIQUE -- 중복 불가
   , IS_ADMIN VARCHAR(2) DEFAULT 'N' -- 'N' or 'Y'
);

-- 게시글 정보 테이블
-- DROP TABLE BOARD; 테이블 삭제 ROLLBACK 없음
-- DELETE FROM BOARD; 데이터 삭제

-- WRITER : 외래키(FOREIGN KEY : FK) 제약조건
CREATE TABLE BOARD(
   BOARD_NUM INT AUTO_INCREMENT PRIMARY KEY -- 자동으로 숫자 증가
   , TITLE VARCHAR(30) NOT NULL
   , CONTENT VARCHAR(30)
   , WRITER VARCHAR(20) REFERENCES board_member(MEMBER_ID)
   , CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP -- 현재 시간
   , READ_CNT INT DEFAULT 0
);

CREATE TABLE BOARD_REPLY(
   REPLY_NUM INT AUTO_INCREMENT PRIMARY KEY
   , CONTENT VARCHAR(50) NOT NULL 
   , CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP
   , WRITER VARCHAR(20) REFERENCES board_member(MEMBER_ID)
   , BOARD_NUM INT REFERENCES board(BOARD_NUM)
);

SELECT NOW();

SELECT * FROM BOARD_MEMBER;

SELECT * FROM board;

SELECT *
FROM board_reply;

INSERT INTO BOARD (TITLE, CONTENT, WRITER) 
VALUES('AA', 'BB', NULL);

DELETE FROM board;
COMMIT;

UPDATE board_member
SET IS_ADMIN = 'Y'
WHERE MEMBER_ID = 'admin';

SELECT *
FROM board
WHERE TITLE = '5';

INSERT INTO BOARD(
   TITLE
   , WRITER
   , CONTENT
) VALUES (
'*** 게시판 이용 안내 ***'
   , 'admin'
   , 'test
욕설 및 친목 금지'
);
        
COMMIT;

SELECT COUNT(BOARD_NUM) FROM board;
SELECT COUNT(*) FROM emp;
SELECT COUNT(EMPNO) FROM emp;

SELECT *
FROM board
ORDER BY BOARD_NUM
LIMIT 5 OFFSET 5;
-- LIMIT : 몇 개씩 조회 할 것인지.
-- OFFSET : 처음을 기준으로 
-- 몇개를 건너띄고 조회 할 것인지.


