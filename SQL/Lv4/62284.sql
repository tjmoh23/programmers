-- 우유와 요거트를 함께 구입한 CART_ID 출력하기

-- 1. WHERE절 서브 쿼리로 풀기
SELECT DISTINCT CART_ID
FROM CART_PRODUCTS
WHERE NAME = 'YOGURT' 
AND CART_ID IN (
    SELECT CART_ID
    FROM CART_PRODUCTS
    WHERE NAME = 'MILK'
    )
ORDER BY A.CART_ID;


-- 2. SELF JOIN으로 풀기
SELECT DISTINCT A.CART_ID
FROM CART_PRODUCTS A, CART_PRODUCTS B
WHERE A.CART_ID = B.CART_ID
AND (A.NAME = 'MILK' AND B.NAME = 'YOGURT')
ORDER BY A.CART_ID;


-- 처음 풀이는 교집합을 생각해서 아래와 같이 풀었지만
-- ★MySQL은 INTERSECT(교집합)와 MINUS 연산을 지원하지 않기 때문에★ 오류가 났다
  
SELECT DISTINCT(CART_ID)
FROM CART_PRODUCTS
WHERE NAME = 'Milk'
INTERSECT
SELECT DISTINCT(CART_ID)
FROM CART_PRODUCTS
WHERE NAME = 'Yogurt' 


-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/62284