-- WHERE절에서 서브 쿼리 사용하기
-- 1) 헤비 유저로 해당되는 HOST_ID를 서브 쿼리로 찾은 후
-- 2) 해당 유저의 정보 출력하기

SELECT *
FROM PLACES
WHERE HOST_ID IN (
    SELECT HOST_ID
    FROM PLACES
    GROUP BY HOST_ID
    HAVING COUNT(ID) > 1);
ORDER BY ID

-- 처음에는 아래처럼 풀고 제출했는데 'Operand should contain 1 column(s)' 이런 오류가 발생했다
-- 주로 WHERE절에서 서브쿼리를 사용할 때 발생하는 오류다
-- '왼쪽에 컬럼 1개여야 비교 가능하다'는 의미 -> WHERE HOST_ID IN에서 HOST_ID만 1개 있으니 너도 컬럼 하나만 갖고 오라는 뜻인 듯?
-- 따라서 컬럼 수를 일치시켜주면 해결 가
-- COUNT(HOST_ID)를 지우니 정답 처리되었고, NAME을 넣었을 때도 똑같은 오류가 떴다

SELECT ID, NAME, HOST_ID
FROM PLACES
WHERE HOST_ID IN (
    SELECT COUNT(HOST_ID), HOST_ID
    FROM PLACES
    GROUP BY HOST_ID
    HAVING COUNT(ID) > 1
)
ORDER BY ID

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/77487
