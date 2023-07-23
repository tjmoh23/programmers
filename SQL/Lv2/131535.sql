-- 동일한 회원이 동일한 상품을 재구매한 데이터를 구하여, 재구매한 회원 ID와 재구매한 상품 ID를 출력

SELECT
    USER_ID, PRODUCT_ID
FROM ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(ONLINE_SALE_ID) >= 2
ORDER BY USER_ID, PRODUCT_ID DESC

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/131536?language=oracle
