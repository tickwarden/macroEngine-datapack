execute store result score $rep_r macro.tmp run data get storage macro:engine _repeat.remaining
execute if score $rep_r macro.tmp matches ..0 run execute as @a[tag=macro.debug] run tellraw @s {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/repeat ","color":"aqua"},{"text":"DONE ","color":"green"},{"text":"all iterations completed","color":"#555555"}]}
execute if score $rep_r macro.tmp matches ..0 run return 0

function macro:lib/internal/repeat_call with storage macro:engine _repeat

scoreboard players remove $rep_r macro.tmp 1
execute store result storage macro:engine _repeat.remaining int 1 run scoreboard players get $rep_r macro.tmp
execute store result score $rep_i macro.tmp run data get storage macro:engine _repeat.i
scoreboard players add $rep_i macro.tmp 1
execute store result storage macro:engine _repeat.i int 1 run scoreboard players get $rep_i macro.tmp

function macro:lib/internal/repeat_run
