
    SELECT 
        REGEXP_SUBSTR(OPTIONS, '[^,]+', 1, 1) AS "구분1",
        REGEXP_SUBSTR(OPTIONS, '[^,]+', 1, 2) AS "구분2",
        REGEXP_SUBSTR(OPTIONS, '[^,]+', 1, 3) AS "구분3",
        REGEXP_SUBSTR(OPTIONS, '[^,]+', 1, 4) AS "구분4",
        REGEXP_SUBSTR(OPTIONS, '[^,]+', 1, 5) AS "구분5",
        REGEXP_SUBSTR(OPTIONS, '[^,]+', 1, 6) AS "구분6"
    FROM CAR_RENTAL_COMPANY_CAR
    ORDER BY "구분6", "구분5", "구분4", "구분3", "구분2", "구분1"


-- LIKE를 사용하여 푸는 간단한 문제지만, 정규표현식을 사용하여 문제를 풀어보도록 하자. 아직 안 풀었음!  
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/157343?language=oracle
