from collections import deque

def solution(numbers, direction):
    numbers = deque(numbers)
    if direction == "right":
        numbers.rotate(1)
    elif direction == "left":
        numbers.rotate(-1)
        
    return list(numbers)
  
  # deque( )
  # 함수 안에 양수를 넣으면 오른쪽 회전, 음수를 넣으면 왼쪽 회전
