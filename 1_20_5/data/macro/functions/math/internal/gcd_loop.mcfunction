# Euclidean step: a = b, b = a % b — repeat until b is zero
execute if score $gcd_b macro.tmp matches 0 run return 0

scoreboard players operation $gcd_t macro.tmp = $gcd_a macro.tmp
scoreboard players operation $gcd_a macro.tmp = $gcd_b macro.tmp
scoreboard players operation $gcd_t macro.tmp %= $gcd_b macro.tmp
scoreboard players operation $gcd_b macro.tmp = $gcd_t macro.tmp

function macro:math/internal/gcd_loop
