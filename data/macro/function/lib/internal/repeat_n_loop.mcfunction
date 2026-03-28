execute if score $rn_i macro.tmp >= $rn_n macro.tmp run return 0

execute store result score $repeat_i macro.tmp run scoreboard players get $rn_i macro.tmp
function macro:lib/internal/repeat_n_call with storage macro:engine {}
scoreboard players add $rn_i macro.tmp 1
function macro:lib/internal/repeat_n_loop
