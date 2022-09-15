
# 'while' - escaping the repeat by making true with condition
money = 0
print("hello")
print("")

while int(money) != 10:
    print(f"your have {money} dollar(s).")
    print("Try to have 10 dollars in you bank")
    money = input("how much do you want deposit? ")

print("")
for i in range(10):
    print("You got 10 dollars!")