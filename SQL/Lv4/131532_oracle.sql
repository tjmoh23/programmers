SELECT 
    TO_CHAR(O.SALES_DATE, 'YYYY') AS YEAR, 
    TO_CHAR(O.SALES_DATE, 'MM') AS MONTH, 
    U.GENDER,
    COUNT(U.USER_ID) AS USERS
FROM ONLINE_SALE O, USER_INFO U
WHERE O.USER_ID = U.USER_ID
AND U.GENDER IS NOT NULL
GROUP BY TO_CHAR(O.SALES_DATE, 'YYYY'), TO_CHAR(O.SALES_DATE, 'MM'), U.GENDER
ORDER BY YEAR, MONTH, U.GENDER

-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/131532
