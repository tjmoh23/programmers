-- 내 풀이
SELECT
    PT_NAME, PT_NO, GEND_CD, AGE,
    CASE 
    WHEN TLNO IS NULL THEN 'NONE'
    ELSE TLNO END AS TLNO
FROM PATIENT
WHERE AGE <= 12
AND GEND_CD = 'W'
ORDER BY AGE DESC, PT_NAME



-- 다른 풀이
SELECT PT_NAME, PT_NO, GEND_CD, AGE, IFNULL(TLNO, "NONE") AS TLNO
FROM PATIENT
WHERE AGE <= 12 AND GEND_CD = 'W'
ORDER BY AGE DESC, PT_NAME;


-- IFNULL(TLNO, 'NONE')으로 더 간단하게 풀 수 있다! ! ! ! !
-- TLNO(왼쪽) 출력하고 만약 NULL이라면 'NONE'(오른쪽)출력
-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/132201?language=oracle
