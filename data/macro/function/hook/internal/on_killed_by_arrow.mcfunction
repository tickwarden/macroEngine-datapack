# macro:hook/internal/on_killed_by_arrow
# @s = player who triggered the event
data modify storage macro:engine _hook_fire_tmp set value {event:"killed_by_arrow"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
