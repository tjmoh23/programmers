-- 평균 대여 기간이 7일 이상인 자동차들의 자동차 ID와 평균 대여 기간 출력
-- 소수점 두 번째 자리에서 반올림할 경우 ROUND(변수이름, 1)로 표현한다! 2가 아니라 1이다!

-- 내 풀이
SELECT *
FROM(
    SELECT 
        CAR_ID, 
        ROUND(SUM/COUNT_ID, 1) AS AVERAGE_DURATION
    FROM(
        SELECT
        CAR_ID, COUNT(CAR_ID) AS COUNT_ID,
        SUM(DUR) AS SUM
        FROM(
            SELECT 
                CAR_ID,
                END_DATE - START_DATE + 1 AS DUR
            FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY)
        GROUP BY CAR_ID)
    )
WHERE AVERAGE_DURATION >= 7
ORDER BY AVERAGE_DURATION DESC, CAR_ID DESC

    

-- 더 간단한 풀이
-- GROUP BY 하면 집계함수 쓸 수 있으니 여기서도 바로 SELECT문에서 AVG 쓸 수 있는 거다..
SELECT
    CAR_ID,
    ROUND(AVG(END_DATE - START_DATE + 1), 1) AS AVERAGE_DURATION
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
HAVING ROUND(AVG(END_DATE-START_DATE+1), 1) >= 7
ORDER BY AVERAGE_DURATION DESC, CAR_ID DESC


-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/157342
