-- 7월 아이스크림 총 주문량과 상반기의 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛을 조회하는 SQL 문을 작성
-- 7월 테이블과 상반기 테이블을 행 방향으로 합쳐서 푼다

-- JOIN 사용한 풀이
SELECT F.FLAVOR
FROM FIRST_HALF F
JOIN (SELECT FLAVOR, SUM(TOTAL_ORDER) AS TOTAL_ORDER
        FROM JULY 
        GROUP BY FLAVOR) AS J
ON F.FLAVOR = J.FLAVOR
ORDER BY (F.TOTAL_ORDER + J.TOTAL_ORDER) DESC -- 이런 방법으로 순서를 정할 수도 있다
LIMIT 3

  
-- UNION ALL 사용(내 풀이)
WITH FJ AS (SELECT *
FROM FIRST_HALF
UNION ALL
SELECT *
FROM JULY)

SELECT FLAVOR
FROM FJ
GROUP BY FLAVOR
ORDER BY SUM(TOTAL_ORDER) DESC
LIMIT 3

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/133027
