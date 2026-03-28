scoreboard players set $st_tog macro.tmp 0
$execute if data storage macro:engine {states:{$(player):"$(on)"}} run scoreboard players set $st_tog macro.tmp 1

$execute if score $st_tog macro.tmp matches 1 run data modify storage macro:engine states.$(player) set value "$(off)"
$execute if score $st_tog macro.tmp matches 0 run data modify storage macro:engine states.$(player) set value "$(on)"

data remove storage macro:output result
$data modify storage macro:output result set from storage macro:engine states.$(player)

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"state/toggle ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" (","color":"#555555"},{"text":"$(on)","color":"gray"},{"text":"↔","color":"#555555"},{"text":"$(off)","color":"gray"},{"text":") → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]
