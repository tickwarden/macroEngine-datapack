execute unless data storage macro:engine _felist_input[0] run execute as @a[tag=macro.debug] run tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/for_each_list ","color":"aqua"},{"text":"DONE ","color":"green"},{"text":"list exhausted, loop ended","color":"#555555"}]
execute unless data storage macro:engine _felist_input[0] run return 0

data modify storage macro:engine _felist_current set from storage macro:engine _felist_input[0]
execute store result storage macro:engine _felist_i int 1 run scoreboard players get $felist_i macro.tmp

function macro:lib/internal/for_each_list_call with storage macro:engine _felist_state

data remove storage macro:engine _felist_input[0]
scoreboard players add $felist_i macro.tmp 1

function macro:lib/internal/for_each_list_step
