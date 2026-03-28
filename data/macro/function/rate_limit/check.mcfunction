# macroEngine Rate Limit - Check
# Public API: Manual rate limit check
# Context: @s = Player to check
# Returns: Sets macro.rl_cooldown > 0 if rate limited

# Admin bypass
execute if entity @s[tag=macro.rl_bypass] run return 0

# If already in cooldown
execute if score @s macro.rl_cooldown matches 1.. run return 1

# Initialize player's max if not set
execute unless score @s macro.rl_max matches 1.. run scoreboard players operation @s macro.rl_max = #rl_max_per_sec macro.rl_max

# Check if counter exceeds limit
execute if score @s macro.rl_counter >= @s macro.rl_max run function macro:rate_limit/internal/detect_abuse

# Return status
execute if score @s macro.rl_cooldown matches 1.. run return 1
return 0
