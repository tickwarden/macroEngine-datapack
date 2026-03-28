# macro:hook/on_dimension_change
# Advancement reward: runs when changed_dimension triggers.
# @s = player who changed dimension

advancement revoke @s only macro:hook/dimension_change
scoreboard players add @s macro.hook_dim_changed 1
