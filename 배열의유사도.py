def solution(s1, s2):
    answer = 0
    for i in s1:
        for j in s2:
            if i == j:
                answer+=1
            else:
                continue
    return answer
  
  
  
# 다른 풀이 1
# 굳이 else 안 써도 된다
def solution(s1, s2):
  answer = 0
  for i in s1:
      for j in s2:
          if i == j:
              answer+=1
  return answer



# 다른 풀이 2
# set() 집합 이용, 매우 간단쓰..
def solution(s1, s2)
   return len(set(s1) & set(s2))



# set(): 집합
# set() 키워드 혹은 중괄호 이용하여 만든다 -> set({1, 2, 3}) 또는 set([1, 2, 3]) 또는 {1, 2, 3}
# 비어있는 집합 만들기 -> A = set()

# 집합 특징
# unordered 순서가 없다
# unique elements 중복 불가능
# mutable 값이 변하는 객체

# set 예제
# s1 = set([1, 2, 3]), s2 = set([2, 3, 4)] 일 때
# s1.intersection(s2) 또는 s1 & s2 : 교집합 -> {2, 3}
# s1.union(s2) 또는 s1 | s2 : 합집합 -> {1, 2, 3, 4, 5}
# s1.difference(s2) 또는 s1 - s2 : 차집합 -> {1} (차집합은 순서 상관 있다)


# 참고 자료 : https://blockdmask.tistory.com/451
