data modify storage macro:output result set value 1b

$execute unless data storage macro:engine cooldowns.$(player).$(key) run return 0

$execute store result score $cd_exp macro.tmp run data get storage macro:engine cooldowns.$(player).$(key)
execute store result score $cd_now macro.tmp run scoreboard players get $epoch macro.time

execute if score $cd_now macro.tmp < $cd_exp macro.tmp run data modify storage macro:output result set value 0b
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cooldown/check ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]}
