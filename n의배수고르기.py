def solution(n, numlist):
    answer = []
    for a in numlist:
        if a%n == 0:
            answer.append(a)
        else:
            continue
    return answer
  
  
  
# 다른 풀이
def solution(n, numlist):
  answer = [i for i in numlist if i%n==0]
  return answer

# 아니면 리스트 컴프리헨션을 바로 return으로 출력해도 된다
