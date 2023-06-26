-- 년, 월, 성별 별로 상품을 구매한 회원수를 집계하는 SQL문을 작성
-- 성별 정보가 없는 경우 결과에서 제외

SELECT DATE_FORMAT(O.SALES_DATE, '%Y') AS YEAR,
        DATE_FORMAT(O.SALES_DATE, '%m') AS MONTH,
        U.GENDER, COUNT(DISTINCT U.USER_ID) AS USERS
FROM USER_INFO U
JOIN ONLINE_SALE O ON U.USER_ID = O.USER_ID
WHERE U.GENDER IS NOT NULL
GROUP BY YEAR, MONTH, GENDER
ORDER BY YEAR, MONTH, GENDER

-- 처음에는 DISTINCT를 사용하지 않고 USER_ID를 COUNT하였는데 자꾸 오류가 발생했다.
-- DISTINCT를 넣어주었더니 오류 해결
-- '동일한 날짜, 회원 ID, 상품 ID 조합에 대해서는 하나의 판매 데이터만 존재합니다' 라는 문구를 발견하지 못 했다!

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/131532
