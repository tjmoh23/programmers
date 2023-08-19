SELECT 
    A.AUTHOR_ID, A.AUTHOR_NAME, 
    BBS.CATEGORY, BBS.TOTAL_SALES AS SALES
FROM AUTHOR A, (
            SELECT 
                B.AUTHOR_ID, B.CATEGORY,
                SUM(B.PRICE*BS.SALES) AS TOTAL_SALES   
            FROM BOOK_SALES BS, BOOK B
            WHERE BS.BOOK_ID = B.BOOK_ID
            AND TO_CHAR(BS.SALES_DATE, 'YYYY-MM') LIKE '2022-01%'
            GROUP BY B.AUTHOR_ID, B.CATEGORY) BBS
WHERE A.AUTHOR_ID = BBS.AUTHOR_ID
ORDER BY A.AUTHOR_ID, BBS.CATEGORY DESC

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/144856?language=oracle
