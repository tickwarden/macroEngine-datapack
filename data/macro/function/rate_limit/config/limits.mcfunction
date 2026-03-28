# macroEngine Rate Limit - Configuration

# Max actions per second (per player)
scoreboard players set #rl_max_per_sec macro.rl_max 10

# Cooldown durations in ticks
scoreboard players set #rl_cooldown_1 macro.rl_max 60
scoreboard players set #rl_cooldown_2 macro.rl_max 100
scoreboard players set #rl_cooldown_3 macro.rl_max 200

# Violation threshold for admin alert
scoreboard players set #rl_violation_threshold macro.rl_max 5

# Timer interval for counter reset (20 ticks = 1 second)
scoreboard players set #rl_timer_interval macro.rl_max 20

# Initialize all players with default max
execute as @a run scoreboard players operation @s macro.rl_max = #rl_max_per_sec macro.rl_max
