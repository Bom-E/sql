CREATE TABLE HEADER_MENU(
	MENU_NUM INT AUTO_INCREMENT PRIMARY KEY ,
	MENU_NAME VARCHAR(20) NOT NULL ,
	MENU_PAGE VARCHAR(50) NOT NULL ,
	MENU_INDEX INT NOT NULL ,
	MENU_TYPE VARCHAR(20) NOT NULL
	);

-- 갈아엎기 
-- DROP TABLE header_menu;

CREATE TABLE SIDE_MENU(
	SIDE_MENU_NUM INT AUTO_INCREMENT PRIMARY KEY,
	SIDE_MENU_NAME VARCHAR(20) NOT NULL ,
	SIDE_MENU_PAGE VARCHAR(50) NOT NULL ,
	SIDE_MENU_INDEX INT NOT NULL ,
	MENU_NUM INT REFERENCES HEADER_MENU(menu_num));

-- 갈아엎기
-- DROP TABLE side_menu;

-- 헤더 파일 데이터 도서 관리쪽임
INSERT INTO HEADER_MENU(
	MENU_NAME , MENU_PAGE , MENU_INDEX , MENU_TYPE)
	VALUES
	('대출 반납', 'borrowReturn', 1 , 'library'),
	('이용자', 'user', 2 , 'library') ,
	('구입', 'buy', 3 , 'library') ,
	('등록 열람', 'regAndView', 4 , 'library') ,
	('통계', 'statistics', 5 , 'library');
	
-- 헤더 파일 데이터 도서관 웹쪽임
INSERT INTO HEADER_MENU(
	MENU_NAME , MENU_PAGE , MENU_INDEX , MENU_TYPE)
	VALUES
	('자료찾기', 'findBook', 1 , 'web'),
	('도서관 이용', 'libraryUse', 2 , 'web') ,
	('문화행사/교육', 'culturalAndEducation', 3 , 'web') ,
	('참여마당', 'forum', 4 , 'web') ,
	('도서관 소개', 'libraryintroduction', 5 , 'web');

-- 옆에 사이드 메뉴에 띄울려면 넣기는 넣어야할듯 (로그인 / 회원가입 / 아이디,비밀번호 찾기)
INSERT INTO HEADER_MENU(
	MENU_NAME , MENU_PAGE , MENU_INDEX , MENU_TYPE)
	VALUES
	('회원', 'member', 1 , 'member');

SELECT * FROM header_menu;
SELECT * FROM side_menu;

-- 사이드 메뉴 데이터
INSERT INTO SIDE_MENU(
	SIDE_MENU_NAME ,
	SIDE_MENU_PAGE ,
	SIDE_MENU_INDEX ,
	MENU_NUM)
	VALUES 
	-- 대출 반납
	('대출 반납', 'borrowReturn', 1 , 1 ),
	('일관 반납', 'consistentReturn', 2 , 1 ),
	('대출 반납 관리', 'borrowReturnManagement', 3 , 1),
	('예약정보 관리', 'reservationInfo', 4 , 1),
	('출력이력 관리', 'outputHistory', 5 , 1) ,
	-- 이용자
	('이용자 관리', 'user' , 1 , 2) ,
	('이용자 승인', 'userApproval', 2 , 2) ,
	('연체자 관리', 'delinquent', 3 , 2) ,
	-- 구입
	('희망 자료' , 'wishBook' , 1 , 3 ) ,
	('삭제 자료' , 'deleteBook', 2 , 3 ) ,
	('구입 자료' , 'buyBook', 3 , 3 ) ,
	('기증 자료' , 'donatedBook', 4 , 3 ) ,
	-- 등록 열람
	('작업 자료 관리', 'workingBook', 1, 4 ),
	('소장 자료 관리', 'collectionBook', 2, 4 ),
	('마크 반입', 'markImport', 3, 4  ),
	-- 통계
	('통계' , 'statistics', 1, 5 );
	
