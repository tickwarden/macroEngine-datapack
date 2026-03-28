# macro:hook/internal/on_dimension_change
# @s = tetikleyen oyuncu
data modify storage macro:engine _hook_fire_tmp set value {event:"dimension_change"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
