# macroEngine Rate Limit - Abuse Detection
# Internal: Called when counter exceeds limit
# Context: @s = Player who exceeded limit

# Increment violation counter
scoreboard players add @s macro.rl_violations 1

# Apply penalty based on violation count
function macro:rate_limit/internal/apply_penalty

# Alert player
tellraw @s {"text":"","extra":[{"text":"[Rate Limit] ","color":"red","bold":true},{"text":"Too many actions! ","color":"yellow"},{"text":"Cooldown: ","color":"gray"},{"score":{"name":"@s","objective":"macro.rl_cooldown"},"color":"white"},{"text":" ticks","color":"gray"}]}

# Play warning sound
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5

# Debug info
execute if entity @s[tag=macro.debug] run tellraw @s {"text":"","extra":[{"text":"[Debug] ","color":"aqua"},{"text":"Counter: ","color":"gray"},{"score":{"name":"@s","objective":"macro.rl_counter"},"color":"white"},{"text":" / Max: ","color":"gray"},{"score":{"name":"@s","objective":"macro.rl_max"},"color":"white"},{"text":" | Violations: ","color":"gray"},{"score":{"name":"@s","objective":"macro.rl_violations"},"color":"red"}]}

# Admin alert for high violations
execute if score @s macro.rl_violations >= #rl_violation_threshold macro.rl_max run function macro:rate_limit/internal/admin_alert

return 0
