-- 완료된 중고 거래의 총금액이 70만 원 이상인 사람의 회원 ID, 닉네임, 총거래금액을 조회하는 SQL문

SELECT 
    U.USER_ID, U.NICKNAME, S.TOTAL_SALES
FROM USED_GOODS_USER U, (SELECT 
                            WRITER_ID,
                            SUM(PRICE) AS TOTAL_SALES 
                        FROM USED_GOODS_BOARD
                        WHERE STATUS = 'DONE'
                        GROUP BY WRITER_ID
                        HAVING SUM(PRICE) >= 700000) S
WHERE U.USER_ID = S.WRITER_ID
ORDER BY TOTAL_SALES 


-- 문제 풀이: https://school.programmers.co.kr/learn/courses/30/lessons/164668?language=oracle
