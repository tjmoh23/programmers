# 이렇게 풀면 10번 시도 중 2번은 맞고 8번은 틀림... 왜 때 문 일 까...

def solution(my_string):
    sample = my_string.split(" ")
    if sample[1] == "+":
        return int(sample[0]) + int(sample[2])
    elif sample[1] == "-":
        return int(sample[0]) - int(sample[2])
