scoreboard players set $ftgl macro.tmp 0
$execute if data storage macro:engine flags.$(key) run scoreboard players set $ftgl macro.tmp 1

$execute if score $ftgl macro.tmp matches 1 run data remove storage macro:engine flags.$(key)
execute if score $ftgl macro.tmp matches 1 run data modify storage macro:output result set value 0b

$execute if score $ftgl macro.tmp matches 0 run data modify storage macro:engine flags.$(key) set value 1b
execute if score $ftgl macro.tmp matches 0 run data modify storage macro:output result set value 1b
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"flag/toggle ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]
