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
	
	
CREATE TABLE BOOK(
   BOOK_CODE VARCHAR(15) PRIMARY KEY,
   BOOK_TITLE VARCHAR(100) NOT NULL,
   BOOK_WRITER VARCHAR(100) NOT NULL,
   BOOK_PUB VARCHAR(30) NOT NULL,
   BOOK_YEAR VARCHAR(20) NOT NULL);

CREATE TABLE BOOK_CATEGORY(
	BOOK_CATE_CODE INT AUTO_INCREMENT PRIMARY KEY,
	BOOK_CATE_NAME VARCHAR(20) NOT NULL ,
	BOOK_CATE_INDEX INT NOT NULL
);

INSERT INTO book_category(
	BOOK_CATE_NAME ,
	BOOK_CATE_INDEX)
	VALUES
	('총류' , 0) ,
	('철학' , 1) ,
	('종교' , 2) ,
	('사회과학' , 3) ,
	('자연과학' , 4) ,
	('기술과학' , 5) ,
	('예술' , 6 ) ,
	('언어' , 7 ) ,
	('문학' , 8 ) ,
	('역사' , 9 );
	
SELECT * FROM book_category;

SELECT * FROM book;
-- DROP TABLE book_info;


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
) VALUES (
	1
	, 'ver054'
	, '1234'
	, '김봄이'
	, '010-1111-2222'
	, 12345
	, '울산시 남구'
	, '그린아카데미'
	, '여자'
	, '1234@gmail.com'
	, 'Y'
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
	
CREATE TABLE BOOK_BORROW(
   BR_CODE INT AUTO_INCREMENT PRIMARY KEY
   , BORROW_DATE DATETIME DEFAULT CURRENT_TIMESTAMP
   , RETURN_YN VARCHAR(2) NOT NULL DEFAULT 'N' -- N, Y
   , RETURN_DATE VARCHAR(20)
   , MEMBER_NUM INT REFERENCES MEMBER_CARD(MEMBER_NUM)
   , BOOK_CODE VARCHAR(15) REFERENCES BOOK(BOOK_CODE)
);


CREATE TABLE book_borrow(
 BR_CODE INT AUTO_INCREMENT PRIMARY KEY
	, BORROW_DATE DATETIME CURRENT_TIMESTAMP
	, RETURN_YN VARCHAR(2) NOT NULL DEFAULT 'N'
	, USER_CODE INT REFERENCES USERS(USER_CODE)
	, BOOK_CODE VARCHAR(20) REFERENCES BOOK(BOOK_CODE));

CREATE TABLE BOOK_RETURN(
 RT_CODE INT AUTO_INCREMENT PRIMARY KEY
	, RETURN_DATE DATETIME CURRENT_TIMESTAMP
	, USER_CODE INT REFERENCES USERS(USER_CODE)
	, BOOK_CODE VARCHAR(20) REFERENCES BOOK(BOOK_CODE));

DROP TABLE BOOK_BORROW;

SELECT * FROM book_borrow;

CREATE TABLE BOOK_INFO(
	BOOK_INFO_NUM INT AUTO_INCREMENT PRIMARY KEY ,
	BOOK_INFO_ATTACHED_FILE_NAME VARCHAR(100) ,		
	BOOK_INFO_ORIGIN_FILE_NAME VARCHAR(100) , 			
	BOOK_BORROW_AVAILABLE VARCHAR(3) DEFAULT 'Y',					
	BOOK_BORROW_CNT INT , 								
	BOOK_INTRO VARCHAR(2000) , 								
	BOOK_CATE_CODE INT REFERENCES BOOK_CATEGORY(BOOK_CATE_CODE) ,
	BOOK_CODE VARCHAR(15) REFERENCES BOOK(BOOK_CODE)); 	

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

-- MEMBER_CARD
CREATE TABLE MEMBER_CARD(
	MEMBER_NUM INT AUTO_INCREMENT PRIMARY KEY
	, MEMBER_REG DATETIME DEFAULT CURRENT_TIMESTAMP
	, MEMBER_PENALTY DATETIME
	, MEMBER_BOOK_CNT INT DEFAULT 0
	, MEMBER_INTRO VARCHAR(200)
	, USER_CODE INT REFERENCES users(USER_CODE)
	, BR_CODE INT REFERENCES book_borrow(BR_CODE)
	, RT_CODE INT REFERENCES BOOK_RETURN(RT_CODE)
	);
	
INSERT INTO member_card(
	MEMBER_NUM
) VALUES(
	1
);

UPDATE member_card
SET
	MEMBER_BOOK_CNT = 1
WHERE MEMBER_NUM = 1;

UPDATE member_card
SET 
	USER_CODE = 1
WHERE MEMBER_NUM = 1;

UPDATE MEMBER_CARD
SET 
	BR_CODE = 1
WHERE MEMBER_NUM = 1;

DELETE FROM member_card;

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
	, USER_CODE INT REFERENCES USERS(USER_CODE)
	, BOOK_CODE VARCHAR(20) REFERENCES BOOK(BOOK_CODE));
	
DROP TABLE book_borrow;
	
SELECT NOW(), DATE_ADD(NOW(), INTERVAL +14 DAY);	

CREATE TABLE BOOK_RETURN(
RT_CODE INT AUTO_INCREMENT PRIMARY KEY
	, RETURN_DATE DATETIME DEFAULT CURRENT_TIMESTAMP
	, USER_CODE INT REFERENCES USERS(USER_CODE)
	, BOOK_CODE VARCHAR(20) REFERENCES BOOK(BOOK_CODE));
	
	SELECT MEMBER_NUM
            , MEMBER_PENALTY
            , MEMBER_INTRO
            , MEMBER_BOOK_CNT
            , MC.USER_CODE
            , USER_NAME
            , USER_TEL
            , MC.BR_CODE
            , BORROW_DATE
            , RETURN_YN
            , EX_RETURN_DATE
            , MC.RT_CODE
            , RETURN_DATE
            , BR.BOOK_CODE
        FROM MEMBER_CARD AS MC
        INNER JOIN USERS AS USER
        ON USER.USER_CODE = MC.USER_CODE
        LEFT JOIN BOOK_BORROW AS BB
        ON MC.BR_CODE = BB.BR_CODE
        LEFT JOIN BOOK_RETURN AS BR
        ON MC.RT_CODE = BR.RT_CODE
        WHERE MC.USER_CODE = 1
        ORDER BY BORROW_DATE DESC;