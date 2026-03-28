$scoreboard players set $lerp_a macro.tmp $(a)
$scoreboard players set $lerp_b macro.tmp $(b)
$scoreboard players set $lerp_t macro.tmp $(t)

scoreboard players operation $lerp_r macro.tmp = $lerp_b macro.tmp
scoreboard players operation $lerp_r macro.tmp -= $lerp_a macro.tmp

scoreboard players operation $lerp_r macro.tmp *= $lerp_t macro.tmp
scoreboard players set $lerp_100 macro.tmp 100
scoreboard players operation $lerp_r macro.tmp /= $lerp_100 macro.tmp
scoreboard players operation $lerp_r macro.tmp += $lerp_a macro.tmp

execute store result storage macro:output result int 1 run scoreboard players get $lerp_r macro.tmp
