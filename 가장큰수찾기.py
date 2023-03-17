def solution(array):
    answer = []
    for i in array:
        answer.append(i)
    return [max(answer), answer.index(max(answer))]
  
  
# 다른 풀이
def solution(array):
    return [max(array), array.index(max(array))]

# 이런 문제 풀 때 정렬 알고리즘의 구현 자체는 스킵하는 게 국룰인가..?
# -> 문제에서 최댓값이 아닌 그 중간값으로 연산을 하라고 하면 정렬이 필요하겠지만 
# 배열 안 최댓값(max), 최솟값(min)은 기본 함수로써도 확인할 수 있기 때문에 정렬은 안 해도 된다고..
# 배열의 길이가 짧아서 정렬보다는 바로 구하는 것이 효율적이라는 의견도 있..
