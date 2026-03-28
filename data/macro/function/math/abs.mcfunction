$scoreboard players set $abs_v macro.tmp $(value)
scoreboard players set $abs_neg macro.tmp -1
execute if score $abs_v macro.tmp matches ..-1 run scoreboard players operation $abs_v macro.tmp *= $abs_neg macro.tmp
execute store result storage macro:output result int 1 run scoreboard players get $abs_v macro.tmp
