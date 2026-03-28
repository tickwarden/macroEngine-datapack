# macro:hook/internal/on_using_item
# @s = player who triggered the event
data modify storage macro:engine _hook_fire_tmp set value {event:"using_item"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
