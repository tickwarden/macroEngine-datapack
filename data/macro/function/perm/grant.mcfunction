execute if entity @s unless entity @s[tag=macro.admin] run return run tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

$data modify storage macro:engine permissions.$(player).$(perm) set value 1b

scoreboard players set $pg_pid macro.tmp 0
$execute store result score $pg_pid macro.tmp run data get storage macro:engine player_pids.$(player)
$execute as @a if score @s macro.pid = $pg_pid macro.tmp run tag @s add perm.$(perm)
$advancement grant @a[name=$(player),limit=1] only macro:perm/$(perm)

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/grant ","color":"aqua"},{"text":"✔ ","color":"green"},{"text":"$(player)","color":"white"},{"text":" ← ","color":"#555555"},{"text":"$(perm)","color":"aqua"}]
