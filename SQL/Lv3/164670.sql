-- 중고 거래 게시물을 3건 이상 등록한 사용자의 정보 출력하기
-- 전화번호는 하이픈 문자열(-) 삽입하여 출력하기

SELECT USER_ID, 
    NICKNAME,
    CONCAT(CITY, ' ', STREET_ADDRESS1, ' ', STREET_ADDRESS2) AS 전체주소,
    CONCAT(SUBSTR(TLNO, 1, 3), '-', SUBSTR(TLNO, 4, 4), '-', SUBSTR(TLNO, 8, 4)) AS 전화번호 
FROM USED_GOODS_USER
WHERE USER_ID IN (
    SELECT WRITER_ID
    FROM USED_GOODS_BOARD 
    GROUP BY WRITER_ID
    HAVING COUNT(WRITER_ID) >= 3)
ORDER BY USER_ID DESC

-- 하이픈 문자를 추가하기 위해서 SUBSTR를 사용하여 문자열을 일부만 출력하면서 '-'를 넣어주었다
-- 문자열 일부 출력하기: SUBSTR(문자열, 시작 위치, 길이)
-- 문자열은 0이 아니라 1부터 세면 된다.

-- WHERE절에서 IN 대신 EXISTS를 사용할 수 있다.
-- EXISTS와 IN의 차이?
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/164670
