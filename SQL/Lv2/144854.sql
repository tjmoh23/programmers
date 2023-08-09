SELECT 
    B.BOOK_ID,
    A.AUTHOR_NAME,
    TO_CHAR(B.PUBLISHED_DATE, 'YYYY-MM-DD') AS PUBLISHED_DATE
FROM BOOK B, AUTHOR A
WHERE B.AUTHOR_ID = A.AUTHOR_ID
AND B.CATEGORY = '경제'
ORDER BY PUBLISHED_DATE

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/144854?language=oracle
