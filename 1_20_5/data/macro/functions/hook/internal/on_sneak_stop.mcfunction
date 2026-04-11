# macro:hook/internal/on_sneak_stop
# @s = player who triggered the event
data modify storage macro:engine _hook_fire_tmp set value {event:"sneak_stop"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
