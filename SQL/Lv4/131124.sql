-- 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회하는 SQL문을 작성

-- 다른 풀이 -> 뭔가 더 보기 좋다

SELECT M.MEMBER_NAME, R.REVIEW_TEXT, DATE_FORMAT(R.REVIEW_DATE, "%Y-%m-%d")
FROM MEMBER_PROFILE M
JOIN (
    SELECT REVIEW_TEXT, REVIEW_DATE, MEMBER_ID
    FROM REST_REVIEW
    WHERE MEMBER_ID = (
        SELECT MEMBER_ID
        FROM REST_REVIEW
        GROUP BY MEMBER_ID
        ORDER BY COUNT(*) DESC
        LIMIT 1)
    ) R
ON R.MEMBER_ID = M.MEMBER_ID
ORDER BY R.REVIEW_DATE, R.REVIEW_TEXT

  

-- 내 풀이 
-- 좀 비효율적인 듯? 쓸데없이 복잡하다
-- 서브쿼리로 가장 많은 리뷰를 쓴 사람을 찾고
-- 두 테이블을 조인한 테이블에서 서브쿼리 조건에 맞는 작성자를 조건에 건다

WITH BEST AS (SELECT M.MEMBER_ID, M.MEMBER_NAME, COUNT(R.REVIEW_ID) REVIEW_C
FROM REST_REVIEW R
JOIN MEMBER_PROFILE M ON R.MEMBER_ID = M.MEMBER_ID
GROUP BY M.MEMBER_ID
ORDER BY REVIEW_C DESC
LIMIT 1)

SELECT M.MEMBER_NAME, R.REVIEW_TEXT, 
        DATE_FORMAT(R.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM REST_REVIEW R
JOIN MEMBER_PROFILE M ON R.MEMBER_ID = M.MEMBER_ID
WHERE R.MEMBER_ID IN (SELECT MEMBER_ID
                    FROM BEST)
ORDER BY REVIEW_DATE, REVIEW_TEXT


-- 서브 쿼리도 좋지만 바로 조인을 사용해서 코드를 더 보기 좋게 짜는 게 좋을 듯하다
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/131124
