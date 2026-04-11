# macro:hook/internal/on_player_respawn
# @s = tetikleyen oyuncu
data modify storage macro:engine _hook_fire_tmp set value {event:"player_respawn"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
