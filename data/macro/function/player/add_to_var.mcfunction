$execute store result score $pvar macro.tmp run data get storage macro:engine players.$(player).$(key)
$scoreboard players set $pamount macro.tmp $(amount)
scoreboard players operation $pvar macro.tmp += $pamount macro.tmp
$execute store result storage macro:engine players.$(player).$(key) int 1 run scoreboard players get $pvar macro.tmp
execute store result storage macro:output result int 1 run scoreboard players get $pvar macro.tmp
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/add_to_var ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]
