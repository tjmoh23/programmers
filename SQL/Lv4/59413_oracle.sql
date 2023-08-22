
-- 내 풀이

SELECT
    HOUR,
    COUNT(ANIMAL_ID) AS COUNT
FROM(
        SELECT H.HOUR, A.ANIMAL_ID
        FROM (
                SELECT
                    ROWNUM - 1 AS HOUR
                FROM ANIMAL_OUTS
                WHERE ROWNUM <= 24)  H, 
                (    
                    SELECT 
                        ANIMAL_ID,
                        TO_CHAR(DATETIME, 'HH24') AS HOUR
                    FROM ANIMAL_OUTS ) A
        WHERE H.HOUR = A.HOUR(+)
    )
GROUP BY HOUR
ORDER BY HOUR



-- 다른 풀이

SELECT A.HOUR, NVL(B.CNT, 0) AS COUNT
FROM (
    SELECT ROWNUM - 1 AS HOUR
    FROM ANIMAL_OUTS
    WHERE ROWNUM - 1 < 24
    ) A,
    (
    SELECT TO_CHAR(DATETIME, 'HH24') AS HOUR, COUNT(ANIMAL_ID) AS CNT
    FROM ANIMAL_OUTS
    GROUP BY TO_CHAR(DATETIME, 'HH24')
    ) B
WHERE A.HOUR = B.HOUR(+)
ORDER BY A.HOUR


-- ROWNUM 사용하여 24시간 테이블 만들어 준 후, HH24로 DATETIME을 24시간으로 나타낸다. 그 후 JOIN
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/59413
