scoreboard players operation $sqrt_mid macro.tmp = $sqrt_lo macro.tmp
scoreboard players operation $sqrt_mid macro.tmp += $sqrt_hi macro.tmp
scoreboard players set $sqrt_2 macro.tmp 2
scoreboard players operation $sqrt_mid macro.tmp /= $sqrt_2 macro.tmp

scoreboard players operation $sqrt_sq macro.tmp = $sqrt_mid macro.tmp
scoreboard players operation $sqrt_sq macro.tmp *= $sqrt_mid macro.tmp

execute if score $sqrt_sq macro.tmp <= $sqrt_n macro.tmp run scoreboard players operation $sqrt_lo macro.tmp = $sqrt_mid macro.tmp
execute unless score $sqrt_sq macro.tmp <= $sqrt_n macro.tmp run scoreboard players operation $sqrt_hi macro.tmp = $sqrt_mid macro.tmp

scoreboard players remove $sqrt_itr macro.tmp 1
execute if score $sqrt_itr macro.tmp matches 1.. run function macro:math/internal/sqrt_step
