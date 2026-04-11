$scoreboard players set $map_v macro.tmp $(value)
$scoreboard players set $map_imin macro.tmp $(in_min)
$scoreboard players set $map_imax macro.tmp $(in_max)
$scoreboard players set $map_omin macro.tmp $(out_min)
$scoreboard players set $map_omax macro.tmp $(out_max)

scoreboard players operation $map_ir macro.tmp = $map_imax macro.tmp
scoreboard players operation $map_ir macro.tmp -= $map_imin macro.tmp

execute if score $map_ir macro.tmp matches 0 run execute store result storage macro:output result int 1 run scoreboard players get $map_omin macro.tmp
execute if score $map_ir macro.tmp matches 0 run return 0

scoreboard players operation $map_or macro.tmp = $map_omax macro.tmp
scoreboard players operation $map_or macro.tmp -= $map_omin macro.tmp

scoreboard players operation $map_off macro.tmp = $map_v macro.tmp
scoreboard players operation $map_off macro.tmp -= $map_imin macro.tmp

scoreboard players operation $map_off macro.tmp *= $map_or macro.tmp
scoreboard players operation $map_off macro.tmp /= $map_ir macro.tmp
scoreboard players operation $map_off macro.tmp += $map_omin macro.tmp

execute store result storage macro:output result int 1 run scoreboard players get $map_off macro.tmp
