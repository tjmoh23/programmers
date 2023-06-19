SELECT CAR_ID, 
    CASE 
    WHEN 
        COUNT(DISTINCT 
              CASE 
              WHEN START_DATE <= '2022-10-16' AND END_DATE >= '2022-10-16' THEN 1 
              END) > 0 THEN '대여중'
    ELSE '대여 가능' 
    END AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY 1
ORDER BY 1 DESC

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/157340
