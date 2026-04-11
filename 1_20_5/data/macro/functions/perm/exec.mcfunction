scoreboard players set $pex_pid macro.tmp 0
$execute store result score $pex_pid macro.tmp run data get storage macro:engine player_pids.$(player)
execute if score $pex_pid macro.tmp matches 0 run return 0

data modify storage macro:engine _pex_tmp set value {result:0b}
execute as @a if score @s macro.pid = $pex_pid macro.tmp run execute if entity @s[tag=macro.admin] run data modify storage macro:engine _pex_tmp.result set value 1b
$execute if data storage macro:engine permissions.$(player).$(perm) run data modify storage macro:engine _pex_tmp.result set value 1b

$execute if data storage macro:engine _pex_tmp{result:0b} run execute as @a if score @s macro.pid = $pex_pid macro.tmp run tellraw @s {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" — you don't have this permission.","color":"red"}]}
execute if data storage macro:engine _pex_tmp{result:0b} run return 0

$execute as @a if score @s macro.pid = $pex_pid macro.tmp at @s run $(cmd)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/exec ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" [","color":"#555555"},{"text":"$(perm)","color":"aqua"},{"text":"] → ","color":"#555555"},{"text":"$(cmd)","color":"green"}]}
data remove storage macro:engine _pex_tmp
