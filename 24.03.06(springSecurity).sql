SELECT * FROM basic_board;

-- USER, MANAGER, ADMIN
CREATE TABLE SECURITY_MEMBER(
	MEMBER_ID VARCHAR(50) PRIMARY KEY
	, MEMBER_NAME VARCHAR(50) NOT NULL
	, MEMBER_PW VARCHAR(100) NOT NULL
	, MEMBER_ROLL VARCHAR(50) DEFAULT 'USER'
);

SELECT * FROM security_member;

DROP TABLE security_member;

UPDATE  security_member
SET
	MEMBER_ROLL = 'MANAGER'
WHERE MEMBER_ID = 'manager';

COMMIT;