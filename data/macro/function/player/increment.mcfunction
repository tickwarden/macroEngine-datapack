$execute store result score $pvar macro.tmp run data get storage macro:engine players.$(player).$(key)
scoreboard players add $pvar macro.tmp 1
$execute store result storage macro:engine players.$(player).$(key) int 1 run scoreboard players get $pvar macro.tmp
execute store result storage macro:output result int 1 run scoreboard players get $pvar macro.tmp
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/increment ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]
