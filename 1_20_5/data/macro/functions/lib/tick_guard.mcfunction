execute if score @s macro.tick_guard = $epoch macro.time run return 0

scoreboard players operation @s macro.tick_guard = $epoch macro.time

return 1
