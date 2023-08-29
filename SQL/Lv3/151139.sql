-- 2022년 8월부터 2022년 10월까지 총 대여 횟수가 5회 이상인 자동차들에 대해서 
-- 해당 기간 동안의 월별 자동차 ID 별 총 대여 횟수(컬럼명: RECORDS) 리스트를 출력하는 SQL문을 작성
-- 특정 월의 총 대여 횟수가 0인 경우에는 결과에서 제외


-- 정답 풀이

SELECT MONTH(START_DATE) AS MONTH, CAR_ID, COUNT(HISTORY_ID) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE CAR_ID IN (
        SELECT CAR_ID
        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
        WHERE (DATE_FORMAT(START_DATE, '%Y-%m') BETWEEN '2022-08' AND '2022-10')
        GROUP BY CAR_ID
        HAVING COUNT(CAR_ID) >= 5
    ) AND (DATE_FORMAT(START_DATE, '%Y-%m') BETWEEN '2022-08' AND '2022-10')
GROUP BY MONTH, CAR_ID
HAVING RECORDS > 0
ORDER BY MONTH ASC, CAR_ID DESC;



-- 내 풀이

SELECT DATE_FORMAT(START_DATE, '%m') MONTH,
        CAR_ID,
        COUNT(HISTORY_ID) RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE START_DATE >= '2022-08-01' AND START_DATE < '2022-11-01'
AND CAR_ID IN (SELECT CAR_ID
                FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY -- ★ 
                GROUP BY CAR_ID
                HAVING COUNT(CAR_ID) >= 5)
GROUP BY MONTH, CAR_ID
HAVING RECORDS > 0
ORDER BY MONTH, CAR_ID DESC;


-- 왜 정답이 아닌가? 고민했는데
-- WHERE IN절 안에서 WHERE (DATE_FORMAT(START_DATE, '%Y-%m') BETWEEN '2022-08' AND '2022-10') 조건절을 한 번 더 써줘야 했다
-- 나는 처음에 WHERE 조건으로 2022년 8월 ~ 2022년 10월에 해당하는 경우만 카운팅하도록 짰기 때문에, 한 번만 쓰면 된다고 생각했었다
-- 왜 조건을 두 번 사용하여야 할까?
-- ★ WHERE AND IN 에서의 SELECT절은 전체 데이터에서 총 대여 횟수가 5회 이상인 CAR_ID이기 때문에 8~10월이 아니더라도 다른 월 CAR_ID도 포함될 수 있다
-- 즉, 위에서 WHERE절로 시간을 한 번 조건을 걸어줬더라도, WHERE IN 절에서의 SELECT절은 별개의 조건이기 때문에 한 번 더 날짜 조건을 걸어 줘야하는 거임!!




2023. 08. 29. 다른 풀이 1
-- 정답 포맷이 달라서 자꾸 오답처리되었었음
-- 성능이 좋지 못한 풀이
SELECT 
    TO_NUMBER(TO_CHAR(START_DATE, 'MM')) AS MONTH,  -- TO_NUMBER로 한번 더 감싸서 정답 포맷으로 맞춰준다! (01 -> 1)
    CAR_ID,
    COUNT(HISTORY_ID) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE CAR_ID IN (
                    SELECT CAR_ID
                    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                    WHERE TO_CHAR(START_DATE, 'YYYY-MM') BETWEEN '2022-08' AND '2022-10' 
                    GROUP BY CAR_ID
                    HAVING COUNT(CAR_ID) >= 5
                )
AND TO_CHAR(START_DATE, 'YYYY-MM') BETWEEN '2022-08' AND '2022-10'                
GROUP BY TO_CHAR(START_DATE, 'MM'), CAR_ID
HAVING COUNT(HISTORY_ID) != 0
ORDER BY MONTH, CAR_ID DESC


2023. 08. 29. 다른 풀이 2
-- 성능이 위보다 더 좋은 풀이
-- 인라인 뷰 + 윈도우 함수
SELECT
    TO_NUMBER(MONTH) AS MONTH, CAR_ID, RECORDS
FROM (
    SELECT DISTINCT
        CAR_ID, 
        TO_CHAR(START_DATE, 'MM') AS MONTH,
        COUNT(HISTORY_ID) OVER(PARTITION BY CAR_ID) AS CNT, -- 8월부터 10월까지 자동차별 총 대여횟수
        COUNT(HISTORY_ID) OVER(PARTITION BY TO_CHAR(START_DATE, 'MM'), CAR_ID) AS RECORDS -- 8월부터 10월까지 월별 자동차별 대여횟수
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
    WHERE START_DATE
    BETWEEN TO_DATE('2022-08-01', 'YYYY-MM-DD')
        AND TO_DATE('2022-10-31', 'YYYY-MM-DD')
    )
WHERE CNT >= 5
ORDER BY MONTH, CAR_ID DESC;



-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/151139