-- 사이드 메뉴 (웹)
INSERT INTO side_menu(
	SIDE_MENU_NAME ,
	SIDE_MENU_PAGE ,
	SIDE_MENU_INDEX ,
	MENU_NUM )
	VALUES
	-- 자료찾기
	('전체자료찾기', 'findFullBook', 1 , 6 ) ,
	('새로 들어온 책', 'newBook', 2 , 6 ) ,
	('추천도서', 'recommendedBook', 3 , 6 ) ,
	('대출이 많은책', 'manyBorrowedBook' , 4 , 6 ) ,
	('희망도서신청', 'hopeBookApplication' , 5 , 6),
	-- 도서관 이용
	('이용안내 및 자료실 소개', 'userGuide', 1 , 7) ,
	('이달의 행사 및 휴관일', 'eventAndCloseDay' , 2 , 7) ,
	-- 문화행사 / 교육
	('도서관 행사', 'libraryEvent', 1 , 8) ,
	('행사 참가신청', 'eventParticipation' , 2 , 8) ,
	('영화 상영', 'movie', 3 , 8 ) ,
	('평생교육 강좌안내', 'courseGuide', 4, 8) ,
	('강좌 수강신청', 'applicationForClasses' , 5 , 8 ) ,
	-- 참여 마당
	('공지사항', 'notice', 1 , 9 ) ,
	('묻고 답하기', 'askAndAnswer', 2 , 9) ,
	('자료기증', 'bookDonation' , 3 , 9 ) ,
	('사물함 예약', 'lockerReservation' , 4, 9) ,
	-- 도서관 소개
	('인사말' , 'greeting' , 1 , 10 ) ,
	('연혁' , 'history' , 2 , 10 ) ,
	('도서관 현황', 'libraryStatus', 3 , 10) ,
	('찾아오시는 길', 'libraryCome', 4, 10) ; 
	
-- 헤더 윗 부분(로그인/회원가입/아이디,비밀번호 찾기)를 위한 데이터
-- 회원 탈퇴 부분은 마이페이지이런곳에 들어가서 할 수 있도록 만들어야 할듯
INSERT INTO side_menu(
	SIDE_MENU_NAME ,
	SIDE_MENU_PAGE ,
	SIDE_MENU_INDEX ,
	MENU_NUM )
	VALUES
	('로그인', 'login', 1 , 11),
	('회원가입', 'join', 2 , 11),
	('아이디/비밀번호 찾기', 'findIdOrPW', 3, 11);
	
-- 메뉴들 찾기 위한 쿼리문
SELECT 
	header_menu.MENU_NUM ,
	MENU_NAME ,
	MENU_PAGE ,
	MENU_INDEX ,
	SIDE_MENU_NAME ,
	SIDE_MENU_PAGE ,
	SIDE_MENU_INDEX ,
	SIDE_MENU.SIDE_MENU_NUM
FROM
	header_menu INNER JOIN side_menu
	ON header_menu.MENU_NUM = side_menu.MENU_NUM 
WHERE
	header_menu.MENU_TYPE = 'library';
	
SELECT 
	header_menu.MENU_NUM ,
	MENU_NAME ,
	MENU_PAGE ,
	MENU_INDEX ,
	SIDE_MENU_NAME ,
	SIDE_MENU_PAGE ,
	SIDE_MENU_INDEX ,
	SIDE_MENU.SIDE_MENU_NUM
FROM
	header_menu INNER JOIN side_menu
	ON header_menu.MENU_NUM = side_menu.MENU_NUM 
WHERE
	header_menu.MENU_TYPE = 'web';
	
SELECT 
	header_menu.MENU_NUM ,
	MENU_NAME ,
	MENU_PAGE ,
	MENU_INDEX ,
	SIDE_MENU_NAME ,
	SIDE_MENU_PAGE ,
	SIDE_MENU_INDEX ,
	SIDE_MENU.SIDE_MENU_NUM
FROM
	header_menu INNER JOIN side_menu
	ON header_menu.MENU_NUM = side_menu.MENU_NUM 
WHERE
	header_menu.MENU_TYPE = 'member';
	
-- culturalAndEducation
-- findBook
-- home
-- libraryIntroduction
-- member
-- participationForum

-- 문자열로 바꾸고 숫자부분만 훔치고 최대값을 구한다음에 +1 해주기
SELECT MAX(CAST(SUBSTRING((BOOK_CODE),3) AS INT)+1) FROM book;


