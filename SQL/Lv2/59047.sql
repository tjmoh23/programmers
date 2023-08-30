-- 이름에 'el'이 들어가는 강아지 정보 출력하기
-- 이름을 모두 대문자(소문자)로 변환후 el이 들어가는지 확인한ㄷ.
-- UPPER() 또는 LOWER()

SELECT
    ANIMAL_ID, NAME
FROM ANIMAL_INS 
WHERE UPPER(NAME) LIKE '%EL%' 
AND ANIMAL_TYPE = 'Dog'
ORDER BY NAME


-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/59047?language=oracle
