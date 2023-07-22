-- 내 풀이
SELECT ANIMAL_ID, NAME
FROM(
    SELECT 
        O.ANIMAL_ID, O.NAME,
        ROW_NUMBER() OVER(ORDER BY O.DATETIME - I.DATETIME DESC) AS DUR
    FROM ANIMAL_OUTS O, ANIMAL_INS I
    WHERE O.ANIMAL_ID = I.ANIMAL_ID
    )
WHERE DUR IN (1, 2)
ORDER BY DUR

  
-- 다른 풀이
SELECT ANIMAL_ID, NAME
    FROM (
        SELECT ai.ANIMAL_ID, ai.NAME
        FROM ANIMAL_INS ai, ANIMAL_OUTS ao
        WHERE ai.ANIMAL_ID = ao.ANIMAL_ID 
        ORDER BY ao.DATETIME - ai.DATETIME DESC
          )
WHERE ROWNUM <= 2

-- ROWNUM을 통해 2순위까지도 뽑을 수 있구나 ! ! ! ! ! 
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/59411
