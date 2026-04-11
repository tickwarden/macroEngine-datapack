# macro:hook/internal/on_eat_fire
# @s = yiyen oyuncu
data modify storage macro:engine _hook_fire_tmp set value {event:"eat"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
