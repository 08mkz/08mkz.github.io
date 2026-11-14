try:
    age = int(input("how old are you?"))
    print("in the next year you will be", age + 1)
except ValueError:
    print("you need to enter nunber")