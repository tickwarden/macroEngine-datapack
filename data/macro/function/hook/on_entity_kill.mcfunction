# macro:hook/on_entity_kill
# Reward: entity_kill advancement (player_killed_entity trigger)
advancement revoke @s only macro:hook/entity_kill
scoreboard players add @s macro.hook_entity_killed 1
