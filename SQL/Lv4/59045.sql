-- 보호소에 들어올 당시에는 중성화1되지 않았지만, 보호소를 나갈 당시에는 중성화된 동물의 아이디와 생물 종, 이름을 조회하는 아이디 순으로 조회


-- 다른 풀이: 조인 사용하기
SELECT a.ANIMAL_ID, a.ANIMAL_TYPE, a.NAME
FROM ANIMAL_INS a join ANIMAL_OUTS b
on a.ANIMAL_ID = b.ANIMAL_ID
WHERE a.SEX_UPON_INTAKE like 'Intact%' and b.SEX_UPON_OUTCOME not like 'Intact%'
ORDER BY a.ANIMAL_ID;


-- 내 풀이: 서브 쿼리 사용하기
SELECT ANIMAL_ID, ANIMAL_TYPE, NAME
FROM ANIMAL_OUTS
WHERE ANIMAL_ID IN (SELECT ANIMAL_ID
                    FROM ANIMAL_INS
                    WHERE SEX_UPON_INTAKE IN ('Intact Female', 'Intact Male'))
AND SEX_UPON_OUTCOME IN ('Spayed Female', 'Neutered Male')
ORDER BY ANIMAL_ID


-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/59045?language=mysql
