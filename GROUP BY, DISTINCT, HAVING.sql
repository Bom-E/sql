
-- group by 통계 쿼리에서 사용

SELECT * FROM emp;

-- 직원들의 급여의 합 조회
SELECT
	SUM(SAL)
FROM emp;

-- 각 직급별 급여의 합
SELECT
	JOB
	, SUM(SAL)
FROM emp
GROUP BY JOB;

-- 부서번호별 인원수 조회
SELECT
	DEPTNO
	,COUNT(EMPNO)
FROM emp
GROUP BY DEPTNO;

-- 다중행 함수 : 데이터의 개수와 상관 없이
--               조회 결과가 1행 나오는 함수
-- EX) SUM(), COUNT() MAX(), MIN(), AVG()

-- 중복을 제거한 데이터 조회
SELECT DISTINCT JOB FROM emp;


-- 직급별로 그룹지어서 
-- 직급별 급여의 합과 급여의 평균, 
-- 커미션의 평균을 조회하는 쿼리문을 작성하세요.
-- 단 조회는 직급 기준 오름차순으로 정렬하여 나타내세요.  
-- 만약에 커미션의 평균이 NULL이라면 0.0으로 조회
SELECT 
	JOB
	, SUM(SAL)
	, AVG(SAL)
	, IFNULL(AVG(COMM), 0.0)
FROM emp
GROUP BY JOB
ORDER BY JOB;

-- 1월에 입사한 사원들을 제외하고 
-- 월별 입사자 수
SELECT
	DATE_FORMAT(HIREDATE, '%m') 입사월
	, COUNT(EMPNO)
FROM emp
WHERE DATE_FORMAT(HIREDATE, '%m') != '01' 
GROUP BY DATE_FORMAT(HIREDATE, '%m');


-- 월별 입사자 수를 조회
-- 월별 입사자 수가 2명 이상인 데이터만 조회
-- (조회 시 월별 입사자 수가 높은 순으로 조회)
SELECT
	DATE_FORMAT(HIREDATE, '%m') 입사월
	, COUNT(EMPNO) 인사인원 
FROM emp
WHERE DATE_FORM(HIREDATE, '%m') != '10'
GROUP BY 입사월
HAVING 입사인원 >= 2
ORDER BY 입사인원 DESC;

-- 사원들의 입사 월을 조회
SELECT HIREDATE
	, SUBSTRING(HIREDATE, 6, 2)
	, DATE_FORMAT(HIREDATE, '%Y-%m-%d')
FROM emp;