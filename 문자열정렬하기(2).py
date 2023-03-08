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
  
  
# sort()와 sorted() 차이점
# sorted 함수는 정렬된 새로운 리스트 리턴해주는 반면, sort 메소드는 아무것도 리턴하지 않는다.

sample = [5, 7, 2, 3, 1]
print(sorted(sample))
# [1, 2, 3, 5, 7]
print(sample.sort())
# None


# sorted 함수는 sample에 영향을 주지 않는다. 새로운 리스트를 만들어 리턴해줄 뿐이다.
sorted(sample)
print(sample)
# [5, 7, 2, 3, 1]


# 반면에 sort 메소드는 sample 자체를 정렬해버린다.
sample.sort()
print(sample)
# [1, 2, 3, 5, 7]


# 한마디로 복사본을 만들어서 정렬하는 것과, 원본을 정렬하는 것의 차이다 !
