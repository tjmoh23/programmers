-- 문자열 자르기, 문자열 결합하기

SELECT
    USER_ID, NICKNAME, 
    (CITY ||' '|| STREET_ADDRESS1 ||' '|| STREET_ADDRESS2) AS "전체주소",
    (SUBSTR(TLNO, 1, 3)||'-'||SUBSTR(TLNO, 4, 4)||'-'||SUBSTR(TLNO, 8, 4)) AS "전화번호"
FROM(
        SELECT
            WRITER_ID
        FROM USED_GOODS_BOARD 
        GROUP BY WRITER_ID 
        HAVING COUNT(BOARD_ID) >= 3
    ) B, USED_GOODS_USER U
WHERE B.WRITER_ID = U.USER_ID
ORDER BY USER_ID DESC


-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/164670?language=oracle
