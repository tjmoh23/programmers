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
FETCH FIRST 3 ROWS WITH TIES -- 버전에 따라 사용 못 할 수 도 있다. 원래 순위 관련해서 몇 개만 추출할 경우 WINDOW 함수로 무조건 사용했어야 했음!



-- 상빈님 문제 풀이

SELECT FLAVOR
FROM (
SELECT 
    F.FLAVOR, SUM(J.TOTAL_ORDER + F.TOTAL_ORDER) AS TOTAL_ORDER,
    ROW_NUMBER() OVER(ORDER BY SUM(J.TOTAL_ORDER + F.TOTAL_ORDER) DESC) AS RN
FROM FIRST_HALF F, 
(
SELECT FLAVOR, SUM(TOTAL_ORDER) AS TOTAL_ORDER
FROM JULY
GROUP BY FLAVOR
) J
WHERE F.FLAVOR = J.FLAVOR
GROUP BY F.FLAVOR
    )
WHERE RN <= 3



-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/133027?language=oracle
