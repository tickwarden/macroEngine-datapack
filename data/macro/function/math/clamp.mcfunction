$scoreboard players set $clamp_v macro.tmp $(value)
$scoreboard players set $clamp_lo macro.tmp $(min)
$scoreboard players set $clamp_hi macro.tmp $(max)

execute if score $clamp_v macro.tmp < $clamp_lo macro.tmp run scoreboard players operation $clamp_v macro.tmp = $clamp_lo macro.tmp
execute if score $clamp_v macro.tmp > $clamp_hi macro.tmp run scoreboard players operation $clamp_v macro.tmp = $clamp_hi macro.tmp

execute store result storage macro:output result int 1 run scoreboard players get $clamp_v macro.tmp
