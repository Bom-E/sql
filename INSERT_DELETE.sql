-- 현재 쿼리 탭에서는 AUTOCOMMIT을 비활성화
SET @@AUTOCOMMIT=0;

-- 데이터의 변경사항을 취소
ROLLBACK;
-- 데이터의 변경사항을 저장
COMMIT;

-- 공부용 테이블 생성
CREATE TABLE student (
   STU_NO INT PRIMARY KEY
   , STU_NAME VARCHAR(10)
   , SCORE INT
   , ADDR VARCHAR(20)
);
-- PRIMARY KEY : 중복, NULL 불가

SELECT * 
FROM student;

-- 데이터 삽입
-- INSERT INTO 테이블명 (컬럼들) VALUES (값들);

INSERT INTO student (STU_NO, STU_NAME, SCORE, ADDR) 
VALUES (6, '김자바', 80, '울산');

INSERT INTO student (STU_NO, STU_NAME) 
VALUES (2, '이자바');
-- 컬럼과 값을 지정하지 않으면 NULL이 들어감
-- 모든 컬럼이 들어갈 필요는 없음, 하지만 순서를 잘 지켜야함
-- 예외로 PRIMARY KEY는 반드시 명시해야함.

INSERT INTO student (STU_NAME, STU_NO) 
VALUES ('최자바', 3);
COMMIT;

INSERT INTO student (STU_NAME, SCORE) 
VALUES ('최자바', 90);

-- 컬럼명을 명시하지 않으면 테이블 생성 시 
-- 작성한 컬럼순으로 데이터를 삽입
INSERT INTO student 
VALUES (5, '홍길동', 80, '서울');
COMMIT;

SELECT * FROM student;
-- 데이터 삭제
-- DELETE FROM 테이블명 [WHERE 조건];
-- [] : 생략 가능한 조건
DELETE FROM student;
ROLLBACK;

-- 학번이 1번인 학생을 삭제하는 퀴리
DELETE FROM student 
WHERE STU_NO = 1;

-- 학번이 3번 이상 이면서 주소가 NULL인 학생을 삭제하는 쿼리
DELETE FROM student 
WHERE ADDR IS NULL 
AND STU_NO >= 3;
COMMIT;