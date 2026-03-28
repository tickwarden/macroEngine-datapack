# macro:hook/internal/on_hero_of_the_village
# @s = player who triggered the event
data modify storage macro:engine _hook_fire_tmp set value {event:"hero_of_the_village"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp
