# Score checker
execute store result score $mcmd_cond_score macro.tmp run scoreboard players get @s dummy
data modify storage macro:engine _mcmd_cond_tmp set from storage macro:engine _mcmd_current.condition.score
function macro:cmd/other/multi_cmd/internal/cond_score_exec with storage macro:engine _mcmd_cond_tmp
data remove storage macro:engine _mcmd_cond_tmp
scoreboard players reset $mcmd_cond_score macro.tmp
