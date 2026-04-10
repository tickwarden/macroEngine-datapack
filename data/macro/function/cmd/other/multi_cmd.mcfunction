execute unless entity @s[tag=macro.admin] run return 0

$data modify storage macro:engine _mcmd_queue set value $(commands)
data modify storage macro:engine _mcmd_options set value {error_mode:"continue",profile:0b,spread:0}

execute at @s run function macro:cmd/other/multi_cmd/run
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/other/multi_cmd ","color":"aqua"},{"text":"▶ executing batch","color":"#555555"}]