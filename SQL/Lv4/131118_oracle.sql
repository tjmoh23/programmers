SELECT
    R.REST_ID, R.REST_NAME, R.FOOD_TYPE,
    R.FAVORITES, R.ADDRESS, S.SCORE
FROM (SELECT 
        REST_ID, REST_NAME, 
        FOOD_TYPE, FAVORITES, ADDRESS
     FROM REST_INFO
     WHERE ADDRESS LIKE '서울%') R,
     (
        SELECT
            REST_ID, 
            ROUND(AVG(REVIEW_SCORE), 2) AS SCORE
        FROM REST_REVIEW 
        GROUP BY REST_ID ) S
WHERE R.REST_ID = S.REST_ID
ORDER BY S.SCORE DESC, R.FAVORITES DESC

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/131118?language=oracle
