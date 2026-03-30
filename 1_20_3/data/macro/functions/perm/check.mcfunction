scoreboard players set $pc_pid macro.tmp 0
$execute store result score $pc_pid macro.tmp run data get storage macro:engine player_pids.$(player)
execute if score $pc_pid macro.tmp matches 0 run return 0

execute as @a if score @s macro.pid = $pc_pid macro.tmp run execute if entity @s[tag=macro.admin] run return 1

$execute as @a if score @s macro.pid = $pc_pid macro.tmp run execute if entity @s[tag=perm.$(perm)] run return 1

$execute as @a if score @s macro.pid = $pc_pid macro.tmp run tellraw @s {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" — you don't have this permission.","color":"red"}]}
return 0
