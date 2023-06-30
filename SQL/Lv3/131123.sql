-- 음식종류별로 즐겨찾기수가 가장 많은 식당의 음식 종류, ID, 식당 이름, 즐겨찾기수를 조회하는 SQL문을 작성

-- 정답 풀이
-- 서브쿼리로 음식 종류별 가장 많이 되어 있는 즐겨찾기 수를 찾은 후,
-- 이에 맞는 음식 종류와 즐겨찾기 수를 찾는 조건절 
SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM REST_INFO
WHERE (FOOD_TYPE, FAVORITES) IN (
                    SELECT FOOD_TYPE, MAX(FAVORITES)
                    FROM REST_INFO
                    GROUP BY FOOD_TYPE)
ORDER BY FOOD_TYPE DESC


  
-- 내 풀이(실패)
-- 서브쿼리 만들지 않고 한 번에 할 수 있지 않을까 했는데 계속 안 됐다
-- 이렇게 실행할 경우, 즐겨찾기가 가장 많은 식당의 정보가 아닌 테이블에서 가장 상단의 식당 정보를 가져오는 거다
-- 정답 풀이와 왜 다를까? ? ?
SELECT FOOD_TYPE, REST_ID, REST_NAME, MAX(FAVORITES) AS FAVORITES
FROM REST_INFO
GROUP BY FOOD_TYPE
ORDER BY FOOD_TYPE DESC


-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/131123
