
SELECT
    HOUR,
    COUNT(HOUR) AS COUNT
FROM (
    SELECT 
        EXTRACT (HOUR FROM CAST(DATETIME AS TIMESTAMP)) AS HOUR
    FROM ANIMAL_OUTS
    )
WHERE HOUR BETWEEN 9 AND 19
GROUP BY HOUR
ORDER BY HOUR


-- DATETIME 컬럼에서 시간만 추출하기 위해 TIMESTAMP로 변환한다.
-- 그후 EXTRACT를 사용하여 시간만 추출한다.

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/59412
