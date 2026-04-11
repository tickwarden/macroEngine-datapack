# macro:hook/internal/on_drop
data modify storage macro:engine _hook_fire_tmp set value {event:"drop_item"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
