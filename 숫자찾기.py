# 자릿수

def solution(num, k):
    a = str(num)
    b = str(k)
    if a.find(b) != -1:
        return a.find(b)+1  # find가 index 반환이기 때문에 숫자로 출력(문자열이 아니라) 따라서 연산이 바로 가능
    else:
        return -1
      

      
# 다른 풀이
def solution(num, k):
  return -1 if str(k) not in str(num) else str(num).find(str(k)) + 1



# 다른 풀이
def solution(num, k):
  for i, n in enumerate(str(num)):
    if str(k) == n:
      return i + 1
  return -1



# 다른 풀이
def solution(num, k):
    try:
        return str(num).index(str(k)) + 1
    except ValueError:
        return -1
