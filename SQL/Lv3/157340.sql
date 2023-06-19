-- 풀이 1
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
GROUP BY 1 -- SELECT문에서 순서대로 
ORDER BY 1 DESC


  
-- 풀이 2
SELECT CAR_ID, 
    MAX(IF('2022-10-16' BETWEEN START_DATE AND END_DATE, '대여중', '대여 가능')) AS 'AVAILABILITY'
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC

  
  
-- 내 풀이(실패)

-- 대여 중일 경우는 
-- 1. 시점 또는 종점이 10/16인 것
-- 2. 시점과 종점 사이에 10/16이 포함되는 것 
-- 즉, 시점이 10/16 보다 작으며 종점이 10/16 보다 큰 것
-- 그 외 나머지는 모두 대여 가능

SELECT CAR_ID,
   (CASE
        WHEN (START_DATE = '2022-10-16' OR END_DATE = '2022-10-16') 
        OR (START_DATE < '2022-10-16' AND END_DATE > '2022-10-16' ) THEN '대여중' -- 나눌 필요없이 ≤, ≥ 사용하면 되는 거였다
        ELSE '대여 가능' -- 여기서 대여 여부 나누지 않고 바깥에서 한 번 더 상황 만들어야 한다
     END) AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
ORDER BY CAR_ID DESC
