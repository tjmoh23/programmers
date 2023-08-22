
-- 내 풀이

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
-- ROUND는 반올림을 하기 때문에 1.5 이상부터는 2로 계산하므로 오답이다!
-- TRUNC 함수를 사용해야한다
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/131530
