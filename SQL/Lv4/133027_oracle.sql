-- 7월 아이스크림 총 주문량과 상반기의 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛을 조회

-- 내 풀이

SELECT FLAVOR
FROM(
    SELECT 
        FLAVOR,
        SUM(TOTAL_ORDER) AS TOTAL_ORDER
    FROM(
            (SELECT *
            FROM FIRST_HALF H)
            UNION ALL
            (SELECT *
            FROM JULY)
        )
    GROUP BY FLAVOR
    ORDER BY TOTAL_ORDER DESC
    )
FETCH FIRST 3 ROWS WITH TIES

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/133027?language=oracle
