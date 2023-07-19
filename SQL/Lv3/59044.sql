-- 아직 입양을 못 간 동물 중, 가장 오래 보호소에 있었던 동물 3마리의 이름과 보호 시작일을 조회

SELECT NAME, DATETIME
FROM
    (
    SELECT 
    NAME, DATETIME, 
    DENSE_RANK() OVER(ORDER BY DATETIME) AS RANK
    FROM ANIMAL_INS
    WHERE ANIMAL_ID NOT IN (SELECT ANIMAL_ID
                            FROM ANIMAL_OUTS)
    )
WHERE RANK IN (1, 2, 3)

-- WHERE NOT IN 사용하는 방법!
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/59044
