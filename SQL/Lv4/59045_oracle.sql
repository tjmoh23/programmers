SELECT 
    O.ANIMAL_ID,
    O.ANIMAL_TYPE,
    O.NAME
FROM ANIMAL_INS I, ANIMAL_OUTS O
WHERE I.ANIMAL_ID = O.ANIMAL_ID
AND I.SEX_UPON_INTAKE LIKE 'Intact%'
AND (O.SEX_UPON_OUTCOME LIKE 'Spayed%' 
OR O.SEX_UPON_OUTCOME LIKE 'Neutered%') -- OR문 괄호로 묶어주기, 보호되었을 때 조건과 입양갈 때의 조건으로 나누어 생각해보자
ORDER BY O.ANIMAL_ID

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/59045?language=oracle
