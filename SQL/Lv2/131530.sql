
SELECT 
    PRICE_GROUP,
    COUNT(PRODUCT_CODE) AS PRODUCTS
FROM
    (
        SELECT
            ROUND((PRICE/10000), 0)*10000 AS PRICE_GROUP,
            PRODUCT_CODE
        FROM PRODUCT
    )
GROUP BY PRICE_GROUP
ORDER BY PRICE_GROUP 

-- 왜 오답일까?
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/131530
