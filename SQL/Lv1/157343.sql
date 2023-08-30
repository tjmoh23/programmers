-- 옵션 중에서 '열선시트'가 하나라도 포함된 자동차 ID와 옵션1~6을 조회하는 쿼리
SELECT
    *    
FROM(
    SELECT
        CAR_ID,
        REGEXP_SUBSTR(OPTIONS, '[^,]+', 1, 1) AS OPTION1,
        REGEXP_SUBSTR(OPTIONS, '[^,]+', 1, 2) AS OPTION2,
        REGEXP_SUBSTR(OPTIONS, '[^,]+', 1, 3) AS OPTION3,
        REGEXP_SUBSTR(OPTIONS, '[^,]+', 1, 4) AS OPTION4,
        REGEXP_SUBSTR(OPTIONS, '[^,]+', 1, 5) AS OPTION5,
        REGEXP_SUBSTR(OPTIONS, '[^,]+', 1, 6) AS OPTION6
    FROM CAR_RENTAL_COMPANY_CAR
    ORDER BY OPTION6, OPTION5, OPTION4, OPTION3, OPTION2, OPTION1
    )
WHERE '열선시트' = ANY(OPTION1, OPTION2, OPTION3, OPTION4, OPTION5, OPTION6)


-- LIKE를 사용하여 푸는 간단한 문제이지만 이런 식으로 정규 표현식을 사용해볼 수 있다.
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/157343?language=oracle
