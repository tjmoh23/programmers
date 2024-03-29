SELECT 
    B.TITLE, B.BOARD_ID, 
    R.REPLY_ID, R.WRITER_ID, 
    R.CONTENTS, TO_CHAR(R.CREATED_DATE, 'YYYY-MM-DD') AS CREATED_DATE
FROM USED_GOODS_BOARD B, USED_GOODS_REPLY R
WHERE B.BOARD_ID = R.BOARD_ID
AND TO_CHAR(B.CREATED_DATE, 'YYYY-MM') = '2022-10'
ORDER BY R.CREATED_DATE, B.TITLE

-- 151138번 문제와 비슷하다
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/164673
