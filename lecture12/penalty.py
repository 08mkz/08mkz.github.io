def penalty (debt, days):
    if(days > 0 and debt > 0):
        return debt * 0.001 * days
    else:
        return 0

print("Dogovor 1:", penalty(50000, 10))
print("Dogovor 2:", penalty(1200000, 30))
print("Dogovor 3:", penalty(80000, 0))

total = penalty(50000, 10) + penalty (1200000, 30)
print("Total: ", total)
