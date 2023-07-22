-- 상품 카테고리 코드(PRODUCT_CODE 앞 2자리)별 상품 개수를 출력

SELECT
    SUBSTR(PRODUCT_CODE, 1, 2) AS CATEGORY,
    COUNT(PRODUCT_ID) AS PRODUCTS
FROM PRODUCT
GROUP BY SUBSTR(PRODUCT_CODE, 1,2)
ORDER BY CATEGORY


-- ★ 오라클에서 문자열 자르기: SUBSTR(문자열, 시작 위치, 길이)
-- 이때 시작 위치는 1부터 시작한다
SUBSTR(STR, 1, 4), -- STR의 1번째 글자부터 4개 자르기
SUBSTR(STR, 5, 5), -- STR의 5번째 글자부터 5개 자르기
SUBSTR(STR, 10), -- STR의 10번째 글자부터 끝까지 자르기
SUBSTR(STR, -7, 3), -- STR의 뒤에서 3번째 글자부터 3글자 자르기
SUBSTR(STR, -3), -- STR의 뒤에서 3번째 글자부터 끝까지 자르기

-- ★ 구분자로 문자열 자르기 / 문자열 위치 찾기: INSTR(문자열, 구분자, 시작 위칙, 횟수)
INSTR(STR, ' '), -- ' ' STR에서 띄어쓰기 있는 문자 위치 찾기
INSTR(STR, ' ', 7), -- STR의 7째 문자부터 띄어쓰기가 있는 문자 위치 찾기
INSTR(STR, ' ', 7, 2), -- STR의 7째 문자부터 2번째 띄어쓰기가 있는 문자 찾기
SUBSTR(STR, 0, INSTR(STR, ' ', 1, 2)) -- 띄어쓰기 2번째 문자열까지 문자열 자르기



-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/131529?language=oracle
-- 참고 자료 출처: https://coding-factory.tistory.com/429
