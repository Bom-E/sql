-- 컬럼명을 조회 할 때는 테이블 명.컬럼명으로 조회
-- 통상적으로 테이블명. 은 생락.
SELECT EMP.EMPNO
   , EMP.ENAME
   , EMP.SAL
FROM emp;

-- 별칭 사용(조회 시 컬럼명을 변경, 컬럼명이 바뀐건 아님)
SELECT EMPNO AS 사번
   , ENAME AS NM
   , SAL 급여
FROM emp;

-- 문법적으로 테이블에도 별칭이 붙을 수 있음.
-- JOIN에 많이 쓰임.
SELECT EMPNO
   , ENAME
   , SAL
FROM emp E;

-- join
SELECT * FROM emp;
SELECT * FROM dept;

-- 사원의 사번, 이름, 부서명을 조회
-- 1. CROSS JOIN(공부를 위해 학습, 실무에서는 안 씀)
SELECT EMPNO, ENAME, DNAME
FROM emp CROSS JOIN DEPT;

-- 2. INNER JOIN(교집합)
-- ON : JOIN하는 두 테이블이 공통적으로 지니는 컬럼의
--  값이 같다 라는 조건을 줄 것!
SELECT EMPNO, ENAME, DNAME,
FROM EMP INNER JOIN dept
ON emp.DEPTNO = dept.DEPTNO;

SELECT EMPNO, ENAME, DNAME,
FROM emp E INNER JOIN dept D
ON E.DEPTNO = D.DEPTNO;
WHERE E.DEPTNO = 20;

-- 데이터 조회 시 정렬하여 출력하기
-- 사원의 모든 정보를 조회하되, 
-- 급여가 낮은 순으로 조회
-- 오름차순 : ASC, 생략가능
-- 내림차순 : DESC

SELECT *
FROM emp
ORDER BY SAL; -- ascending/ descending.

-- 사원의 모든 데이터를 조회하되,
-- 급여 기준 내림차순 정렬
-- 급여가 같다면 사번 기준 오름차순 정렬

SELECT *
FROM emp
ORDER BY SAL DESC, EMPNO;

-- 급여가 200 이상이면서 커미션은 NULL이 아닌
-- 사원의 사번, 이름, 급여, 부서번호, 부서명을 조회
-- 단, 부서번호 기준 오름차순 정렬 후 
-- 부서 번호가 같으면 급여 기준 내림차순으로 정렬!
-- 추가적으로 사번은 '사원번호'라는 별칭을 사용해서 조회

SELECT EMPNO AS 사원번호
   , ENAME
   , SAL
   , EMP.DEPTNO
   , DNAME
FROM emp INNER JOIN DEPT
ON EMP.DEPTNO = dept.DEPTNO 
WHERE SAL >= 200 AND COMM IS NOT NULL
ORDER BY EMP.DEPTNO, SAL DESC;