-- 위에서 결과물에 GR 붙이고 0으로 채워주기
SELECT CONCAT('GR',LPAD( (SELECT MAX(CAST(SUBSTRING((BOOK_CODE),3) AS INT)+1) FROM book) , 10 ,'0'));
-- 책 정보


-- 책 정보 insert 문법
LOAD DATA LOCAL INFILE 'D:/01-STUDY/dev/insertData_2.csv'
INTO TABLE BOOK
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';



DROP TABLE USERS;

DROP TABLE book;

DROP TABLE book_INFO;

COMMIT;

SELECT *
FROM book;

SELECT *
FROM users;

DELETE FROM users WHERE USER_ID = '김봄이';

INSERT INTO users(
	USER_CODE
	, USER_ID
	, USER_PW
	, USER_NAME
	, USER_TEL
	, POST_CODE 
	, USER_ADDR 
	, ADDR_DETAIL 
	, GENDER 
	, EMAIL 
	, IS_ADMIN 
	, CARD_NUM
) VALUES (
	2
	, 'user'
	, '1'
	, '최봄이'
	, '010-1111-2222'
	, 12345
	, '울산시 남구'
	, '그린아카데미'
	, '여자'
	, '1234@gmail.com'
	, 'Y'
	, 2
);

CREATE TABLE BOOK(
   BOOK_CODE VARCHAR(15) PRIMARY KEY,
   BOOK_TITLE VARCHAR(100) NOT NULL,
   BOOK_WRITER VARCHAR(100) NOT NULL,
   BOOK_PUB VARCHAR(30) NOT NULL,
   BOOK_YEAR VARCHAR(20) NOT NULL);
   
   
DROP TABLE book;

DROP TABLE users;

DROP TABLE book_borrow;

DROP TABLE BOOK_INFO;

   CREATE TABLE USERS(
	USER_CODE INT AUTO_INCREMENT PRIMARY KEY
	, USER_ID VARCHAR(20) NOT NULL
	, USER_PW VARCHAR(50) NOT NULL 
	, USER_NAME VARCHAR(20) NOT NULL
	, USER_TEL VARCHAR(20) NOT NULL
	, POST_CODE INT NOT NULL
	, USER_ADDR VARCHAR(50) NOT NULL
	, ADDR_DETAIL VARCHAR(50) NOT NULL
	, GENDER VARCHAR(2) NOT NULL
	, EMAIL VARCHAR(50) NOT NULL
	, IS_ADMIN VARCHAR(2) DEFAULT 'N'); -- N,Y
	
ALTER TABLE USERS ADD COLUMN CARD_NUM INT;
ALTER TABLE USERS ADD COLUMN PUBLISH_DATE DATETIME;
ALTER TABLE USERS ADD COLUMN USER_INTRO VARCHAR(200);
ALTER TABLE USERS ADD COLUMN CARD_STATUS VARCHAR(10) DEFAULT '사용중';

ALTER TABLE USERS CHANGE USER_PW USER_PW VARCHAR(100) NOT NULL;
ALTER TABLE USERS CHANGE CARD_NUM CARD_NUM INT NOT NULL;

ALTER TABLE USERS CHANGE CARD_NUM CARD_NUM INT;


-- 패널티 테이블
CREATE TABLE USER_PENALTY(

);

SELECT * FROM users;

DROP TABLE BOOK_BORROW;

SELECT * FROM book_borrow;

DROP TABLE book_borrow;

SELECT USER.USER_CODE
   , USER_NAME
   , USER_TEL
   , BR_CODE
   , BR_DATE
   , BOOK_CNT
   , RETURN_YN
   , RETURN_DATE
   , BB.BOOK_CODE
   , BOOK_TITLE
FROM BOOK_BORROW AS BB
INNER JOIN USERS AS USER
ON USER.USER_CODE = BB.USER_CODE
INNER JOIN BOOK_INFO AS BI
ON BB.BOOK_CODE = BI.BOOK_CODE
INNER JOIN book AS B
ON b.BOOK_CODE = BB.BOOK_CODE 
WHERE BB.USER_CODE = 1
ORDER BY BR_DATE DESC;
        
SELECT * FROM users;
SELECT * FROM BOOK_BORROW;
SELECT * FROM BOOK_INFO;
SELECT * FROM book;
        
