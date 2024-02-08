-- 데이터 조회
# 이것도 주석

# 데이터 조회 1
# SELECT 컬럼명들 FROM 테이블명;

-- 1. EMP 테이블에서 모든 사원의 사번, 이름, 급여 정보 조회
SELECT EMPNO, ENAME, SAL FROM emp;

-- 2. 모든 사원의 이름, 직급, 입사일, 부서번호 조회
SELECT ENAME, JOB, HIREDATE, DEPTNO FROM emp;

# CNTRL + SHIFT + F9 + 실행 할 부분에 커서 두기

-- 3. 모든 사원의 모든 정보 조회
-- *(에스테리스크) : ALL
SELECT * FROM emp;

-- 조건을 통해 조회
-- 급여가 300 이상인 사원들의 사번, 사원명, 급여 조회
SELECT EMPNO, ENAME, SAL -- SELECT 콜론명
FROM emp  -- FROM 테이블명
WHERE SAL >= 600; -- WHERE 조건

-- 직급이 대리인 사원들의 사원명, 직급, 급여를 조회
SELECT ENAME, JOB, SAL
FROM emp
WHERE JOB = '대리';

-- 직급이 과장이고 급여가 400 이상인 사원들의 모든 정보 조회
-- 같지않다 : !=(느낌표 + =), <>
SELECT *
FROM emp
WHERE JOB = '과장' AND SAL >= 400;

-- COMM 컬럼이 NULL인 사원의 모든 정보를 조회
SELECT *
FROM emp
WHERE COMM IS NULL;

-- WHERE COMM IS NOT NULL;

-- 급여가 500 미만이거나 700 이상이면서 직급은 차장이고 
-- COMM은 NULL인 사원들의 사번, 사원명, 급여, 직급, 커미션 정보 조회

SELECT EMPNO, ENAME, SAL, JOB, COMM
FROM emp
WHERE (SAL < 500 OR SAL >= 700) 
AND JOB = '차장' AND COMM IS NULL;

-- AND와 OR의 우선 조건을 중시해야 함
-- 둘이 섞여있을때는 OR에 괄호로 우선순위 배정



-- LIKE 연산자, 와일드 카드
-- 와일드 카드 : %, _
-- '%' : 글자 수 조건 없이 부분 조건 조회
-- '_' : 언더바 하나가 글자 수 하나와 자리

-- 사원명에서 '이'라는 글자가 포함 된 사원 조회
SELECT *
FROM emp
WHERE ENAME LIKE '%이%'; 

-- 사원명이 세 글자아면서 중간 글자가 '이' 인 사원 조회
SELECT *
FROM emp
WHERE ENAME LIKE '_이_'; 

-- 사원명에서 세번째 글자가 '이'인 사원 조회
-- 앞에 두 글자가 있고 뒤에 어느 글자 수가 들어와도 상관없음
SELECT *
FROM emp
WHERE ENAME LIKE '__이%'; 

-- UPPRT(); -> 대문자로 변경
-- LOWER(); -> 소문자로 변경 
SELECT 'java', UPPER('java'), LOWER('JAVA');

-- BOARD 테이블에서 제목에 java라는 글자가 포함된 
-- 게시글의 모든 내용을 조회하는 쿼리.
-- 단, java라는 글자는 대,소문자 구분하지 않고 조회

SELECT TITLE
FROM BOARD
WHERE TITLE LIKE CONCAT('%java%');

SELECT CONCAT('AA', 'BB', 'CC');