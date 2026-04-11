# macro:hook/on_killed_by_arrow
# Reward: killed_by_arrow advancement (entity_killed_player + killing_blow arrow)
advancement revoke @s only macro:hook/killed_by_arrow
scoreboard players add @s macro.hook_killed_by_arrow 1
