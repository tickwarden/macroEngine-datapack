$scoreboard players set $pow_a macro.tmp $(a)
$scoreboard players set $pow_n macro.tmp $(n)
scoreboard players set $pow_r macro.tmp 1

execute if score $pow_n macro.tmp matches 0 run execute store result storage macro:output result int 1 run scoreboard players get $pow_r macro.tmp
execute if score $pow_n macro.tmp matches 0 run return 0

function macro:math/internal/pow_loop
execute store result storage macro:output result int 1 run scoreboard players get $pow_r macro.tmp
