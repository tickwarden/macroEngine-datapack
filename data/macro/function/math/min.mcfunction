$scoreboard players set $min_a macro.tmp $(a)
$scoreboard players set $min_b macro.tmp $(b)

execute store result storage macro:output result int 1 run scoreboard players get $min_a macro.tmp

execute if score $min_b macro.tmp < $min_a macro.tmp run execute store result storage macro:output result int 1 run scoreboard players get $min_b macro.tmp
