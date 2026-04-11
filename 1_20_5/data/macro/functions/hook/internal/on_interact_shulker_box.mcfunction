# macro:hook/internal/on_interact_shulker_box
# @s = player who triggered the event
data modify storage macro:engine _hook_fire_tmp set value {event:"interact_shulker_box"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
