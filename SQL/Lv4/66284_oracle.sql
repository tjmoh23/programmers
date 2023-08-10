-- 우유와 요거트를 동시에 구입한 장바구니의 아이디를 조회하는 SQL문 작성


-- UNION ALL / UNION: 합집합
-- INTERSECT: 교집합
-- MINUS:차집합


-- 방법1. INTERSECT로 풀기

SELECT 
    CART_ID
FROM CART_PRODUCTS
WHERE NAME = 'Milk'
INTERSECT
SELECT 
    CART_ID
FROM CART_PRODUCTS
WHERE NAME = 'Yogurt' -- 각각 대괄호 안 써도 된다! 가독성 여부로



  
-- 방법2. IN
  
SELECT CART_ID
FROM CART_PRODUCTS
WHERE NAME IN ('Milk', 'Yogurt')
GROUP BY CART_ID
HAVING COUNT(DISTINCT NAME) = 2
ORDER BY CART_ID



  
-- 방법3. EXISTS
-- 상관 서브쿼리: 서브쿼리에서 메인쿼리의 컬럼을 가져다 쓰는 것
-- 위에서부터 읽기 때문에 이게 가능한 거임
  
SELECT DISTINCT CART_ID
FROM CART_PRODUCTS CP1
WHERE CP1.NAME = 'Milk'
AND EXISTS (
    SELECT 1
    FROM CART_PRODUCTS CP2
    WHERE CP1.CART_ID = CP2.CART_ID
    AND CP2.NAME = 'Yogurt'
)
ORDER BY CART_ID



-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/62284?language=oracle
