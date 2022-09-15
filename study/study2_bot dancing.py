from cs1robots import *
import time

create_world(avenues = 5, streets = 5)
bot = Robot(beepers = 4)
stop = 0.1

def dance():
    for i in range(4):
        bot.turn_left()
        time.sleep(stop)

def move_or_turn():
    if bot.front_is_clear():
        dance()
        bot.move()
        time.sleep(stop)
    else:
        bot.turn_left()
        bot.drop_beeper()
bot.drop_beeper()

for i in range(20):
    move_or_turn()


