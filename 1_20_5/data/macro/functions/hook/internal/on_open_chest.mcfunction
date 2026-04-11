# macro:hook/internal/on_open_chest
data modify storage macro:engine _hook_fire_tmp set value {event:"open_chest"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
