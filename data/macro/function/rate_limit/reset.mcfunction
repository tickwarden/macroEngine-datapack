# macroEngine Rate Limit - Reset
# Public API: Reset a player's rate limit state
# Context: @s = Player to reset

scoreboard players set @s macro.rl_counter 0
scoreboard players set @s macro.rl_violations 0
scoreboard players set @s macro.rl_cooldown 0

# Reinitialize max from config
scoreboard players operation @s macro.rl_max = #rl_max_per_sec macro.rl_max

tellraw @s ["",{"text":"[Rate Limit] ","color":"yellow"},{"text":"Your rate limit state has been reset.","color":"green"}]

# Log to admins
execute as @a[tag=macro.admin] run tellraw @s ["",{"text":"[Rate Limit] ","color":"yellow"},{"selector":"@s","color":"white"},{"text":"'s rate limit state was reset.","color":"gray"}]

return 0
