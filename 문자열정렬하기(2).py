def solution(my_string):
    answer = []
    my_string = my_string.lower()
    for i in my_string:
        answer.append(i)
    answer.sort() 
    return ''.join(answer)
  
  
  
  # 다른 풀이
  def solution(my_string):
    return ''.join(sorted(my_string.lower()))
  
  
  # sort()와 sorted() 차이점 공부하기
  
  
