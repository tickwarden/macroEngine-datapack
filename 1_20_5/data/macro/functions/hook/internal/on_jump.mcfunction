# macro:hook/internal/on_jump
data modify storage macro:engine _hook_fire_tmp set value {event:"jumped"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
