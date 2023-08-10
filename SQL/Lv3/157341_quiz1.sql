-- 상빈님 문제
-- CAR_RENTAL_COMPANY_CAR 테이블과 CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 대여기간(rental_period)을 반영한 CAR_ID 별 대여요금(rental_period * DAILY_FEE) 누적합 리스트(컬럼명 : CUMUL_SUM)를 추가하고 
-- CAR_ID, 대여기간, 일일 대여요금, 대여요금 누적합을 조회하는 SQL문을 작성해주세요.

SELECT 
    CAR_ID,
    RENTAL_PERIOD,
    DAILY_FEE,
    SUM(RENTAL_PERIOD*DAILY_FEE) OVER(PARTITION BY CAR_ID
                        ORDER BY HISTORY_ID
                        ROWS UNBOUNDED PRECEDING) AS CUMUL_SUM
FROM
(
    SELECT
    H.HISTORY_ID,
    H.CAR_ID,
    H.END_DATE - H.START_DATE + 1 AS RENTAL_PERIOD,
    C.DAILY_FEE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H, CAR_RENTAL_COMPANY_CAR C
    WHERE H.CAR_ID = C.CAR_ID
)


-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/157341
