$scoreboard players set $dvm_v macro.tmp $(value)
$scoreboard players set $dvm_d macro.tmp $(divisor)

execute if score $dvm_d macro.tmp matches ..0 run data modify storage macro:output quotient set value 0
execute if score $dvm_d macro.tmp matches ..0 run data modify storage macro:output remainder set value 0
execute if score $dvm_d macro.tmp matches ..0 run return 0

scoreboard players operation $dvm_q macro.tmp = $dvm_v macro.tmp
scoreboard players operation $dvm_q macro.tmp /= $dvm_d macro.tmp
execute store result storage macro:output quotient int 1 run scoreboard players get $dvm_q macro.tmp

scoreboard players operation $dvm_v macro.tmp %= $dvm_d macro.tmp
execute if score $dvm_v macro.tmp matches ..-1 run scoreboard players operation $dvm_v macro.tmp += $dvm_d macro.tmp
execute store result storage macro:output remainder int 1 run scoreboard players get $dvm_v macro.tmp

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/divmod ","color":"aqua"},{"text":"($(value)/$(divisor))","color":"gray"},{"text":" → ","color":"#555555"},{"text":"q=","color":"gray"},{"storage":"macro:output","nbt":"quotient","color":"green"},{"text":" r=","color":"gray"},{"storage":"macro:output","nbt":"remainder","color":"green"}]
