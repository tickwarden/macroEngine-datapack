scoreboard players set $ent_count macro.tmp 0
$execute as @e[type=$(type),tag=$(tag)] run scoreboard players add $ent_count macro.tmp 1
execute store result storage macro:output count int 1 run scoreboard players get $ent_count macro.tmp
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"entity/count ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(type)","color":"aqua"}]}
