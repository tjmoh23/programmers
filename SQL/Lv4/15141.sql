SELECT 
    HISTORY_ID,
    (DAILY_FEE*DUR - DAILY_FEE*DISC*0.01*DUR) AS FEE
FROM(
        SELECT
            HISTORY_ID,
            CASE
            WHEN DUR >= 90 THEN (SELECT DISCOUNT_RATE
                                FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                WHERE CAR_TYPE = '트럭'
                                AND DURATION_TYPE = '90일 이상')
            WHEN DUR >= 30 THEN (SELECT DISCOUNT_RATE
                                FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                WHERE CAR_TYPE = '트럭'
                                AND DURATION_TYPE = '30일 이상')
            WHEN DUR >= 7 THEN (SELECT DISCOUNT_RATE
                                FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                WHERE CAR_TYPE = '트럭'
                                AND DURATION_TYPE = '7일 이상')
            ELSE 0 END AS DISC,
            DAILY_FEE, DUR, CAR_ID
        FROM
            (
            SELECT 
                H.HISTORY_ID, C.CAR_ID, 
                (H.END_DATE - H.START_DATE + 1) AS DUR,
                C.DAILY_FEE 
            FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H, CAR_RENTAL_COMPANY_CAR C
            WHERE H.CAR_ID = C.CAR_ID
            AND C.CAR_TYPE = '트럭'
            )
    )
ORDER BY FEE DESC, HISTORY_ID DESC

-- 할인 정보 테이블을 THEN에서 입력해줘야 한다.
-- 바로 할인률을 넣으면 안 된다.
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/151141
