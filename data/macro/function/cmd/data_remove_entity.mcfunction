execute unless function macro:tools/utils/check_all run return 0
execute unless entity @s[type=minecraft:player] run return 0
execute unless dimension minecraft:overworld run return 0
execute unless entity @s[gamemode=creative] run return 0

$data remove entity $(target) $(path)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/data_remove_entity ","color":"aqua"},{"text":"$(target) → $(path)","color":"#555555"}]
