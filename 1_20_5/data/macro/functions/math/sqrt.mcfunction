$scoreboard players set $sqrt_n macro.tmp $(value)

execute if score $sqrt_n macro.tmp matches ..0 run data modify storage macro:output result set value 0
execute if score $sqrt_n macro.tmp matches ..0 run return 0

execute if score $sqrt_n macro.tmp matches 1 run data modify storage macro:output result set value 1
execute if score $sqrt_n macro.tmp matches 1 run return 0

scoreboard players set $sqrt_lo macro.tmp 0
scoreboard players operation $sqrt_hi macro.tmp = $sqrt_n macro.tmp
execute if score $sqrt_hi macro.tmp matches 46342.. run scoreboard players set $sqrt_hi macro.tmp 46341

scoreboard players set $sqrt_itr macro.tmp 16
function macro:math/internal/sqrt_step

execute store result storage macro:output result int 1 run scoreboard players get $sqrt_lo macro.tmp
