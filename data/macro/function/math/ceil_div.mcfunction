$scoreboard players set $cdv_a macro.tmp $(a)
$scoreboard players set $cdv_b macro.tmp $(b)

scoreboard players operation $cdv_t macro.tmp = $cdv_b macro.tmp
scoreboard players remove $cdv_t macro.tmp 1

scoreboard players operation $cdv_a macro.tmp += $cdv_t macro.tmp

scoreboard players operation $cdv_a macro.tmp /= $cdv_b macro.tmp

execute store result storage macro:output result int 1 run scoreboard players get $cdv_a macro.tmp
