# macroEngine Rate Limit - Tick Handler
# Called from: macro/function/tick/player_systems.mcfunction

# Decrement cooldowns
scoreboard players remove @a[scores={macro.rl_cooldown=1..}] macro.rl_cooldown 1

# Notify player when cooldown ends
execute as @a[scores={macro.rl_cooldown=0}] if score @s macro.rl_violations matches 1.. run tellraw @s ["",{"text":"[Rate Limit] ","color":"green"},{"text":"Cooldown expired.","color":"gray"}]

# Timer for counter reset
scoreboard players add #rl_global_timer macro.rl_timer 1

# Reset all counters every second
execute if score #rl_global_timer macro.rl_timer >= #rl_timer_interval macro.rl_max run function macro:rate_limit/internal/reset_counters

return 0
