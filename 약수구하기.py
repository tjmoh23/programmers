
def solution(n):
    answer = []
    i = 1
    while i <= n:
        if n%i==0:
            answer.append(i)
            i+=1
        else:
            i+=1
    return answer
  
  
  
  # 다른 풀이
  # 리스트 컴프리헨션 사용하기
  def solution(n):
    answer = [i for i in range(1,n+1) if n%i == 0]
    return answer
