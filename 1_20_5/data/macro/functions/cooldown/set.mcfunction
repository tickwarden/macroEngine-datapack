$scoreboard players set $cd_dur macro.tmp $(duration)
execute store result score $cd_now macro.tmp run scoreboard players get $epoch macro.time
scoreboard players operation $cd_now macro.tmp += $cd_dur macro.tmp
$execute store result storage macro:engine cooldowns.$(player).$(key) int 1 run scoreboard players get $cd_now macro.tmp
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cooldown/set ","color":"aqua"},{"text":"→ ","color":"#555555"},{"text":"$(player)","color":"white"},{"text":":","color":"#555555"},{"text":"$(key)","color":"aqua"},{"text":" for ","color":"#555555"},{"text":"$(duration)","color":"green"},{"text":"t","color":"#555555"}]}
