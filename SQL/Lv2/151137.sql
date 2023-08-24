--  '통풍시트', '열선시트', '가죽시트' 중 하나 이상의 옵션이 포함된 자동차가 자동차 종류 별로 몇 대인지 출력

-- 내 풀이

SELECT 
    CAR_TYPE, COUNT(OPTIONS) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE '%시트%' -- WHERE OPTIONS IN ('통풍시트', '열선시트', '가죽시트') 는 안 될까? 아무것도 안 나온다 
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE


-- IN은 포함이 아니라 (= OR) 의 의미이다.
-- 컬럼값이 통풍시트인지, 열선시트인지, 가죽시트인지 하나 하나 확인하는 거다.
-- ★IN은 포함된 게 있는지 보는 게 아니다!!!!!!!★
-- 추가로 이 문제에서는 OPTIONS 컬럼 전체가 하나의 문자열 이런 느낌

    
-- 또 다른 풀이

SELECT 
    CAR_TYPE,
    COUNT(CAR_ID) AS CARS
FROM CAR_RENTAL_COMPANY_CAR 
WHERE REGEXP_LIKE(OPTIONS, '가죽시트|통풍시트|열선시트') -- 정규 표현식
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE 

-- WHERE OPTIONS LIKE '%통풍시트%'
-- OR OPTIONS LIKE '%가죽시트%'
-- OR OPTIONS LIKE '%열선시트% 로 일일이 조건을 다는 것보다 정규 표현식으로 한번에 표현하는 게 효율적!


-- 다른 풀이

SELECT DISTINCT CAR_TYPE, COUNT(*) OVER(PARTITION BY CAR_TYPE) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE '%통풍시트%' OR OPTIONS LIKE '%열선시트%' OR OPTIONS LIKE '%가죽시트%'
ORDER BY CAR_TYPE ASC;



-- WINDOW 함수 사용하기
-- 집계함수를 윈도우 함수로 바꾸는 방법
-- 1. GROUP BY 절을 지웁니다.
-- 2. 윈도우함수 SELECT절에 적용시킵니다
-- 3. SELECT절에 DISTINCT 추가합니다.


-- 윈도우 함수는 집계함수로 못 바꾼다.

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/151137
