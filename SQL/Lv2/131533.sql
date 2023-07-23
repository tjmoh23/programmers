--  상품코드 별 매출액(판매가 * 판매량) 합계 출
SELECT 
    P.PRODUCT_CODE,
    SUM(O.SALES_AMOUNT*P.PRICE) AS SALES
FROM OFFLINE_SALE O, PRODUCT P
WHERE O.PRODUCT_ID = P.PRODUCT_ID
GROUP BY P.PRODUCT_CODE
ORDER BY SALES DESC, P.PRODUCT_CODE

-- 집계함수 사용하여 바로 출력한다
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/131533
