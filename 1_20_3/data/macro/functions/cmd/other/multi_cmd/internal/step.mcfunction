execute unless data storage macro:engine _mcmd_list[0] run execute as @a[tag=macro.debug] run tellraw @s {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/multi_cmd ","color":"aqua"},{"text":"DONE ","color":"green"},{"text":"command list exhausted","color":"#555555"}]}
execute unless data storage macro:engine _mcmd_list[0] run return 0

data modify storage macro:engine _mcmd_entry set value {}
data modify storage macro:engine _mcmd_entry.current_cmd set from storage macro:engine _mcmd_list[0]
data remove storage macro:engine _mcmd_list[0]

function macro:cmd/other/multi_cmd/internal/exec with storage macro:engine _mcmd_entry

function macro:cmd/other/multi_cmd/internal/step
