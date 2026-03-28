$scoreboard players set $wrap_v macro.tmp $(value)
$scoreboard players set $wrap_min macro.tmp $(min)
$scoreboard players set $wrap_max macro.tmp $(max)

scoreboard players operation $wrap_r macro.tmp = $wrap_max macro.tmp
scoreboard players operation $wrap_r macro.tmp -= $wrap_min macro.tmp

execute if score $wrap_r macro.tmp matches ..0 run execute store result storage macro:output result int 1 run scoreboard players get $wrap_min macro.tmp
execute if score $wrap_r macro.tmp matches ..0 run return 0

scoreboard players operation $wrap_off macro.tmp = $wrap_v macro.tmp
scoreboard players operation $wrap_off macro.tmp -= $wrap_min macro.tmp

scoreboard players operation $wrap_off macro.tmp %= $wrap_r macro.tmp
execute if score $wrap_off macro.tmp matches ..-1 run scoreboard players operation $wrap_off macro.tmp += $wrap_r macro.tmp

scoreboard players operation $wrap_off macro.tmp += $wrap_min macro.tmp

execute store result storage macro:output result int 1 run scoreboard players get $wrap_off macro.tmp