INSERT INTO book_info (
	BOOK_INFO_NUM
	, BOOK_CATE_CODE
	, BOOK_CODE
) VALUES (
	1
	, 1
	, 'GR0000000001'
);
        
INSERT INTO book_borrow (
BR_CODE
	, EX_RETURN_DATE	
	, USER_CODE
	, BOOK_CODE
) VALUES (
1
	, DATE_ADD(NOW(), INTERVAL +14 DAY)
	, 1
	, 'GR0000000001'
);

DELETE FROM BOOK_BORROW;

UPDATE BOOK_INFO
SET
	BOOK_BORROW_AVAILABLE = 'N'
WHERE BOOK_CODE = 'GR0000000001';

SELECT * FROM book_INFO;

SELECT * FROM book_borrow;

SET
	MEMBER_BOOK_CNT = 1
WHERE MEMBER_NUM = 1;

UPDATE users
SET 
	USER_CODE = 1
WHERE card_NUM = 1;

SELECT
users.USER_ID,
users.USER_CODE,
users.USER_TEL
FROM
users INNER JOIN member_card
ON member_card.USER_CODE = users.user_code
WHERE 
member_card.USER_CODE = 1;

SELECT * FROM book_borrow;
	
ALTER TABLE member_card ADD COLUMN RT_CODE INT REFERENCES BOOK_RETURN(RT_CODE);
	
DROP TABLE member_card;

SELECT * FROM users;


CREATE TABLE BOOK_BORROW(
BR_CODE INT AUTO_INCREMENT PRIMARY KEY
   , BORROW_DATE DATETIME DEFAULT CURRENT_TIMESTAMP
	, RETURN_YN VARCHAR(2) NOT NULL DEFAULT 'N'
	, EX_RETURN_DATE DATETIME
	, BORROW_USER_CODE INT REFERENCES USERS(USER_CODE)
	, BOOK_CODE VARCHAR(20) REFERENCES BOOK(BOOK_CODE));
	
DROP TABLE book_borrow;

SELECT * FROM users;
	
SELECT NOW(), DATE_ADD(NOW(), INTERVAL +14 DAY);	
	
CREATE TABLE BOOK_BNR(
	BORROW_CODE INT PRIMARY KEY AUTO_INCREMENT
	, BORROW_DATE DATETIME DEFAULT CURRENT_TIMESTAMP
	, RETURN_YN VARCHAR(2) DEFAULT 'N'
	, EX_RETURN_DATE DATETIME
	, RETURN_DATE DATETIME
	, USER_CODE INT REFERENCES users(USER_CODE)
	, BOOK_CODE VARCHAR(20) REFERENCES BOOK(BOOK_CODE)
);
	
SELECT CARD_NUM
            , USER_INTRO
            , U.USER_CODE
            , USER_NAME
            , USER_TEL
            , BR_CODE
            , BORROW_DATE
            , RETURN_YN
            , EX_RETURN_DATE
            , RT_CODE
            , RETURN_DATE
            , BB.BOOK_CODE
        FROM USERS AS U
        LEFT JOIN BOOK_BORROW AS BB
        ON U.USER_CODE = BB.USER_CODE
        LEFT JOIN BOOK_RETURN AS BR
        ON U.USER_CODE = BR.USER_CODE
        WHERE U.CARD_NUM = 1
        ORDER BY BORROW_DATE DESC;
        
        SELECT * FROM users WHERE CARD_NUM = 1;
        
        SELECT * FROM users;
        
        COMMIT;
        
        UPDATE USERS
        SET
        		CARD_NUM = 1
        WHERE USER_CODE = 1;
        
        DROP TABLE users;
        
        -- 책 정보 insert 문법
LOAD DATA LOCAL INFILE 'D:/01-STUDY/insertData_2.csv'
INTO TABLE BOOK
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- 대출 테이블

-- 반납 예정일 INSERT 쿼리
SELECT DATE_ADD(NOW(), INTERVAL +14 DAY);

DELETE FROM book_bnr;
COMMIT;

SELECT * FROM book_bnr;
SELECT * FROM book_info;

