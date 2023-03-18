def solution(str1, str2):
    if str1.find(str2) != -1:
        return 1
    else:
        return 2


      
# 다른 풀이 1
def solution(str1, str2):
  return 1 if str2 in str1 else 2



# 다른 풀이 2
def solution(str1, str2):
    if str1.count(str2):
        return 1
    else:
        return 2
      
      
      
# 다른 풀이 3
def solution(str1, str2):
    if str2 in str1:
        return 1
    else:
        return 2
      
      
      
# 다른 풀이 4
def solution(str1, str2):
    return 1 + int(str2 not in str1)      
  
  
        
# find()
# sample.find(찾을 문자)
# sample.find(찾을 문자, 시작 index, 끝 index)

# 찾을 문자/문자열이 있는지 확인하고 존재한다면 해당 위치의 index 반환
# 존재하지 않는다면 -1 반환
# 만약 찾는 문자/문자열이 여러 개라면 제일 처음 찾은 문자의 index 반환
# 리스트, 튜플, 딕셔너리에서는 사용할 수 없다. 문자열에서만 사용 가능!


# 추가
# index()
# sample.index(찾을 문자)
# sample.index(찾을 문자, 시작 index, 끝 index)

# 찾는 문자/문자열 있는지 확인 후 존재한다면 해당 위치의 index 반환
# 존재하지 않는다면 오류 발생 !
# 문자열, 리스트, 튜플 자료형에서 사용 가능하고 딕셔너리에서는 사용 불가!
      
