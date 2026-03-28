$scoreboard players set $lg2_v macro.tmp $(value)

execute if score $lg2_v macro.tmp matches ..0 run data modify storage macro:output result set value -1
execute if score $lg2_v macro.tmp matches ..0 run return 0

scoreboard players set $lg2_r macro.tmp 0
scoreboard players set $lg2_2 macro.tmp 2

function macro:math/internal/log2_loop

execute store result storage macro:output result int 1 run scoreboard players get $lg2_r macro.tmp
