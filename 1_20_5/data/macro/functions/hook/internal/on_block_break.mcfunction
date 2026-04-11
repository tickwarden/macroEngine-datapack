# macro:hook/internal/on_block_break
# @s = player who triggered the event
data modify storage macro:engine _hook_fire_tmp set value {event:"block_break"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
