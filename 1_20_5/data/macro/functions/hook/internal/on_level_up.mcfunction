# macro:hook/internal/on_level_up
# @s = tetikleyen oyuncu
data modify storage macro:engine _hook_fire_tmp set value {event:"level_up"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
