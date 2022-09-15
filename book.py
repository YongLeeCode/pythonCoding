# print message on the screen
print("Welcome to the book and author program.")

# Ask the user for their favorite book
book = input("What is your favorite book? ")

# Ask for the author
author = input("who is the book's author? ")

# Display the book and author
print("Your book is : " + book)
print("The book's author is " + author)

#글 중간에 variable을 집어 넣기 위한 가장 좋은 방법
print(f"your book is {book} by {author}, I really like {author}'s too.")
