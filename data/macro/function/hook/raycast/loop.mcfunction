# Raycast loop
# Check if there is a non-air block at the current position

# Air olmayan blok bulduysa -> found function
execute unless block ~ ~ ~ #minecraft:air run return run function macro:hook/raycast/found

# Hala air -> devam et
# Increment counter
scoreboard players add @s macro.tmp 1

# Stop if max distance reached (50 steps = 5 blocks)
execute if score @s macro.tmp matches 50.. run return 0

# Pozisyonu 0.1 blok ilerlet ve tekrar dene
execute positioned ^ ^ ^0.1 run function macro:hook/raycast/loop
