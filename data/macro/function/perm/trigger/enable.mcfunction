scoreboard players set $pte_pid macro.tmp 0
$execute store result score $pte_pid macro.tmp run data get storage macro:engine player_pids.$(player)
execute if score $pte_pid macro.tmp matches 0 run return 0

data modify storage macro:engine _pte_tmp set value {result:0b}
execute as @a if score @s macro.pid = $pte_pid macro.tmp run execute if entity @s[tag=macro.admin] run data modify storage macro:engine _pte_tmp.result set value 1b
$execute if data storage macro:engine permissions.$(player).$(perm) run data modify storage macro:engine _pte_tmp.result set value 1b

$execute if data storage macro:engine _pte_tmp{result:0b} run execute as @a if score @s macro.pid = $pte_pid macro.tmp run tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" — you don't have this permission.","color":"red"}]
execute if data storage macro:engine _pte_tmp{result:0b} run return 0

$execute as @a if score @s macro.pid = $pte_pid macro.tmp run scoreboard players enable @s $(name)

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/trigger/enable ","color":"aqua"},{"text":"✔ ","color":"green"},{"text":"$(player)","color":"white"},{"text":" — ","color":"#555555"},{"text":"$(name)","color":"aqua"},{"text":" enabled","color":"#555555"}]
data remove storage macro:engine _pte_tmp
