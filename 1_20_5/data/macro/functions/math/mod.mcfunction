$scoreboard players set $mod_v macro.tmp $(value)
$scoreboard players set $mod_d macro.tmp $(divisor)

execute if score $mod_d macro.tmp matches ..0 run data modify storage macro:output result set value 0
execute if score $mod_d macro.tmp matches ..0 run return 0

scoreboard players operation $mod_v macro.tmp %= $mod_d macro.tmp

execute if score $mod_v macro.tmp matches ..-1 run scoreboard players operation $mod_v macro.tmp += $mod_d macro.tmp

execute store result storage macro:output result int 1 run scoreboard players get $mod_v macro.tmp
