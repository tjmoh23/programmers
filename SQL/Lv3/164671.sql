-- 조회수가 가장 높은 중고거래 게시물에 대한 첨부파일 경로를 조회하는 SQL문을 작성

-- 내 풀이
SELECT CONCAT('/home/grep/src/', F.BOARD_ID, '/',
             F.FILE_ID, F.FILE_NAME, F.FILE_EXT) AS FILE_PATH
FROM USED_GOODS_BOARD B JOIN USED_GOODS_FILE F 
ON B.BOARD_ID = F.BOARD_ID
WHERE B.VIEWS IN (SELECT MAX(VIEWS)
                            FROM USED_GOODS_BOARD)
ORDER BY F.FILE_ID DESC


-- 처음에는 BOARD_ID와 MAX(VIEWS)를 WHERE IN에 넣었을 때는 출력되는 것이 없었다
-- 왜 그럴까 보니까, 아래와 같이 출력했을 경우와 실제로 리뷰가 가장 많았던 아이디와 다르다
-- 다시 말해, 아래 출력에서는 가장 위에 있는 BOARD_ID와 이와 별개로 가장 리뷰가 많은 아이디가 출력된다
-- 가장 많이 출력되는 리뷰 수에 해당하는 게시글 아이디가 뜨는 게 아니라는 거다 ! ! ! !
SELECT BOARD_ID, MAX(VIEWS)
FROM USED_GOODS_BOARD

-- 따라서 MAX(VIEWS)만을 뽑아서 가장 조회수가 많은 게시글을 뽑아야 함


-- 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/164671
