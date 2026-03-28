# macroEngine Rate Limit - Check (Hook Integration)
# Called from: macro:hook/internal/dispatch
# Context: @s = Player triggering hook event
# Returns: 0 = OK, 1 = Rate limited (event should be blocked)

# Admin bypass
execute if entity @s[tag=macro.rl_bypass] run return 0

# If already in cooldown, block event
execute if score @s macro.rl_cooldown matches 1.. run return 1

# Initialize player's max if not set
execute unless score @s macro.rl_max matches 1.. run scoreboard players operation @s macro.rl_max = #rl_max_per_sec macro.rl_max

# Check if counter exceeds limit
execute if score @s macro.rl_counter >= @s macro.rl_max run function macro:rate_limit/internal/detect_abuse

# If now in cooldown (abuse detected), block event
execute if score @s macro.rl_cooldown matches 1.. run return 1

# Record the action
scoreboard players add @s macro.rl_counter 1

return 0
