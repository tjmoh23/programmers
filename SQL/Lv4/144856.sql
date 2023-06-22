-- 2022년 1월의 도서 판매 데이터를 기준으로 저자 별, 카테고리 별 매출액(TOTAL_SALES = 판매량 * 판매가) 을 구하여 
-- 저자 ID(AUTHOR_ID), 저자명(AUTHOR_NAME), 카테고리(CATEGORY), 매출액(SALES) 리스트를 출력하는 SQL문을 작성해주세요.
-- 결과는 저자 ID를 오름차순으로, 저자 ID가 같다면 카테고리를 내림차순 정렬해주세요.
-- 1) 테이블 모두 JOIN 해서 
-- 2) 저자별로 묶고, 카테고리별로 묶은 다음 1월 동안의 카테고리별 판매량 합한다


SELECT B.AUTHOR_ID, 
        A.AUTHOR_NAME,
        B.CATEGORY,
        SUM(B.PRICE * BS.SALES) AS TOTAL_SALES
FROM BOOK B
JOIN BOOK_SALES BS ON B.BOOK_ID = BS.BOOK_ID
JOIN AUTHOR A ON B.AUTHOR_ID = A.AUTHOR_ID
WHERE SALES_DATE LIKE '2022-01-%'
GROUP BY B.AUTHOR_ID, B.CATEGORY
ORDER BY AUTHOR_ID, CATEGORY DESC


-- SUM을 해야하는데 생각을 못 해서 조금 헷갈린 것 같다

-- 1월 판매량만 뽑는 방법은 다양하다
-- 1) WHERE DATE_FORMAT(SALES_DATE,'%Y-%m') = '2022-01'
-- 2) WHERE TO_CHAR(BS.SALES_DATE, 'YYYY-MM') = '202201' 등..

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/144856
