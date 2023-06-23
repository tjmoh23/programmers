-- 2022년 3월의 오프라인/온라인 상품 판매 데이터의 판매 날짜, 상품ID, 유저ID, 판매량을 출력하는 SQL문을 작성해주세요.
-- OFFLINE_SALE 테이블의 판매 데이터의 USER_ID 값은 NULL 로 표시해주세요

SELECT DATE_FORMAT(SALES_DATE,"%Y-%m-%d") SALES_DATE,
        PRODUCT_ID,
        USER_ID,
        SALES_AMOUNT
FROM ONLINE_SALE
WHERE SALES_DATE LIKE '2022-03-%'
UNION ALL
SELECT DATE_FORMAT(SALES_DATE,"%Y-%m-%d") SALES_DATE,
        PRODUCT_ID,
        NULL AS USER_ID, -- ★
        SALES_AMOUNT
FROM OFFLINE_SALE
WHERE SALES_DATE LIKE '2022-03-%'
ORDER BY SALES_DATE, PRODUCT_ID, USER_ID



-- 처음에 JOIN으로 할지 UNION으로 할지 고민하다가 UNION은 영 아닌 것 같아서 WITH 구문도 써보고 JOIN 다양한 방법 찾아봤지만 결국에는 UNION을 사용해야했다
-- UNION은 세로로 테이블 붙이는 방법이라 결국에는 테이블 간의 열의 개수가 같아야 하는데 내가 갖고 있는 두 테이블은 나타내고 있는 열의 개수가 다르지 않은가?
-- 방법이 없나 했는데 SELECT 문에서 이를 해결할 수 있는 방법이 있었음..
  
SELECT
  NULL AS USER_ID -- 이 구문은 "USER_ID"라는 열을 생성하고, 해당 열의 값은 NULL로 설정하는 구문이다 ㅠㅠ
                  -- 'NULL'이라고 따옴표를 사용하면 안 되고, NULL이라고 해야한

-- UNION: 세로로 테이블 붙이기
  -- UNION ALL은 중복 제거하지 않고 모두 출력
  -- UNION DISTINCT는 중복 행 제거 후 출
-- JOIN: 가로로 테이블 붙이기

-- DATE_FORMAT("날짜값,날짜컬럼", "%Y"): 날짜 포맷/형식 지정하기
-- Y, M, D 알파벳 대소문자에 따라 나타나는 형식도 다르다
SELECT DATE_FORMAT("2021/01/24 12:33:32", "%Y/%m/%d")

TO_CHAR(SALES_DATE, 'YYYY-MM-DD') AS SALES_DATE -- 이렇게 표할 수도 있다

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/131537
