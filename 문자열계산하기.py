# 이렇게 풀면 10번 시도 중 2번은 맞고 8번은 틀림... 왜 때 문 일 까...

def solution(my_string):
    sample = my_string.split(" ")
    if sample[1] == "+":
        return int(sample[0]) + int(sample[2])
    elif sample[1] == "-":
        return int(sample[0]) - int(sample[2])

# 연산자가 '적어도 하나'이므로 여러 개가 있을 수도 있다는 말인데 나는 하나만 고려하고 있었다...!
# 따라서 정답 풀이

def solution(my_string):
    my_string = my_string.split(" ")
    answer = int(my_string[0])
    
    for i in range(len(my_string)):
        if my_string[i] == "+":
            answer += int(my_string[i+1])
        elif my_string[i] == "-":
            answer -= int(my_string[i+1])
        else:
            continue
    return answer


# 다른 풀이 1
def solution(my_string):
    return eval(my_string)

# eval 함수: 문자열식 값 반환
# eval("1+1") 를 할 경우, 2 반환
# 함수 이름을 포함하는 문자열을 eval 함수로 전달하면 함수의 반환값을 반환한다.



# 추가 풀이 더 공부하기
# https://blockdmask.tistory.com/437 참
