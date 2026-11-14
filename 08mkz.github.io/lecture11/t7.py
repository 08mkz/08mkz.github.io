try:
    price = int(input("Цена"))
    print("Цена со скидкой", price * 0.9)
except ValueError:
    print("введите число")
