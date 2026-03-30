data modify storage macro:output result set value 0b

scoreboard players set $ph_pid macro.tmp 0
$execute store result score $ph_pid macro.tmp run data get storage macro:engine player_pids.$(player)

execute as @a if score @s macro.pid = $ph_pid macro.tmp run execute if entity @s[tag=macro.admin] run data modify storage macro:output result set value 1b
$execute as @a if score @s macro.pid = $ph_pid macro.tmp run execute if entity @s[tag=perm.$(perm)] run data modify storage macro:output result set value 1b

$execute if data storage macro:engine permissions.$(player).$(perm) run data modify storage macro:output result set value 1b

$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/has ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(perm)","color":"aqua"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]}
