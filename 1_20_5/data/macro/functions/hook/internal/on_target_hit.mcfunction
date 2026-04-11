# macro:hook/internal/on_target_hit
data modify storage macro:engine _hook_fire_tmp set value {event:"target_hit"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
