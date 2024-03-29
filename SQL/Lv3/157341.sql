SELECT 
    DISTINCT C.CAR_ID
FROM CAR_RENTAL_COMPANY_CAR C, CAR_RENTAL_COMPANY_RENTAL_HISTORY H
WHERE C.CAR_ID = H.CAR_ID
AND C.CAR_TYPE = '세단'
AND TO_CHAR(H.start_date, 'YYYY-MM') = '2022-10'
ORDER BY C.CAR_ID DESC

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/157341
