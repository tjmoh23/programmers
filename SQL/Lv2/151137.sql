--  '통풍시트', '열선시트', '가죽시트' 중 하나 이상의 옵션이 포함된 자동차가 자동차 종류 별로 몇 대인지 출력

SELECT 
    CAR_TYPE, COUNT(OPTIONS) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE '%시트%' -- WHERE OPTIONS IN ('통풍시트', '열선시트', '가죽시트') 는 안 될까? 아무것도 안 나온다 
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE


-- IN은 포함이 아니라 (= OR) 의 의미이다.
-- 컬럼값이 통풍시트인지, 열선시트인지, 가죽시트인지 하나 하를 확인하는 거다.
-- ★IN은 포함된 게 있는지 보는 게 아니다!!!!!!!★

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/151137
