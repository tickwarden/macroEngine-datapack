$scoreboard players set $max_a macro.tmp $(a)
$scoreboard players set $max_b macro.tmp $(b)

execute store result storage macro:output result int 1 run scoreboard players get $max_a macro.tmp

execute if score $max_b macro.tmp > $max_a macro.tmp run execute store result storage macro:output result int 1 run scoreboard players get $max_b macro.tmp
