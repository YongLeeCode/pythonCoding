### practice1 : make a bot ###
### goal : bot reach to height 6 and right 10
from cs1robots import *

create_world(avenues = 10, streets = 6)

# create a robot with one beeper
bot = Robot(beepers = 1)
# move one step forward
bot.move()
# turn left
bot.turn_left()
# turn right
def turn_right():
    bot.turn_left()
    bot.turn_left()
    bot.turn_left()

def climb_up_one_stair():
    bot.move()
    turn_right()
    bot.move()
    bot.turn_left()

for upStair in range(5):
    climb_up_one_stair()
turn_right()
for forward in range(3):
    bot.move()





