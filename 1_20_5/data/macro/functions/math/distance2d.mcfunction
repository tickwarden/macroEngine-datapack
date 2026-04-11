$scoreboard players set $d2d_x1 macro.tmp $(x1)
$scoreboard players set $d2d_z1 macro.tmp $(z1)
$scoreboard players set $d2d_x2 macro.tmp $(x2)
$scoreboard players set $d2d_z2 macro.tmp $(z2)

scoreboard players operation $d2d_dx macro.tmp = $d2d_x2 macro.tmp
scoreboard players operation $d2d_dx macro.tmp -= $d2d_x1 macro.tmp

scoreboard players operation $d2d_dz macro.tmp = $d2d_z2 macro.tmp
scoreboard players operation $d2d_dz macro.tmp -= $d2d_z1 macro.tmp

# Overflow prevention: 2 * 32767² = 2,147,354,578 ≤ INT_MAX (2,147,483,647)
execute if score $d2d_dx macro.tmp matches 32768.. run scoreboard players set $d2d_dx macro.tmp 32767
execute if score $d2d_dx macro.tmp matches ..-32768 run scoreboard players set $d2d_dx macro.tmp -32767
execute if score $d2d_dz macro.tmp matches 32768.. run scoreboard players set $d2d_dz macro.tmp 32767
execute if score $d2d_dz macro.tmp matches ..-32768 run scoreboard players set $d2d_dz macro.tmp -32767

scoreboard players operation $d2d_dx macro.tmp *= $d2d_dx macro.tmp
scoreboard players operation $d2d_dz macro.tmp *= $d2d_dz macro.tmp
scoreboard players operation $d2d_sq macro.tmp = $d2d_dx macro.tmp
scoreboard players operation $d2d_sq macro.tmp += $d2d_dz macro.tmp

execute if score $d2d_sq macro.tmp matches 0 run data modify storage macro:output result set value 0
execute if score $d2d_sq macro.tmp matches 0 run return 0

scoreboard players operation $sqrt_n macro.tmp = $d2d_sq macro.tmp
scoreboard players set $sqrt_lo macro.tmp 0
scoreboard players operation $sqrt_hi macro.tmp = $sqrt_n macro.tmp
execute if score $sqrt_hi macro.tmp matches 46342.. run scoreboard players set $sqrt_hi macro.tmp 46341
scoreboard players set $sqrt_itr macro.tmp 16
function macro:math/internal/sqrt_step

execute store result storage macro:output result int 1 run scoreboard players get $sqrt_lo macro.tmp
