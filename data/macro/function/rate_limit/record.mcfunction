# macroEngine Rate Limit - Record
# Public API: Record an action (increment counter)
# Context: @s = Player executing action

# Admin bypass
execute if entity @s[tag=macro.rl_bypass] run return 0

# Increment action counter
scoreboard players add @s macro.rl_counter 1

# Debug logging
execute if entity @s[tag=macro.debug] run tellraw @s ["",{"text":"[Rate Limit] ","color":"yellow"},{"text":"Counter: ","color":"gray"},{"score":{"name":"@s","objective":"macro.rl_counter"},"color":"white"},{"text":" / ","color":"gray"},{"score":{"name":"@s","objective":"macro.rl_max"},"color":"white"}]

return 0
