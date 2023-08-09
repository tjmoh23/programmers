SELECT 
    I.ANIMAL_ID, I.NAME
FROM ANIMAL_INS I, ANIMAL_OUTS O
WHERE I.ANIMAL_ID = O.ANIMAL_ID
AND I.DATETIME > O.DATETIME
ORDER BY I.DATETIME 

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/59043?language=oracle
