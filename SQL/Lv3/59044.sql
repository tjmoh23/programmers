-- 아직 입양을 못 간 동물 중, 가장 오래 보호소에 있었던 동물 3마리의 이름과 보호 시작일을 조회

SELECT NAME, DATETIME
FROM
    (
    SELECT 
    NAME, DATETIME, 
    ROW_NUMBER() OVER(ORDER BY DATETIME) AS RANK -- ※ 주의!
    FROM ANIMAL_INS
    WHERE ANIMAL_ID NOT IN (SELECT ANIMAL_ID
                            FROM ANIMAL_OUTS)
    )
WHERE RANK IN (1, 2, 3)

-- WHERE NOT IN 사용하는 방법!
-- ★DENSE_RANK가 아니라 ROW_NUMBER를 사용해야 한다!★
-- 공동 순위가 있을 경우, DENSE_RANK를 사용하면 3마리 이상의 값이 나올 수 있다.
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/59044
