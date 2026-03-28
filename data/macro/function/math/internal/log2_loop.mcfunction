execute if score $lg2_v macro.tmp matches ..1 run return 0

scoreboard players add $lg2_r macro.tmp 1
scoreboard players operation $lg2_v macro.tmp /= $lg2_2 macro.tmp

function macro:math/internal/log2_loop
