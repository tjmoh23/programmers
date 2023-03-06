def solution(my_string):
  answer = []
  for i in my_string:
    if i.isupper() == True:
      i = i.lower()
      answer.append(i)
    else:
      i = i.upper()
      answer.append(i)
  return ''.join(answer) # 리스트를 문자열로 바꿔주기



'''

''.join(리스트)
리스트를 하나의 문자열로 합치기
따옴표('') 안에 다른 구분자를 넣으면 구분자를 추가한 상태로 문자열을 만들어준다.
'/', '\n', '<' 등 . . .


추가) 리스트에 숫자가 있는 경우
''join(str(s) for s in 리스트)


'''

 
