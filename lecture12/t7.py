def rent(days):
    if days >= 7:
        return days * 4000
    else:
        return days * 5000

def calculate_rent():
    user_input = input("Введите количество дней: ")
    
    if user_input.isdigit():
        days = int(user_input)
        print(rent(days))
    else:
        print("Нужно число")

calculate_rent()