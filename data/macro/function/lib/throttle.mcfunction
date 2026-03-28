scoreboard players set $thr_go macro.tmp 1

$execute if data storage macro:engine throttle.$(key) run execute store result score $thr_exp macro.tmp run data get storage macro:engine throttle.$(key)
execute store result score $thr_now macro.tmp run scoreboard players get $epoch macro.time
$execute if data storage macro:engine throttle.$(key) run execute if score $thr_now macro.tmp < $thr_exp macro.tmp run scoreboard players set $thr_go macro.tmp 0

$execute if score $thr_go macro.tmp matches 0 run execute as @a[tag=macro.debug] run tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/throttle ","color":"aqua"},{"text":"SKIP ","color":"#FF5555"},{"text":"$(key)","color":"aqua"},{"text":" — throttled, skipped","color":"#555555"}]
execute if score $thr_go macro.tmp matches 0 run return 0

$scoreboard players set $thr_int macro.tmp $(interval)
scoreboard players operation $thr_now macro.tmp += $thr_int macro.tmp
$execute store result storage macro:engine throttle.$(key) int 1 run scoreboard players get $thr_now macro.tmp

function macro:lib/queue_add with storage macro:input {}
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/throttle ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"}]
