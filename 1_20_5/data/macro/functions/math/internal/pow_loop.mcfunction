execute if score $pow_n macro.tmp matches ..0 run return 0
scoreboard players operation $pow_r macro.tmp *= $pow_a macro.tmp
scoreboard players remove $pow_n macro.tmp 1
function macro:math/internal/pow_loop
