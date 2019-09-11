# simulating solution to https://fivethirtyeight.com/features/what-are-your-chances-of-winning-the-u-s-open/

import random

point_first = ["up", "down", "left", "right"]
look_first = ["up", "down", "left", "right"]

winners = []

for game in range(1000000):
    winner = None
    round_num = 1
    
    while winner == None:
        if random.choice(point_first) == random.choice(look_first):
            
            if round_num % 2 != 0:
                winner = "point_first"
                winners.append("point_first")
            else: 
                winner = "look_first"
                winners.append("look_first")
                      
        round_num += 1

# first pointer win%
print( winners.count("point_first") / 1000000 )

## 0.571489
