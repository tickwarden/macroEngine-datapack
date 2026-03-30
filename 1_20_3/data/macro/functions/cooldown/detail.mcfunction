data merge storage macro:output {active:0b,remaining:0,expires:0}

$execute unless data storage macro:engine cooldowns.$(player).$(key) run return 0

$execute store result score $cdd_exp macro.tmp run data get storage macro:engine cooldowns.$(player).$(key)
execute store result storage macro:output expires int 1 run scoreboard players get $cdd_exp macro.tmp

execute store result score $cdd_now macro.tmp run scoreboard players get $epoch macro.time

execute if score $cdd_now macro.tmp < $cdd_exp macro.tmp run data modify storage macro:output active set value 1b

scoreboard players operation $cdd_exp macro.tmp -= $cdd_now macro.tmp
execute if score $cdd_exp macro.tmp matches 1.. run execute store result storage macro:output remaining int 1 run scoreboard players get $cdd_exp macro.tmp

$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cooldown/detail ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"},{"text":" active=","color":"#555555"},{"storage":"macro:output","nbt":"active","color":"green"},{"text":" rem=","color":"#555555"},{"storage":"macro:output","nbt":"remaining","color":"green"},{"text":" exp=","color":"#555555"},{"storage":"macro:output","nbt":"expires","color":"green"}]}