DROP TABLE book_bnr;
DROP TABLE book;
DROP TABLE book_info;
	
SELECT * FROM book_bnr;

-- MEMBER_CARD (24.03.05 수정)
DROP TABLE MEMBER_CARD;

-- MEMBER_CARD의 일부 기능 USERS로 병합 (24.03.05 수정)
CREATE TABLE USERS(
	USER_CODE INT AUTO_INCREMENT PRIMARY KEY
	, USER_ID VARCHAR(20) NOT NULL
	, USER_PW VARCHAR(100) NOT NULL
	, USER_NAME VARCHAR(20) NOT NULL
	, USER_TEL VARCHAR(20) NOT NULL
	, POST_CODE INT NOT NULL
	, USER_ADDR VARCHAR(50) NOT NULL
	, ADDR_DETAIL VARCHAR(50) NOT NULL
	, GENDER VARCHAR(2) NOT NULL
	, EMAIL VARCHAR(50) NOT NULL
	, IS_ADMIN VARCHAR(2) DEFAULT 'N'
	, CARD_NUM INT
	, PUBLISH_DATE DATETIME
	, USER_INTRO VARCHAR(200)
	, CARD_STATUS VARCHAR(10) DEFAULT '사용중'
	); -- N,Y

ALTER TABLE USERS ADD COLUMN CARD_NUM INT;
ALTER TABLE USERS ADD COLUMN PUBLISH_DATE DATETIME;
ALTER TABLE USERS ADD COLUMN USER_INTRO VARCHAR(200);
ALTER TABLE USERS ADD COLUMN CARD_STATUS VARCHAR(10) DEFAULT '사용중';

-- 24.03.07 USERS 테이블 컬럼 변경
ALTER TABLE USERS CHANGE USER_PW USER_PW VARCHAR(100) NOT NULL;
ALTER TABLE USERS CHANGE CARD_NUM CARD_NUM INT UNIQUE;
ALTER TABLE USERS CHANGE CARD_STATUS CARD_STATUS VARCHAR(10) DEFAULT '대기중';

DROP TABLE users;
DROP TABLE book;
DROP TABLE book_info;
DROP TABLE book_reservation;
DROP TABLE book_bnr;
DROP TABLE board;
DROP TABLE attached_file;
DROP TABLE ASK_AND_ANSWER_BOARD;

-- 이용자 정보 insert 문

INSERT INTO users(
	USER_CODE
	, USER_ID
	, USER_PW
	, USER_NAME
	, USER_TEL
	, POST_CODE
	, USER_ADDR
	, ADDR_DETAIL
	, GENDER
	, EMAIL
	, IS_ADMIN
) VALUES (
	17
	, 'HOHOHO'
	, '1234'
	, '달마'
	, '010-888-1111'
	, 12345
	, '울산시 중구'
	, '레드아카데미'
	, '여자'
	, '5678@gmail.com'
	, 'N'
);

SELECT * FROM book_bnr;

SELECT * FROM book_info;

SELECT * FROM users;

UPDATE book_info
SET 
   BOOK_BORROW_AVAILABLE = 'Y'
WHERE BOOK_INFO_NUM = 156;

UPDATE USERS
   SET PUBLISH_DATE = DATE_ADD(NOW())
   WHERE USER_CODE = 29;

SELECT USER_CODE
   , USER_ID
   , USER_NAME
   , GENDER
   , USER_TEL
   , IS_ADMIN
   , CARD_NUM
FROM users
WHERE USER_NAME BETWEEN 'ㄱ' AND '힣';
        
        COMMIT;
SELECT * FROM users;

DROP TABLE users;
DROP TABLE BOOK_BNR;
DROP TABLE book;
DROP TABLE book_info;

SELECT MAX(CARD_NUM) FROM users;

SELECT USER_CODE
   , USER_ID
   , USER_NAME
   , GENDER
   , USER_TEL
   , IS_ADMIN
   , CARD_NUM
FROM USERS
WHERE CARD_NUM BETWEEN (SELECT MIN(CARD_NUM) FROM users) AND 2;

