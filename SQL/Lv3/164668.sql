SELECT  U.USER_ID,
        U.NICKNAME,
        SUM(PRICE) AS TOTAL_SALES
FROM USED_GOODS_BOARD B JOIN USED_GOODS_USER U
ON B.WRITER_ID = U.USER_ID
WHERE B.STATUS = 'DONE'
GROUP BY U.USER_ID
HAVING TOTAL_SALES >= 700000
ORDER BY TOTAL_SALES

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/164668
