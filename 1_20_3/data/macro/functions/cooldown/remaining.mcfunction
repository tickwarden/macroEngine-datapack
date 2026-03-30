data modify storage macro:output result set value 0
$execute unless data storage macro:engine cooldowns.$(player).$(key) run return 0

$execute store result score $cd_exp macro.tmp run data get storage macro:engine cooldowns.$(player).$(key)
execute store result score $cd_now macro.tmp run scoreboard players get $epoch macro.time

scoreboard players operation $cd_exp macro.tmp -= $cd_now macro.tmp
execute if score $cd_exp macro.tmp matches 1.. run execute store result storage macro:output result int 1 run scoreboard players get $cd_exp macro.tmp
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cooldown/remaining ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]}
