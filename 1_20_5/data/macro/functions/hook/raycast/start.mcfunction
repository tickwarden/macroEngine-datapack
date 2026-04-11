# Raycast start
# Reset distance counter (max 50 steps = 5 blocks)
scoreboard players set @s macro.tmp 0

# Start loop
function macro:hook/raycast/loop
