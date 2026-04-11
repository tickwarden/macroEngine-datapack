# macro:hook/internal/on_trade
# @s = tetikleyen oyuncu
data modify storage macro:engine _hook_fire_tmp set value {event:"trade"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
