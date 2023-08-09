-- 입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID와 이름을 ID 순으로 조회하는 SQL문

SELECT 
    O.ANIMAL_ID, 
    O.NAME
FROM ANIMAL_INS I, ANIMAL_OUTS O
WHERE O.ANIMAL_ID = I.ANIMAL_ID(+)
AND I.ANIMAL_ID IS NULL
AND O.ANIMAL_ID IS NOT NULL
ORDER BY O.ANIMAL_ID

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/59042?language=oracle
