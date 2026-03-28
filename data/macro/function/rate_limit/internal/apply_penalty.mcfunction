# macroEngine Rate Limit - Apply Penalty
# Internal: Apply cooldown based on violation count
# Context: @s = Player receiving penalty

# 1st violation: 3 sec cooldown
execute if score @s macro.rl_violations matches 1 run scoreboard players operation @s macro.rl_cooldown = #rl_cooldown_1 macro.rl_max

# 2nd-4th violation: 5 sec cooldown
execute if score @s macro.rl_violations matches 2..4 run scoreboard players operation @s macro.rl_cooldown = #rl_cooldown_2 macro.rl_max

# 5+ violations: 10 sec cooldown
execute if score @s macro.rl_violations matches 5.. run scoreboard players operation @s macro.rl_cooldown = #rl_cooldown_3 macro.rl_max

# Visual feedback
execute at @s run particle minecraft:angry_villager ~ ~2 ~ 0.3 0.3 0.3 0 5

return 0
