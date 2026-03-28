execute store result score $ce_base macro.tmp run scoreboard players get $epoch macro.time
scoreboard players operation $ce_exp macro.tmp = $ce_base macro.tmp

$execute if data storage macro:engine cooldowns.$(player).$(key) run execute store result score $ce_exp macro.tmp run data get storage macro:engine cooldowns.$(player).$(key)

execute if score $ce_exp macro.tmp <= $ce_base macro.tmp run scoreboard players operation $ce_exp macro.tmp = $ce_base macro.tmp

$scoreboard players set $ce_amt macro.tmp $(amount)
scoreboard players operation $ce_exp macro.tmp += $ce_amt macro.tmp

$execute store result storage macro:engine cooldowns.$(player).$(key) int 1 run scoreboard players get $ce_exp macro.tmp

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cooldown/extend ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":":","color":"#555555"},{"text":"$(key)","color":"aqua"},{"text":" +$(amount)t","color":"green"},{"text":" → exp=","color":"#555555"},{"score":{"name":"$ce_exp","objective":"macro.tmp"},"color":"yellow"}]
