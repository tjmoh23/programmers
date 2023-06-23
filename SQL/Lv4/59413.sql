--  0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성

-- 풀이 1
-- 1) WITH 사용하여 데이터에 있는 시간들 임시 테이블 만든다
-- 2) '24시간 HOUR' 테이블 만든다
-- 3) WITH 구문 테이블에서 데이터 COUNT한 후, '24시간 HOUR' 테이블과 조인하여 원하는 값 출력한다
-- 4) IFNULL(B.COUNT, 0): B.COUNT 값 출력하고, 만약 이 값이 NULL이라면 0 반환

WITH H AS (SELECT DATE_FORMAT(DATETIME, '%H') AS TIME
FROM ANIMAL_OUTS)

SELECT HOUR, IFNULL(B.COUNT, 0) AS COUNT
FROM (SELECT 0 HOUR UNION SELECT 1
UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9
UNION SELECT 10 UNION SELECT 11 UNION SELECT 12 UNION SELECT 13
UNION SELECT 14 UNION SELECT 15 UNION SELECT 16 UNION SELECT 17
UNION SELECT 18 UNION SELECT 19 UNION SELECT 20 UNION SELECT 21
UNION SELECT 22 UNION SELECT 23) A
LEFT JOIN (
SELECT TIME, COUNT(TIME) AS 'COUNT'
FROM H
GROUP BY TIME) B ON A.HOUR = B.TIME
ORDER BY HOUR
  

  

-- 풀이 2 ★★★
-- 1) SET으로 hour라는 변수를 선언한 후 -1을 대입한다 (:= 대입연산자, = 비교연산자)
-- 2) HOUR: 0~23까지 +1씩 상승하며 행에 입력
-- 3) COUNT: SELECT COUNT로 @hour와 DATETIME이 같을 때를 센 후 반환한다
-- 4) @hour가 23일 때까지 반복
  
SET @hour := -1; 

SELECT (@hour := @hour + 1) as HOUR,
(	SELECT COUNT(DATETIME) 
	FROM ANIMAL_OUTS 
	WHERE HOUR(DATETIME) = @hour) as COUNT
FROM ANIMAL_OUTS
WHERE @hour < 23


-- 주어진 데이터에서는 0~23시까지의 시간 중 없는 데이터도 있기 때문에 나오지 않는 시간도 있었으므로
-- 직접 없는 시간은 채워줘야했다
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/59413
