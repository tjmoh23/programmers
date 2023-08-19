SELECT 
    CATEGORY, PRICE AS MAX_PRICE, PRODUCT_NAME
FROM FOOD_PRODUCT
WHERE (CATEGORY, PRICE) IN (
                        SELECT
                            CATEGORY,
                            MAX(PRICE) AS MAX_PRICE
                        FROM FOOD_PRODUCT
                        WHERE CATEGORY IN ('과자', '국', '김치', '식용유')
                        GROUP BY CATEGORY)
ORDER BY MAX_PRICE DESC


-- 문제출처: https://school.programmers.co.kr/learn/courses/30/lessons/131116?language=oracle
