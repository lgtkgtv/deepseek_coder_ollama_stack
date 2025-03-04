def add_four(num1: int , num2 :int, num3: int, num4: int) -> (str): 
    summation = [num1 + num2 + num3 + num4]
    return f"The summation is {summation}."

print(add_four(10, 20, 30, 40))

    
def add_four2(num1: int , num2 :int, num3: int, num4: int) -> (str):
    summation = [num1 + num2]+[num3 + num4]
    return f"The summation is {sum(summation)}." 

print(add_four2(10, 20, 30, 40))

