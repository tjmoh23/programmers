-- 2022년 1월의 카테고리 별 도서 판매량을 합산하고, 카테고리(CATEGORY), 총 판매량(TOTAL_SALES) 리스트를 출력하는 SQL문 작성

SELECT 
    B.CATEGORY,
    SUM(S.SALES) AS TOTAL_SALES
FROM BOOK B, BOOK_SALES S
WHERE B.BOOK_ID = S.BOOK_ID
AND TO_CHAR(S.SALES_DATE, 'YYYY-MM') = '2022-01'
GROUP BY B.CATEGORY
ORDER BY B.CATEGORY 

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/144855?language=oracle
