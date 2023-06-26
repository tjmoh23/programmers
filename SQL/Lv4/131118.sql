-- REST_INFO와 REST_REVIEW 테이블에서 서울에 위치한 식당들의 식당 ID, 식당 이름, 음식 종류, 즐겨찾기수, 주소, 리뷰 평균 점수를 조회하는 SQL문을 작성하기
-- 이때 리뷰 평균 점수는 소수점 둘째 자리까지 표현
-- 1) REST_REVIEW 테이블에서 리뷰 평균 점수를 먼저 구한 후
-- 2) REST_INFO  테이블과 조인
-- 3) HAVING과 LIKE로 주소가 서울인 식당 찾는다

SELECT I.REST_ID, I.REST_NAME, I.FOOD_TYPE, 
        I.FAVORITES, I.ADDRESS, R.SCORE
FROM REST_INFO AS I
JOIN (SELECT REST_ID, ROUND(AVG(REVIEW_SCORE), 2) AS SCORE
FROM REST_REVIEW
GROUP BY REST_ID) AS R ON I.REST_ID = R.REST_ID
HAVING I.ADDRESS LIKE '서울%'
ORDER BY SCORE DESC, FAVORITES DESC


-- 구글링 해보니까 JOIN 할 때 SELECT문을 만들지 않고 원래 형태의 두 테이블을 조인한 후, 바깥 SELECT문에서 리뷰 평균 점수를 출력하는 방법도 있다.
-- WHERE절은 GROUP BY로 묶기 전에 먼저 필터링하는 조건절이다.
-- HAVING은 GROUP BY가 된 후 그룹화된 테이블에서 조건을 설정한다.
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/131118