SELECT U.USER_CODE
   , USER_ID
   , USER_NAME
   , GENDER
   , USER_TEL
   , IS_ADMIN
   , CARD_NUM
   , CARD_STATUS
   , COUNT(BORROW_CODE) AS BORROW_CNT
   , SUM(CASE WHEN BB.RETURN_DATE > BB.EX_RETURN_DATE THEN 1 ELSE 0 END) AS LATE_RETURN
   , USER_INTRO
FROM USERS U
LEFT JOIN BOOK_BNR BB
ON U.USER_CODE = BB.USER_CODE;

SELECT USER_NAME
	, USER_CODE
	, USER_ID
	, CARD_NUM
	, CASE  
		WHEN IS_ADMIN = 'Y' THEN 'ADMIN'
		ELSE 'USER'
		END AS IS_ADMIN
	, CARD_STATUS
	, USER_TEL
	, USER_INTRO
	, GENDER
	, (SELECT COUNT(BORROW_CODE)
		FROM book_bnr
		WHERE USER_CODE = users.USER_CODE
		AND RETURN_YN = 'N') AS BORROW_CNT
	, (SELECT COUNT(*)
		FROM BOOK_BNR
		WHERE USER_CODE = users.USER_CODE
		AND RETURN_YN = 'N'
		AND RETURN_DATE > EX_RETURN_DATE) AS OVERDUE_CNT
FROM users
WHERE CARD_NUM BETWEEN 1 AND 3;

-- 서브쿼리로 연체건수
-- 연체의 경우 : 1. RETURN_YN이 N이면서 EX_RETURN_DATE가 지났을 때
-- 				  2. RETURN_DATE가 EX_RETURN_DATE보다 더 클 때

SELECT * FROM book_INFO;

SELECT COUNT(BORROW_CODE)
FROM book_bnr
WHERE USER_CODE = 1
AND RETURN_YN = 'N';

CREATE TABLE BOOK_RESERVATION(
	RESERVE_CODE INT AUTO_INCREMENT PRIMARY KEY
	, USER_CODE INT REFERENCES users(USER_CODE)
	, BOOK_CODE VARCHAR(15) REFERENCES book(BOOK_CODE)
	, RESERVE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP()
	, RESERVE_CANCEL DATETIME
	, RESERVE_STATUS VARCHAR(10) DEFAULT '대기중'
	, RESERVE_CNT INT DEFAULT 0);
	
SELECT * FROM book_reservation;
COMMIT;
DROP TABLE book_reservation;

SELECT * FROM users;
SELECT * FROM book_bnr;

UPDATE USERS
SET
	USER_INTRO = '히말라야솔트'
WHERE USER_CODE = 1;

SELECT RESERVE_DATE
FROM book_reservation
WHERE RESERVE_DATE BETWEEN '24-03-10' AND NOW();

SELECT *
FROM book_reservation
WHERE RESERVE_DATE BETWEEN CONCAT(YEAR(CURDATE()), '-01-01') AND NOW();

INSERT INTO book_reservation (
	USER_CODE
	, BOOK_CODE
) VALUES (

);

UPDATE book_info
SET
	BOOK_BORROW_AVAILABLE = 'Y'
WHERE BOOK_CODE = 'GR0000000003';

SELECT USER_NAME
            , USER_CODE
            , USER_ID
            , CARD_NUM
            , CASE
                WHEN IS_ADMIN = 'Y' THEN 'ADMIN'
                ELSE 'USER'
              END AS IS_ADMIN
            , CARD_STATUS
            , USER_TEL
            , USER_INTRO
            , GENDER
            , POST_CODE
            , USER_ADDR
            , ADDR_DETAIL
            , EMAIL
            , PUBLISH_DATE
            , (SELECT MAX(BORROW_DATE)
                FROM BOOK_BNR
                WHERE USER_CODE = USERS.USER_CODE) AS RECENT_DATE
            , (SELECT COUNT(BORROW_CODE)
                FROM BOOK_BNR
                WHERE USER_CODE = USERS.USER_CODE) AS BORROW_CNT
            , (SELECT COUNT(*)
                FROM BOOK_BNR
                WHERE USER_CODE = USERS.USER_CODE
                AND RETURN_DATE > EX_RETURN_DATE) AS OVERDUE_CNT
        FROM USERS
        WHERE USER_CODE = 1;
        
SELECT * FROM users;