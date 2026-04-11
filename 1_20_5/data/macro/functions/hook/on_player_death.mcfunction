# macro:hook/on_player_death
# Reward: player_death advancement (entity_killed_player trigger)
# @s = dying player
advancement revoke @s only macro:hook/player_death
data modify storage macro:engine _hook_fire_tmp set value {event:"player_death"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
