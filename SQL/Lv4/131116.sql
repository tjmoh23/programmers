-- 식품분류별로 가격이 제일 비싼 식품의 분류, 가격, 이름을 조회하는 SQL문을 작성
-- Lv3의 MAX(FAVORITES)와 같은 문제

SELECT CATEGORY, PRICE AS MAX_PRICE, PRODUCT_NAME
FROM FOOD_PRODUCT
WHERE (CATEGORY, PRICE) IN (SELECT CATEGORY, MAX(PRICE)
                          FROM FOOD_PRODUCT
                          GROUP BY CATEGORY)
AND CATEGORY IN ('과자', '국', '김치', '식용유')
ORDER BY PRICE DESC

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/131116
