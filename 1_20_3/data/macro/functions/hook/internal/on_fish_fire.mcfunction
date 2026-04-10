# macro:hook/internal/on_fish_fire
# @s = the fishing player
data modify storage macro:engine _hook_fire_tmp set value {event:"fish_caught"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
