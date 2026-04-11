# macro:hook/internal/on_item_use
# @s = player who triggered the event
data modify storage macro:engine _hook_fire_tmp set value {event:"item_use"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
