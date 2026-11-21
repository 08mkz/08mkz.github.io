def rent(days):
    if days >= 7:
        return days * 4000
    else:
        return days * 5000

print(rent(3))   # Выведет: 15000
print(rent(7))   # Выведет: 28000
print(rent(10))  # Выведет: 40000