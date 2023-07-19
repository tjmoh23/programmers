
-- 서브 쿼리로 풀기
SELECT
    PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD,
    CATEGORY, PRICE
FROM FOOD_PRODUCT
WHERE PRICE IN (SELECT MAX(PRICE) -- IN 대신 = 을 사용해도 된다.
		            FROM FOOD_PRODUCT)


-- 인라인 뷰로 풀기
SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, PRICE
FROM (
SELECT
    PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, PRICE,
    RANK() OVER(ORDER BY PRICE DESC) AS RANK
FROM FOOD_PRODUCT
    )
WHERE RANK = 1 



-- ORACLE에서 MySQL에서의 LIMIT 사용하기
SELECT *
FROM FOOD_PRODUCT
ORDER BY PRICE DESC
FETCH FIRST 1 ROWS ONLY;


-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/131115
