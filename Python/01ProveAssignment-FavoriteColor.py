#requirement
color = input("PLease type your favorite color: ")
print("Your favorite color is")
print(color)

#creativity and exceeding
name = input("What is your name? ")
print("nice to meet you", name)

colorType1 = input(f"{name}, can you tell me What is your Favorite color? : ")
colorType2 = input(f"Do you have any other Favorite color? \n if you like only the color '{colorType1}', write '{colorType1}' again please. :")

if colorType1 == colorType2:
    print("you really love", colorType1)
else:
    print(name + "'s favorite two colors are " + colorType1 + " and " + colorType2)
