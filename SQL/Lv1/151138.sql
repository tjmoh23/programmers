SELECT
    HISTORY_ID, CAR_ID, TO_CHAR(START_DATE, 'YYYY-MM-DD') AS START_DATE,
    TO_CHAR(END_DATE, 'YYYY-MM-DD') AS END_DATE,
    CASE
    WHEN END_DATE - START_DATE + 1 >= 30 THEN '장기 대여' 
    ELSE '단기 대여' 
    END AS RENT_TYPE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
WHERE TO_CHAR(START_DATE, 'YYYY-MM-DD') LIKE '2022-09%' -- TO_CHAR(START_DATE, 'YYYY-MM') = '2022-09'
ORDER BY HISTORY_ID DESC

-- 굳이 인라인 뷰로 할 필요가 없다.
-- +1을 해줘야 한다. 예를 들어 9/6일에 대여하여 9/6에 반납한다면 1이 되어야 하는데 
-- +1을 해주지 않으면 0이 나오므로 안 된다.
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/151138?language=oracle
