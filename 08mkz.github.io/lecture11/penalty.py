debt = int(input("sum of debts"))
days = int(input("days of delays"))

if days > 0 and debt > 0:
    penalty = debt * 0.001 * days
    print("ПЕНЯ", penalty)
else:
    print("пени")